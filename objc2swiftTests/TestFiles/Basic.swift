class TestClass {
	func multiplier() -> Int {
		return 2
	}

	func add(value: Int, to otherValue: Int) -> Int {
		var multiplier: Int = self.multiplier()
		return multiplier * (value + otherValue)
	}
}
