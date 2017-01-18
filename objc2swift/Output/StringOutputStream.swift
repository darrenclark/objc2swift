import Foundation

class StringOutputStream: OutputStream {
	fileprivate(set) var stringValue = ""
	
	func write(_ string: String) {
		stringValue += string
	}
}
