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
	
	let outputStream = StringOutputStream()
	let converter = Converter(outputStream: outputStream)
	converter.convertTranslationUnit(tu)
	
	print(outputStream.stringValue)
}
catch {
	exit(EXIT_FAILURE)
}
