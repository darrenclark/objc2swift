class Converter {
	var outputStream: OutputStreamType
	
	init(outputStream: OutputStreamType) {
		self.outputStream = outputStream
	}
}


extension Converter {
	func convertTranslationUnit(tu: TranslationUnit) {
		tu.cursor.visitChildren { cursor, _ in
			
			if cursor.kind == .ObjCImplementationDecl {
				self.convertClass(cursor)
				return .Break
			}
			else {
				return .Recurse
			}
		}
	}
	
	func convertClass(cursor: Cursor) {
		outputStream.writeLine("class \(cursor.spelling) {")
		
		cursor.visitChildren { child, _ in
			if child.kind == .ObjCInstanceMethodDecl {
				self.convertInstanceMethod(child)
			}
			return .Continue
		}
		
		outputStream.writeLine("}")
	}
	
	func convertInstanceMethod(cursor: Cursor) {
		outputStream.writeLine("func \(cursor.spelling) { }")
	}
}

