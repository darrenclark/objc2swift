class CodeGenerator {
	var outputStream: OutputStreamType
	var indentLevel = 0
	
	init(outputStream: OutputStreamType) {
		self.outputStream = outputStream
	}
}

extension CodeGenerator {
	func writeAST(nodes: [ASTNode]) {
		for node in nodes {
			writeNode(node)
		}
	}
	
	func writeNode(node: ASTNode) {
		switch node {
		case let .ClassImpl(name: name, children: children):
			writeClass(name: name, children: children)
			
		case let .InstanceMethodDecl(name: name, returns: returns, args: arguments, body: body):
			writeInstanceMethodDecl(name: name, returns: returns, arguments: arguments, body: body)
			
		case let .CodeBlock(children: children):
			writeCodeBlock(children: children)
			
		case let .Return(expression: expression):
			insertIndent()
			outputStream.write("return ")
			writeNode(expression)
			outputStream.write("\n")
			
		case let .IntegerLiteral(stringValue: stringValue):
			outputStream.write(stringValue)
			
		case let .VariableDecl(name: name, type: type, value: value):
			insertIndent()
			outputStream.write("var \(name): \(type) = ")
			writeNode(value)
			outputStream.write("\n")
			
		case let .ObjCMessage(target: target, selector: selector):
			outputStream.write("\(target).\(selector)()")
			
		case let .BinaryOperator(op: op, lhs: lhs, rhs: rhs):
			writeNode(lhs)
			outputStream.write(" \(op) ")
			writeNode(rhs)
			
		case let .VariableRef(name: name):
			outputStream.write(name)
		
		case let .Parenthesis(inner: inner):
			outputStream.write("(")
			writeNode(inner)
			outputStream.write(")")
		}
	}
}

extension CodeGenerator {
	func writeClass(name name: String, children: [ASTNode]) {
		insertIndent()
		outputStream.write("class \(name) {\n")
		
		indentLevel++
		
		for node in children {
			writeNode(node)
		}
		
		indentLevel--
		
		outputStream.write("}\n\n")
		
	}
	
	func writeInstanceMethodDecl(name name: String, returns: String, arguments: [FunctionArgDecl], body: ASTNode) {
		insertIndent()
		outputStream.write("func \(name)(")
		
		let argumentsString = arguments.map { arg -> String in
			if let label = arg.label {
				return "\(label) \(arg.name): \(arg.type)"
			}
			else {
				return "\(arg.name): \(arg.type)"
			}
		}
		.joinWithSeparator(", ")
		
		outputStream.write(argumentsString)
		outputStream.write(") -> \(returns)")
		
		writeNode(body)
		
		outputStream.write("\n")
	}
	
	func writeCodeBlock(children children: [ASTNode]) {
		outputStream.write(" {\n")
		indentLevel++
		
		for child in children {
			writeNode(child)
		}
		
		indentLevel--
		insertIndent()
		outputStream.write("}\n")
	}
}

extension CodeGenerator {
	func insertIndent() {
		for _ in 0..<indentLevel {
			outputStream.write("\t")
		}
	}
}
