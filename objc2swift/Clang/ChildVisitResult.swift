enum ChildVisitResult {
	case `break`
	case `continue`
	case recurse
}

extension ChildVisitResult: RawRepresentable {
	init?(rawValue: CXChildVisitResult) {
		switch rawValue {
		case CXChildVisit_Break: self = .break
		case CXChildVisit_Continue: self = .continue
		case CXChildVisit_Recurse: self = .recurse
		default: return nil
		}
	}
	
	var rawValue: CXChildVisitResult {
		switch self {
		case .break: return CXChildVisit_Break
		case .continue: return CXChildVisit_Continue
		case .recurse: return CXChildVisit_Recurse
		}
	}
}


func ~=(lhs: CXChildVisitResult, rhs: CXChildVisitResult) -> Bool {
	return lhs == rhs
}
