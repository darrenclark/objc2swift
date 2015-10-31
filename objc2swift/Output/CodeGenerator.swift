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
			
		case let .InstanceMethodDecl(name: name, args: arguments):
			writeInstanceMethodDecl(name: name, arguments: arguments)
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
	
	func writeInstanceMethodDecl(name name: String, arguments: [FunctionArgDecl]) {
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
		outputStream.write(") { }\n")
	}
}

extension CodeGenerator {
	func insertIndent() {
		for _ in 0..<indentLevel {
			outputStream.write("\t")
		}
	}
}
