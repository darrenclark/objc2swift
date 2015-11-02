class Tokens: CollectionType {
	let translationUnit: TranslationUnit
	let tokens: UnsafeBufferPointer<CXToken>
	
	init(translationUnit: TranslationUnit, range: CXSourceRange) {
		self.translationUnit = translationUnit
		
		var tokens: UnsafeMutablePointer<CXToken> = nil
		var numTokens: UInt32 = 0
		
		clang_tokenize(translationUnit.raw, range, &tokens, &numTokens)
		
		self.tokens = UnsafeBufferPointer(start: tokens, count: Int(numTokens))
	}
	
	deinit {
		clang_disposeTokens(translationUnit.raw, UnsafeMutablePointer(tokens.baseAddress), UInt32(tokens.count))
	}
}

extension Tokens: Indexable {
	var startIndex: Int {
		return 0
	}
	
	var endIndex: Int {
		return Int(tokens.count)
	}
	
	subscript (position: Int) -> Token {
		if startIndex..<endIndex ~= position {
			return Token(raw: tokens[position], parentCollection: self)
		}
		else {
			preconditionFailure("Out of bounds")
		}
	}
}
