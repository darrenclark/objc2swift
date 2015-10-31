class ASTConverter {
	private(set) var nodes = [ASTNode]()
}


extension ASTConverter {
	func convertTranslationUnit(tu: TranslationUnit) {
		let convertedNodes = tu.cursor.children.map { cursor -> ASTNode? in
			switch cursor.kind {
			case .ObjCImplementationDecl: return self.convertClass(cursor)
			default: return nil
			}
		}
		.flatMap { node in node }
		
		nodes.appendContentsOf(convertedNodes)
	}
	
	func convertClass(cursor: Cursor) -> ASTNode {
		let children = cursor.children.map { (childCursor) -> ASTNode? in
			if childCursor.kind == .ObjCInstanceMethodDecl {
				return convertInstanceMethod(childCursor)
			}
			else {
				return nil
			}
		}
		.flatMap { node in node }
		
		return ASTNode.ClassImpl(name: cursor.spelling, children: children)
	}
	
	func convertInstanceMethod(cursor: Cursor) -> ASTNode {
		let segments = cursor.spelling.componentsSeparatedByString(":").filter { str in !str.isEmpty }
		assert(segments.count >= 1)
		
		let name = segments.first!
		let returns = cursor.resultType.spelling
		let arguments: [FunctionArgDecl]
		
		let rawArgs = readArguments(cursor)
		if rawArgs.count > 0 {
			let (firstArgName, firstArgType) = rawArgs.first!
			let firstArgDecl = FunctionArgDecl(label: nil, name: firstArgName, type: firstArgType)
			
			let rest = zip(segments[1..<segments.count], rawArgs[1..<rawArgs.count])
			let restArgDecls = rest.map { (segment, rawArg) -> FunctionArgDecl in
				let (argName, argType) = rawArg
				return FunctionArgDecl(label: segment, name: argName, type: argType)
			}
			
			arguments = [firstArgDecl] + restArgDecls
		}
		else {
			arguments = []
		}
		
		return ASTNode.InstanceMethodDecl(name: name, returns: returns, args: arguments)
	}
	
	func readArguments(cursor: Cursor) -> [(name: String, type: String)] {
		return cursor.children.filter { child in
			return child.kind == .ParmDecl
		}.map { param in
			return (param.spelling, param.type.spelling)
		}
	}
}
