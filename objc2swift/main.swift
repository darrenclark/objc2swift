//
//  main.swift
//  objc2swift
//
//  Created by Darren Clark on 2015-10-30.
//  Copyright © 2015 Darren Clark. All rights reserved.
//

import Foundation

let file = Process.arguments[1]


let index = Index(excludeDeclarationsFromPCH: true, displayDiagnostics: false)
do {
	let tu = try TranslationUnit(index: index, path: file)
	
	tu.cursor.visitChildren { cursor, parent in
		if clang_getCursorKind(cursor) == CXCursor_ObjCImplementationDecl {
			let cxname = clang_getCursorSpelling(cursor)
			defer {
				clang_disposeString(cxname)
			}
			
			let cname = clang_getCString(cxname)
			let name = String.fromCString(cname)
			
			print("Class implementation found!: \(name)")
		}
		
		return .Recurse
	}
}
catch {
	exit(EXIT_FAILURE)
}
