typealias Type = CXType

extension Type {
	
	var spelling: String {
		return clang_getTypeSpelling(self).convertAndDispose()
	}
	
}
