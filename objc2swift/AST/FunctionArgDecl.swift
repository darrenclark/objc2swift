struct FunctionArgDecl {
	let label: String?
	let name: String
	let type: String
	
	init(label: String?, name: String, type: String) {
		if label == name {
			self.label = nil
		}
		else {
			self.label = label
		}
		
		self.name = name
		self.type = type
	}
}