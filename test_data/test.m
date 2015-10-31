@import Foundation;

@interface TestClass: NSObject
@end

@implementation TestClass

- (int)multiplier {
	return 2
}

- (int)add:(int)value to:(int)otherValue {
	int multiplier = [self multiplier];
	return multiplier * (value + otherValue);
}

@end

