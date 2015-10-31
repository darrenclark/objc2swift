typealias Cursor = CXCursor

extension Cursor {
	
	func visitChildren(block: (cursor: Cursor, parent: Cursor) -> ChildVisitResult) {
		clang_visitChildrenWithBlock(self) { cursor, parent in
			return block(cursor: cursor, parent: parent).rawValue
		}
	}
	
}
