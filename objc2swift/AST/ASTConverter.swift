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
	
	func convertInstanceMethod(cursor: Cursor) -> ASTNode? {
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
		
		if let compoundStmt = cursor.firstChild(kind: .CompoundStmt), body = convertCode(compoundStmt) {
			return .InstanceMethodDecl(name: name, returns: returns, args: arguments, body: body)
		}
		else {
			return nil
		}
	}
	
	func readArguments(cursor: Cursor) -> [(name: String, type: String)] {
		return cursor.children.filter { child in
			return child.kind == .ParmDecl
		}.map { param in
			return (param.spelling, param.type.spelling)
		}
	}
	
	func convertCode(cursor: Cursor) -> ASTNode? {
		switch cursor.kind {
		case .CompoundStmt:
			let childNodes = cursor.children.map(convertCode).flatMap { node in node }
			return .CodeBlock(children: childNodes)
			
		case .ReturnStmt:
			if let first = cursor.children.first, node = convertCode(first) {
				return .Return(expression: node)
			}
			else {
				return nil
			}
			
			
		case .IntegerLiteral:
			let tokens = Tokens(translationUnit: cursor.translationUnit, range: cursor.extent)
			return .IntegerLiteral(stringValue: tokens.first!.spelling)
		
		case .DeclStmt:
			return convertCode(cursor.children.first!)
		
		case .VarDecl:
			if let first = cursor.children.first, value = convertCode(first) {
				return .VariableDecl(name: cursor.spelling, type: cursor.type.spelling, value: value)
			}
			else {
				return nil
			}
			
		case .ObjCMessageExpr:
			guard let firstChild = cursor.children.first where firstChild.kind == .FirstExpr else {
				print("ObjCMessageExpr - FirstExpr not found")
				return nil
			}
			guard let target = firstChild.children.first?.spelling else {
				return nil
			}
			
			let selector = cursor.spelling
			
			return .ObjCMessage(target: target, selector: selector)
			
		default:
			print("Unexpected kind: \(cursor.kind)")
			return nil
		}
	}
}
