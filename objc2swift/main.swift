//
//  main.swift
//  objc2swift
//
//  Created by Darren Clark on 2015-10-30.
//  Copyright © 2015 Darren Clark. All rights reserved.
//

import Foundation

let index = clang_createIndex(1, 0)
defer {
	clang_disposeIndex(index)
}

let file = Process.arguments[1]

let tu = clang_createTranslationUnitFromSourceFile(index, file, 0, nil, 0, nil)
if tu != nil {
	defer {
		clang_disposeTranslationUnit(tu)
	}
	
	clang_visitChildrenWithBlock(clang_getTranslationUnitCursor(tu)) { cursor, parent in
		
		if clang_getCursorKind(cursor) == CXCursor_ObjCImplementationDecl {
			let cxname = clang_getCursorSpelling(cursor)
			defer {
				clang_disposeString(cxname)
			}
			
			let cname = clang_getCString(cxname)
			let name = String.fromCString(cname)
			
			print("Class implementation found!: \(name)")
		}
		
		return CXChildVisit_Recurse
	}
	
	
}
