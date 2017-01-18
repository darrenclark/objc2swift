import Foundation

extension OutputStream {
	func writeLine(_ line: String) {
  
    write(line, maxLength: line.characters.count)
    write("\n", maxLength: 1)
	}
}
