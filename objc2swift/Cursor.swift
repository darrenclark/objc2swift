struct Cursor {
	let raw: CXCursor
	
	init?(raw: CXCursor) {
		self.raw = raw
		if clang_Cursor_isNull(raw) != 0 {
			return nil
		}
	}
}

extension Cursor {
	
	var kind: CursorKind {
		return CursorKind(rawValue: clang_getCursorKind(raw))!
	}
	
	var spelling: String {
		return clang_getCursorSpelling(raw).convertAndDispose()
	}
	
}

extension Cursor {
	
	func visitChildren(block: (cursor: Cursor, parent: Cursor) -> ChildVisitResult) {
		clang_visitChildrenWithBlock(raw) { rawCursor, rawParent in
			let cursor = Cursor(raw: rawCursor)!
			let parent = Cursor(raw: rawParent)!
			
			return block(cursor: cursor, parent: parent).rawValue
		}
	}
	
}
