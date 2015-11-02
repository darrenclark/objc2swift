public typealias Type = CXType

extension Type {
	
	var spelling: String {
		return clang_getTypeSpelling(self).convertAndDispose()
	}
	
	var canonicalType: Type {
		return clang_getCanonicalType(self)
	}
	
}

extension Type {
	
	var swiftType: String {
		switch kind {
		case CXType_Void: return "Void"
		case CXType_Bool: return "Bool"
		case CXType_UShort: return "UInt16"
		case CXType_UInt: return "UInt"
		case CXType_ULong: return "UInt"
		case CXType_ULongLong: return "UInt64"
		case CXType_Short: return "Int16"
		case CXType_Int: return "Int"
		case CXType_Long: return "Int"
		case CXType_LongLong: return "Int64"
		case CXType_Float: return "Float"
		case CXType_Double: return "Double"
		case CXType_ObjCId: return "AnyObject"
		case CXType_ObjCClass: return "AnyClass"
		case CXType_ObjCSel: return "Selector"
		
		//TODO: Cases for rest of types
		default: return spelling
		}
	}
	
}

extension Type: Equatable {}

public func ==(lhs: Type, rhs: Type) -> Bool {
	return clang_equalTypes(lhs, rhs) != 0
}


//MARK: -

func ~=(lhs: CXTypeKind, rhs: CXTypeKind) -> Bool {
	return lhs == rhs
}