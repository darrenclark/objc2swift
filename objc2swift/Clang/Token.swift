class Token {
	let parentCollection: Tokens
	let raw: CXToken
	
	init(raw: CXToken, parentCollection: Tokens) {
		self.parentCollection = parentCollection
		self.raw = raw
	}
}

extension Token {
	var spelling: String {
		return clang_getTokenSpelling(parentCollection.translationUnit.raw, raw).convertAndDispose()
	}
}
