extension OutputStreamType {
	mutating func writeLine(line: String) {
		write(line)
		write("\n")
	}
}