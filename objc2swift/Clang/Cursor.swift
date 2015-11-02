struct Cursor {
	let raw: CXCursor
	let translationUnit: TranslationUnit
	
	init?(raw: CXCursor, translationUnit: TranslationUnit) {
		self.raw = raw
		self.translationUnit = translationUnit
		if clang_Cursor_isNull(raw) != 0 {
			return nil
		}
	}
}

//MARK: - Attributes
extension Cursor {
	
	var kind: CursorKind {
		return CursorKind(rawValue: clang_getCursorKind(raw))!
	}
	
	var spelling: String {
		return clang_getCursorSpelling(raw).convertAndDispose()
	}
	
	//MARK: -
	
	var extent: CXSourceRange {
		return clang_getCursorExtent(raw)
	}
	
	//MARK: -
	
	var type: Type {
		return clang_getCursorType(raw)
	}
	
	var resultType: Type {
		return clang_getCursorResultType(raw)
	}
	
}

//MARK: - Traversal
extension Cursor {
	
	func visitChildren(block: (cursor: Cursor, parent: Cursor) -> ChildVisitResult) {
		clang_visitChildrenWithBlock(raw) { rawCursor, rawParent in
			let cursor = Cursor(raw: rawCursor, translationUnit: self.translationUnit)!
			let parent = Cursor(raw: rawParent, translationUnit: self.translationUnit)!
			
			return block(cursor: cursor, parent: parent).rawValue
		}
	}
	
	var children: [Cursor] {
		var result = [Cursor]()
		visitChildren { child, _ in
			result.append(child)
			return .Continue
		}
		return result
	}
	
	func firstChild(kind kind: CursorKind) -> Cursor? {
		let children = self.children
		let index = children.indexOf { cursor in cursor.kind == kind }
		return index.map { index in children[index] }
	}
	
}


//MARK: Debugging
extension Cursor: CustomDebugStringConvertible {
	var debugDescription: String {
		var retVal = "\(kind) - \(spelling)\n"
		
		for child in children {
			child.debugDescription.enumerateLines { line, _ in
				retVal += "\t\(line)\n"
			}
		}
		
		return retVal
	}
}
