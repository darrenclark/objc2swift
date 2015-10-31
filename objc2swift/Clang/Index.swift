class Index {
	let raw: CXIndex
	
	init(excludeDeclarationsFromPCH: Bool, displayDiagnostics: Bool) {
		raw = clang_createIndex(
			excludeDeclarationsFromPCH ? 1 : 0,
			displayDiagnostics ? 1 : 0
		)
	}
	
	deinit {
		clang_disposeIndex(raw)
	}
}
