enum ChildVisitResult {
	case Break
	case Continue
	case Recurse
}

extension ChildVisitResult: RawRepresentable {
	init?(rawValue: CXChildVisitResult) {
		switch rawValue {
		case CXChildVisit_Break: self = .Break
		case CXChildVisit_Continue: self = .Continue
		case CXChildVisit_Recurse: self = .Recurse
		default: return nil
		}
	}
	
	var rawValue: CXChildVisitResult {
		switch self {
		case .Break: return CXChildVisit_Break
		case .Continue: return CXChildVisit_Continue
		case .Recurse: return CXChildVisit_Recurse
		}
	}
}


func ~=(lhs: CXChildVisitResult, rhs: CXChildVisitResult) -> Bool {
	return lhs == rhs
}
