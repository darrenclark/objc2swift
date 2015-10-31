extension CXString {
	
	func convertAndDispose() -> String {
		defer {
			clang_disposeString(self)
		}
		
		let cString = clang_getCString(self)
		// TODO: Safe to force unwrap? Can this be non-UTF8? (I assume clang uses UTF8 internally?)
		return String.fromCString(cString)!
	}
	
}