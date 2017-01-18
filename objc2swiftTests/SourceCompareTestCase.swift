import XCTest

class SourceCompareTestCase: XCTestCase {
	
	var baseFilename: String {
		preconditionFailure("Override in subclass")
	}
	
	var bundle: Bundle {
		return Bundle(for: type(of: self))
	}
	
	//MARK: -
	
	func test() {
		do {
			let convertedSwift = try convertObjectiveCFile()
			guard let referenceSwiftPath = bundle.path(forResource: baseFilename, ofType: "swift") else {
				XCTFail("Not found: \(baseFilename).swift")
				return
			}
			
			let (exitCode, stdout) = shellExec(
				path: "/usr/bin/diff",
				args: ["-uBb", referenceSwiftPath, "-"],
				stdin: convertedSwift
			)
			
			if exitCode != 0 {
				XCTFail("Unexpected output:\n\(stdout)")
			}
		}
		catch {
			XCTFail("Failed to compile \(baseFilename).m")
		}
	}
	
	override func run() {
		// Only run subclasses
		if type(of: self) != SourceCompareTestCase.self {
			super.run()
		}
	}
	
	//MARK: -
	
	func convertObjectiveCFile() throws -> String {
		guard let path = bundle.path(forResource: baseFilename, ofType: "m") else {
			XCTFail("Not found: \(baseFilename).m")
			throw NSError(domain: "NotFound", code: 0, userInfo: nil)
		}
		
		let index = Index(excludeDeclarationsFromPCH: true, displayDiagnostics: false)
	
		let tu = try TranslationUnit(index: index, path: path)
		
		let converter = ASTConverter()
		converter.convertTranslationUnit(tu)
		
		let outputStream = StringOutputStream()
		let codeGenerator = CodeGenerator(outputStream: outputStream)
		codeGenerator.writeAST(converter.nodes)
		
		return outputStream.stringValue
	}
	
	func shellExec(path: String, args: [String], stdin: String) -> (exitCode: Int, stdout: String) {
		let task = Process()
		task.launchPath = path
		task.arguments = args
		
		let stdinPipe = Pipe()
		task.standardInput = stdinPipe
		
		let stdinData = stdin.data(using: String.Encoding.utf8)!
		stdinPipe.fileHandleForWriting.write(stdinData)
		stdinPipe.fileHandleForWriting.closeFile()
		
		let stdoutPipe = Pipe()
		task.standardOutput = stdoutPipe
		
		task.launch()
		task.waitUntilExit()
		
		let stdoutString = NSString(data: stdoutPipe.fileHandleForReading.readDataToEndOfFile(), encoding: String.Encoding.utf8.rawValue)!
		let exitCode = Int(task.terminationStatus)
		
		return (exitCode, stdoutString as String)
	}
}
