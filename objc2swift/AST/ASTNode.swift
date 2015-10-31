enum ASTNode {
	case ClassImpl(name: String, children: [ASTNode])
	case InstanceMethodDecl(name: String, args: [FunctionArgDecl])
}
