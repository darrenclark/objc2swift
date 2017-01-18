import Foundation

class CodeGenerator {
	var outputStream: OutputStream
	var indentLevel = 0
	
	init(outputStream: OutputStream) {
		self.outputStream = outputStream
	}
}

extension CodeGenerator {
	func writeAST(_ nodes: [ASTNode]) {
		for node in nodes {
			writeNode(node)
		}
	}
	
	func writeNode(_ node: ASTNode) {
		switch node {
		case let .classImpl(name: name, children: children):
			writeClass(name: name, children: children)
			
		case let .instanceMethodDecl(name: name, returns: returns, args: arguments, body: body):
			writeInstanceMethodDecl(name: name, returns: returns, arguments: arguments, body: body)
			
		case let .codeBlock(children: children):
			writeCodeBlock(children: children)
			
		case let .return(expression: expression):
			insertIndent()
			outputStream.write("return ", maxLength: [UInt8]("return ".utf8).count)
			writeNode(expression)
      outputStream.write("\n", maxLength: [UInt8]("\n".utf8).count)
			
		case let .integerLiteral(stringValue: stringValue):
			outputStream.write(stringValue, maxLength: [UInt8](stringValue.utf8).count)
			
		case let .variableDecl(name: name, type: type, value: value):
			insertIndent()
			outputStream.write("var \(name): \(type) = ", maxLength: [UInt8]("var \(name): \(type) = ".utf8).count)
			writeNode(value)
			outputStream.write("\n", maxLength: [UInt8]("\n".utf8).count)
			
		case let .objCMessage(target: target, selector: selector):
			outputStream.write("\(target).\(selector)()", maxLength: [UInt8]("\(target).\(selector)()".utf8).count)
			
		case let .binaryOperator(op: op, lhs: lhs, rhs: rhs):
			writeNode(lhs)
			outputStream.write(" \(op) ", maxLength: [UInt8](" \(op) ".utf8).count)
			writeNode(rhs)
			
		case let .variableRef(name: name):
			outputStream.write(name, maxLength: [UInt8](name.utf8).count)
		
		case let .parenthesis(inner: inner):
			outputStream.write("(", maxLength: [UInt8]("(".utf8).count)
			writeNode(inner)
			outputStream.write(")", maxLength: [UInt8](")".utf8).count)
		}
	}
}

extension CodeGenerator {
	func writeClass(name: String, children: [ASTNode]) {
		insertIndent()
		outputStream.write("class \(name) {\n", maxLength: [UInt8]("class \(name) {\n".utf8).count)
		
		indentLevel += 1
		
		for node in children {
			writeNode(node)
		}
		
		indentLevel -= 1
		
		outputStream.write("}\n\n", maxLength: [UInt8]("}\n\n".utf8).count)
		
	}
	
	func writeInstanceMethodDecl(name: String, returns: String, arguments: [FunctionArgDecl], body: ASTNode) {
		insertIndent()
		outputStream.write("func \(name)(", maxLength: [UInt8]("func \(name)(".utf8).count)
		
		let argumentsString = arguments.map { arg -> String in
			if let label = arg.label {
				return "\(label) \(arg.name): \(arg.type)"
			}
			else {
				return "\(arg.name): \(arg.type)"
			}
		}
		.joined(separator: ", ")
		
		outputStream.write(argumentsString, maxLength: [UInt8](argumentsString.utf8).count)
		outputStream.write(") -> \(returns)", maxLength: [UInt8](") -> \(returns)".utf8).count)
		
		writeNode(body)
		
		outputStream.write("\n", maxLength: [UInt8]("\n".utf8).count)
	}
	
	func writeCodeBlock(children: [ASTNode]) {
		outputStream.write(" {\n", maxLength: [UInt8](" {\n".utf8).count)
		indentLevel += 1
		
		for child in children {
			writeNode(child)
		}
		
		indentLevel -= 1
		insertIndent()
		outputStream.write("}\n", maxLength: [UInt8]("}\n".utf8).count)
	}
}

extension CodeGenerator {
	func insertIndent() {
		for _ in 0..<indentLevel {
			outputStream.write("\t", maxLength: [UInt8]("\t".utf8).count)
		}
	}
}
