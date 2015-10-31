class StringOutputStream: OutputStreamType {
	private(set) var stringValue = ""
	
	func write(string: String) {
		stringValue += string
	}
}