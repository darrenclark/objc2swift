extension CXSourceRange {
	init(begin: CXSourceLocation, end: CXSourceLocation) {
		self = clang_getRange(begin, end)
	}
	
	var start: CXSourceLocation {
		return clang_getRangeStart(self)
	}
	
	var end: CXSourceLocation {
		return clang_getRangeEnd(self)
	}
}