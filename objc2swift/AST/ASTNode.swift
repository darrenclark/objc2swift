indirect enum ASTNode {
	case classImpl(name: String, children: [ASTNode])
	case instanceMethodDecl(name: String, returns: String, args: [FunctionArgDecl], body: ASTNode)
	
	case codeBlock(children: [ASTNode])
	case `return`(expression: ASTNode)
	case integerLiteral(stringValue: String)
	case variableDecl(name: String, type: String, value: ASTNode)
	case objCMessage(target: String, selector: String)
	case binaryOperator(op: String, lhs: ASTNode, rhs: ASTNode)
	case variableRef(name: String)
	case parenthesis(inner: ASTNode)
}
