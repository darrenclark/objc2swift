import XCTest

class SourceCompareTestCase: XCTestCase {
	
	var baseFilename: String {
		preconditionFailure("Override in subclass")
	}
	
	var bundle: NSBundle {
		return NSBundle(forClass: self.dynamicType)
	}
	
	//MARK: -
	
	func test() {
		do {
			let convertedSwift = try convertObjectiveCFile()
			guard let referenceSwiftPath = bundle.pathForResource(baseFilename, ofType: "swift") else {
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
	
	override func runTest() {
		// Only run subclasses
		if self.dynamicType != SourceCompareTestCase.self {
			super.runTest()
		}
	}
	
	//MARK: -
	
	func convertObjectiveCFile() throws -> String {
		guard let path = bundle.pathForResource(baseFilename, ofType: "m") else {
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
	
	func shellExec(path path: String, args: [String], stdin: String) -> (exitCode: Int, stdout: String) {
		let task = NSTask()
		task.launchPath = path
		task.arguments = args
		
		let stdinPipe = NSPipe()
		task.standardInput = stdinPipe
		
		let stdinData = stdin.dataUsingEncoding(NSUTF8StringEncoding)!
		stdinPipe.fileHandleForWriting.writeData(stdinData)
		stdinPipe.fileHandleForWriting.closeFile()
		
		let stdoutPipe = NSPipe()
		task.standardOutput = stdoutPipe
		
		task.launch()
		task.waitUntilExit()
		
		let stdoutString = NSString(data: stdoutPipe.fileHandleForReading.readDataToEndOfFile(), encoding: NSUTF8StringEncoding)!
		let exitCode = Int(task.terminationStatus)
		
		return (exitCode, stdoutString as String)
	}
}
