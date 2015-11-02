indirect enum ASTNode {
	case ClassImpl(name: String, children: [ASTNode])
	case InstanceMethodDecl(name: String, returns: String, args: [FunctionArgDecl], body: ASTNode)
	
	case CodeBlock(children: [ASTNode])
	case Return(expression: ASTNode)
	case IntegerLiteral(stringValue: String)
	case VariableDecl(name: String, type: String, value: ASTNode)
	case ObjCMessage(target: String, selector: String)
}
