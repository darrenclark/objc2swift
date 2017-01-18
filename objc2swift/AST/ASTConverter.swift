class ASTConverter {
	fileprivate(set) var nodes = [ASTNode]()
}


extension ASTConverter {
	func convertTranslationUnit(_ tu: TranslationUnit) {
		let convertedNodes = tu.cursor.children.map { cursor -> ASTNode? in
			switch cursor.kind {
			case .objCImplementationDecl: return self.convertClass(cursor)
			default: return nil
			}
		}
		.flatMap { node in node }
		
		nodes.append(contentsOf: convertedNodes)
	}
	
	func convertClass(_ cursor: Cursor) -> ASTNode {
		let children = cursor.children.map { (childCursor) -> ASTNode? in
			if childCursor.kind == .objCInstanceMethodDecl {
				return convertInstanceMethod(childCursor)
			}
			else {
				return nil
			}
		}
		.flatMap { node in node }
		
		return ASTNode.classImpl(name: cursor.spelling, children: children)
	}
	
	func convertInstanceMethod(_ cursor: Cursor) -> ASTNode? {
		let segments = cursor.spelling.components(separatedBy: ":").filter { str in !str.isEmpty }
		assert(segments.count >= 1)
		
		let name = segments.first!
		let returns = cursor.resultType.swiftType
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
		
		if let compoundStmt = cursor.firstChild(kind: .compoundStmt), let body = convertCode(compoundStmt) {
			return .instanceMethodDecl(name: name, returns: returns, args: arguments, body: body)
		}
		else {
			return nil
		}
	}
	
	func readArguments(_ cursor: Cursor) -> [(name: String, type: String)] {
		return cursor.children.filter { child in
			return child.kind == .parmDecl
		}.map { param in
			return (param.spelling, param.type.swiftType)
		}
	}
	
	func convertCode(_ cursor: Cursor) -> ASTNode? {
		switch cursor.kind {
		case .compoundStmt:
			let childNodes = cursor.children.map(convertCode).flatMap { node in node }
			return .codeBlock(children: childNodes)
			
		case .returnStmt:
			if let first = cursor.children.first, let node = convertCode(first) {
				return .return(expression: node)
			}
			else {
				return nil
			}
			
			
		case .integerLiteral:
			let tokens = Tokens(translationUnit: cursor.translationUnit, range: cursor.extent)
			return .integerLiteral(stringValue: tokens.first!.spelling)
		
		case .declStmt:
			return convertCode(cursor.children.first!)
		
		case .varDecl:
			if let first = cursor.children.first, let value = convertCode(first) {
				return .variableDecl(name: cursor.spelling, type: cursor.type.swiftType, value: value)
			}
			else {
				return nil
			}
			
		case .objCMessageExpr:
			guard let firstChild = cursor.children.first, firstChild.kind == .firstExpr else {
				print("ObjCMessageExpr - FirstExpr not found")
				return nil
			}
			guard let target = firstChild.children.first?.spelling else {
				return nil
			}
			
			let selector = cursor.spelling
			
			return .objCMessage(target: target, selector: selector)
		
		case .binaryOperator:
			let children = cursor.children
			guard children.count == 2 else {
				print("Didn't find lhs & rhs for BinaryOperator")
				return nil
			}
			
			let lhsCursor = children[0]
			let rhsCursor = children[1]
			
			// the operator (ie. == or *) ends up being the last token on the lhs
			if let op = Tokens(cursor: lhsCursor), let lhs = convertCode(lhsCursor), let rhs = convertCode(rhsCursor) {
				return .binaryOperator(op: op[op.endIndex].spelling, lhs: lhs, rhs: rhs)
			}
			else {
				return nil
			}
		
		case .firstExpr:
			guard let firstChild = cursor.children.first else {
				print("FirstExpr didn't have a child")
				return nil
			}
			return convertCode(firstChild)
			
		case .parenExpr:
			guard let firstChild = cursor.children.first, let inner = convertCode(firstChild) else {
				print("Couldn't parse inner expression of ParenExpr")
				return nil
			}
			return .parenthesis(inner: inner)
		
		case .declRefExpr:
			return .variableRef(name: cursor.spelling)
			
		default:
			print("Unexpected kind: \(cursor.kind)")
			return nil
		}
	}
}
