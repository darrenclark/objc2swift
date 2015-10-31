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
		let segments = cursor.spelling.componentsSeparatedByString(":").filter { str in !str.isEmpty }
		assert(segments.count >= 1)
		
		outputStream.write("func \(segments.first!)(")
		
		let args = readArguments(cursor)
		if args.count > 0 {
			let (firstArgName, firstArgType) = args.first!
			outputStream.write("\(firstArgName): \(firstArgType)")
			
			let rest = zip(segments[1..<segments.count], args[1..<args.count])
			for (segment, (name: argName, type: argType)) in rest {
				outputStream.write(", \(segment) \(argName): \(argType)")
			}
		}
		
		outputStream.write(") -> \(cursor.resultType.spelling) {\n")
		
		for child in cursor.children {
			outputStream.writeLine("\(child.kind)")
		}
		
		outputStream.writeLine("}")
	}
	
	func readArguments(cursor: Cursor) -> [(name: String, type: String)] {
		return cursor.children.filter { child in
			return child.kind == .ParmDecl
		}.map { param in
			return (param.spelling, param.type.spelling)
		}
	}
}
