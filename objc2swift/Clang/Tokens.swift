class Tokens: Collection {
  /// Returns the position immediately after the given index.
  ///
  /// - Parameter i: A valid index of the collection. `i` must be less than
  ///   `endIndex`.
  /// - Returns: The index value immediately after `i`.
  public func index(after i: Int) -> Int {
    return i + 1
  }

	let translationUnit: TranslationUnit
	let tokens: UnsafeBufferPointer<CXToken>
	
	init(translationUnit: TranslationUnit, range: CXSourceRange) {
		self.translationUnit = translationUnit
		
		var tokens: UnsafeMutablePointer<CXToken>? = nil
		var numTokens: UInt32 = 0
		
		clang_tokenize(translationUnit.raw, range, &tokens, &numTokens)
		
		self.tokens = UnsafeBufferPointer(start: tokens, count: Int(numTokens))
	}
	
	convenience init?(cursor: Cursor) {
    if cursor.children.count == 0 { return nil }
		self.init(translationUnit: cursor.translationUnit, range: cursor.extent)
	}
	
	deinit {
		clang_disposeTokens(translationUnit.raw, UnsafeMutablePointer(mutating: tokens.baseAddress), UInt32(tokens.count))
	}
}

extension Tokens {
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

extension Tokens: CustomStringConvertible {
	var description: String {
		let spellings = map { token in token.spelling } .joined(separator: " ")
		return "Tokens: [\(spellings)]"
	}
}
