enum CursorKind {
	case UnexposedDecl
	case StructDecl
	case UnionDecl
	case ClassDecl
	case EnumDecl
	case FieldDecl
	case EnumConstantDecl
	case FunctionDecl
	case VarDecl
	case ParmDecl
	case ObjCInterfaceDecl
	case ObjCCategoryDecl
	case ObjCProtocolDecl
	case ObjCPropertyDecl
	case ObjCIvarDecl
	case ObjCInstanceMethodDecl
	case ObjCClassMethodDecl
	case ObjCImplementationDecl
	case ObjCCategoryImplDecl
	case TypedefDecl
	case CXXMethod
	case Namespace
	case LinkageSpec
	case Constructor
	case Destructor
	case ConversionFunction
	case TemplateTypeParameter
	case NonTypeTemplateParameter
	case TemplateTemplateParameter
	case FunctionTemplate
	case ClassTemplate
	case ClassTemplatePartialSpecialization
	case NamespaceAlias
	case UsingDirective
	case UsingDeclaration
	case TypeAliasDecl
	case ObjCSynthesizeDecl
	case ObjCDynamicDecl
	case CXXAccessSpecifier
	case FirstDecl
	case LastDecl
	case FirstRef
	case ObjCSuperClassRef
	case ObjCProtocolRef
	case ObjCClassRef
	case TypeRef
	case CXXBaseSpecifier
	case TemplateRef
	case NamespaceRef
	case MemberRef
	case LabelRef
	case OverloadedDeclRef
	case VariableRef
	case LastRef
	case FirstInvalid
	case InvalidFile
	case NoDeclFound
	case NotImplemented
	case InvalidCode
	case LastInvalid
	case FirstExpr
	case UnexposedExpr
	case DeclRefExpr
	case MemberRefExpr
	case CallExpr
	case ObjCMessageExpr
	case BlockExpr
	case IntegerLiteral
	case FloatingLiteral
	case ImaginaryLiteral
	case StringLiteral
	case CharacterLiteral
	case ParenExpr
	case UnaryOperator
	case ArraySubscriptExpr
	case BinaryOperator
	case CompoundAssignOperator
	case ConditionalOperator
	case CStyleCastExpr
	case CompoundLiteralExpr
	case InitListExpr
	case AddrLabelExpr
	case StmtExpr
	case GenericSelectionExpr
	case GNUNullExpr
	case CXXStaticCastExpr
	case CXXDynamicCastExpr
	case CXXReinterpretCastExpr
	case CXXConstCastExpr
	case CXXFunctionalCastExpr
	case CXXTypeidExpr
	case CXXBoolLiteralExpr
	case CXXNullPtrLiteralExpr
	case CXXThisExpr
	case CXXThrowExpr
	case CXXNewExpr
	case CXXDeleteExpr
	case UnaryExpr
	case ObjCStringLiteral
	case ObjCEncodeExpr
	case ObjCSelectorExpr
	case ObjCProtocolExpr
	case ObjCBridgedCastExpr
	case PackExpansionExpr
	case SizeOfPackExpr
	case LambdaExpr
	case ObjCBoolLiteralExpr
	case ObjCSelfExpr
	case OMPArraySectionExpr
	case LastExpr
	case FirstStmt
	case UnexposedStmt
	case LabelStmt
	case CompoundStmt
	case CaseStmt
	case DefaultStmt
	case IfStmt
	case SwitchStmt
	case WhileStmt
	case DoStmt
	case ForStmt
	case GotoStmt
	case IndirectGotoStmt
	case ContinueStmt
	case BreakStmt
	case ReturnStmt
	case GCCAsmStmt
	case AsmStmt
	case ObjCAtTryStmt
	case ObjCAtCatchStmt
	case ObjCAtFinallyStmt
	case ObjCAtThrowStmt
	case ObjCAtSynchronizedStmt
	case ObjCAutoreleasePoolStmt
	case ObjCForCollectionStmt
	case CXXCatchStmt
	case CXXTryStmt
	case CXXForRangeStmt
	case SEHTryStmt
	case SEHExceptStmt
	case SEHFinallyStmt
	case MSAsmStmt
	case NullStmt
	case DeclStmt
	case OMPParallelDirective
	case OMPSimdDirective
	case OMPForDirective
	case OMPSectionsDirective
	case OMPSectionDirective
	case OMPSingleDirective
	case OMPParallelForDirective
	case OMPParallelSectionsDirective
	case OMPTaskDirective
	case OMPMasterDirective
	case OMPCriticalDirective
	case OMPTaskyieldDirective
	case OMPBarrierDirective
	case OMPTaskwaitDirective
	case OMPFlushDirective
	case SEHLeaveStmt
	case OMPOrderedDirective
	case OMPAtomicDirective
	case OMPForSimdDirective
	case OMPParallelForSimdDirective
	case OMPTargetDirective
	case OMPTeamsDirective
	case OMPTaskgroupDirective
	case OMPCancellationPointDirective
	case OMPCancelDirective
	case OMPTargetDataDirective
	case LastStmt
	case TranslationUnit
	case FirstAttr
	case UnexposedAttr
	case IBActionAttr
	case IBOutletAttr
	case IBOutletCollectionAttr
	case CXXFinalAttr
	case CXXOverrideAttr
	case AnnotateAttr
	case AsmLabelAttr
	case PackedAttr
	case PureAttr
	case ConstAttr
	case NoDuplicateAttr
	case CUDAConstantAttr
	case CUDADeviceAttr
	case CUDAGlobalAttr
	case CUDAHostAttr
	case CUDASharedAttr
	case VisibilityAttr
	case LastAttr
	case PreprocessingDirective
	case MacroDefinition
	case MacroExpansion
	case MacroInstantiation
	case InclusionDirective
	case FirstPreprocessing
	case LastPreprocessing
	case ModuleImportDecl
	case FirstExtraDecl
	case LastExtraDecl
	case OverloadCandidate
}


extension CursorKind {
	init?(rawValue: CXCursorKind) {
		switch rawValue {
		case CXCursor_UnexposedDecl: self = .UnexposedDecl
		case CXCursor_StructDecl: self = .StructDecl
		case CXCursor_UnionDecl: self = .UnionDecl
		case CXCursor_ClassDecl: self = .ClassDecl
		case CXCursor_EnumDecl: self = .EnumDecl
		case CXCursor_FieldDecl: self = .FieldDecl
		case CXCursor_EnumConstantDecl: self = .EnumConstantDecl
		case CXCursor_FunctionDecl: self = .FunctionDecl
		case CXCursor_VarDecl: self = .VarDecl
		case CXCursor_ParmDecl: self = .ParmDecl
		case CXCursor_ObjCInterfaceDecl: self = .ObjCInterfaceDecl
		case CXCursor_ObjCCategoryDecl: self = .ObjCCategoryDecl
		case CXCursor_ObjCProtocolDecl: self = .ObjCProtocolDecl
		case CXCursor_ObjCPropertyDecl: self = .ObjCPropertyDecl
		case CXCursor_ObjCIvarDecl: self = .ObjCIvarDecl
		case CXCursor_ObjCInstanceMethodDecl: self = .ObjCInstanceMethodDecl
		case CXCursor_ObjCClassMethodDecl: self = .ObjCClassMethodDecl
		case CXCursor_ObjCImplementationDecl: self = .ObjCImplementationDecl
		case CXCursor_ObjCCategoryImplDecl: self = .ObjCCategoryImplDecl
		case CXCursor_TypedefDecl: self = .TypedefDecl
		case CXCursor_CXXMethod: self = .CXXMethod
		case CXCursor_Namespace: self = .Namespace
		case CXCursor_LinkageSpec: self = .LinkageSpec
		case CXCursor_Constructor: self = .Constructor
		case CXCursor_Destructor: self = .Destructor
		case CXCursor_ConversionFunction: self = .ConversionFunction
		case CXCursor_TemplateTypeParameter: self = .TemplateTypeParameter
		case CXCursor_NonTypeTemplateParameter: self = .NonTypeTemplateParameter
		case CXCursor_TemplateTemplateParameter: self = .TemplateTemplateParameter
		case CXCursor_FunctionTemplate: self = .FunctionTemplate
		case CXCursor_ClassTemplate: self = .ClassTemplate
		case CXCursor_ClassTemplatePartialSpecialization: self = .ClassTemplatePartialSpecialization
		case CXCursor_NamespaceAlias: self = .NamespaceAlias
		case CXCursor_UsingDirective: self = .UsingDirective
		case CXCursor_UsingDeclaration: self = .UsingDeclaration
		case CXCursor_TypeAliasDecl: self = .TypeAliasDecl
		case CXCursor_ObjCSynthesizeDecl: self = .ObjCSynthesizeDecl
		case CXCursor_ObjCDynamicDecl: self = .ObjCDynamicDecl
		case CXCursor_CXXAccessSpecifier: self = .CXXAccessSpecifier
		case CXCursor_FirstDecl: self = .FirstDecl
		case CXCursor_LastDecl: self = .LastDecl
		case CXCursor_FirstRef: self = .FirstRef
		case CXCursor_ObjCSuperClassRef: self = .ObjCSuperClassRef
		case CXCursor_ObjCProtocolRef: self = .ObjCProtocolRef
		case CXCursor_ObjCClassRef: self = .ObjCClassRef
		case CXCursor_TypeRef: self = .TypeRef
		case CXCursor_CXXBaseSpecifier: self = .CXXBaseSpecifier
		case CXCursor_TemplateRef: self = .TemplateRef
		case CXCursor_NamespaceRef: self = .NamespaceRef
		case CXCursor_MemberRef: self = .MemberRef
		case CXCursor_LabelRef: self = .LabelRef
		case CXCursor_OverloadedDeclRef: self = .OverloadedDeclRef
		case CXCursor_VariableRef: self = .VariableRef
		case CXCursor_LastRef: self = .LastRef
		case CXCursor_FirstInvalid: self = .FirstInvalid
		case CXCursor_InvalidFile: self = .InvalidFile
		case CXCursor_NoDeclFound: self = .NoDeclFound
		case CXCursor_NotImplemented: self = .NotImplemented
		case CXCursor_InvalidCode: self = .InvalidCode
		case CXCursor_LastInvalid: self = .LastInvalid
		case CXCursor_FirstExpr: self = .FirstExpr
		case CXCursor_UnexposedExpr: self = .UnexposedExpr
		case CXCursor_DeclRefExpr: self = .DeclRefExpr
		case CXCursor_MemberRefExpr: self = .MemberRefExpr
		case CXCursor_CallExpr: self = .CallExpr
		case CXCursor_ObjCMessageExpr: self = .ObjCMessageExpr
		case CXCursor_BlockExpr: self = .BlockExpr
		case CXCursor_IntegerLiteral: self = .IntegerLiteral
		case CXCursor_FloatingLiteral: self = .FloatingLiteral
		case CXCursor_ImaginaryLiteral: self = .ImaginaryLiteral
		case CXCursor_StringLiteral: self = .StringLiteral
		case CXCursor_CharacterLiteral: self = .CharacterLiteral
		case CXCursor_ParenExpr: self = .ParenExpr
		case CXCursor_UnaryOperator: self = .UnaryOperator
		case CXCursor_ArraySubscriptExpr: self = .ArraySubscriptExpr
		case CXCursor_BinaryOperator: self = .BinaryOperator
		case CXCursor_CompoundAssignOperator: self = .CompoundAssignOperator
		case CXCursor_ConditionalOperator: self = .ConditionalOperator
		case CXCursor_CStyleCastExpr: self = .CStyleCastExpr
		case CXCursor_CompoundLiteralExpr: self = .CompoundLiteralExpr
		case CXCursor_InitListExpr: self = .InitListExpr
		case CXCursor_AddrLabelExpr: self = .AddrLabelExpr
		case CXCursor_StmtExpr: self = .StmtExpr
		case CXCursor_GenericSelectionExpr: self = .GenericSelectionExpr
		case CXCursor_GNUNullExpr: self = .GNUNullExpr
		case CXCursor_CXXStaticCastExpr: self = .CXXStaticCastExpr
		case CXCursor_CXXDynamicCastExpr: self = .CXXDynamicCastExpr
		case CXCursor_CXXReinterpretCastExpr: self = .CXXReinterpretCastExpr
		case CXCursor_CXXConstCastExpr: self = .CXXConstCastExpr
		case CXCursor_CXXFunctionalCastExpr: self = .CXXFunctionalCastExpr
		case CXCursor_CXXTypeidExpr: self = .CXXTypeidExpr
		case CXCursor_CXXBoolLiteralExpr: self = .CXXBoolLiteralExpr
		case CXCursor_CXXNullPtrLiteralExpr: self = .CXXNullPtrLiteralExpr
		case CXCursor_CXXThisExpr: self = .CXXThisExpr
		case CXCursor_CXXThrowExpr: self = .CXXThrowExpr
		case CXCursor_CXXNewExpr: self = .CXXNewExpr
		case CXCursor_CXXDeleteExpr: self = .CXXDeleteExpr
		case CXCursor_UnaryExpr: self = .UnaryExpr
		case CXCursor_ObjCStringLiteral: self = .ObjCStringLiteral
		case CXCursor_ObjCEncodeExpr: self = .ObjCEncodeExpr
		case CXCursor_ObjCSelectorExpr: self = .ObjCSelectorExpr
		case CXCursor_ObjCProtocolExpr: self = .ObjCProtocolExpr
		case CXCursor_ObjCBridgedCastExpr: self = .ObjCBridgedCastExpr
		case CXCursor_PackExpansionExpr: self = .PackExpansionExpr
		case CXCursor_SizeOfPackExpr: self = .SizeOfPackExpr
		case CXCursor_LambdaExpr: self = .LambdaExpr
		case CXCursor_ObjCBoolLiteralExpr: self = .ObjCBoolLiteralExpr
		case CXCursor_ObjCSelfExpr: self = .ObjCSelfExpr
		case CXCursor_OMPArraySectionExpr: self = .OMPArraySectionExpr
		case CXCursor_LastExpr: self = .LastExpr
		case CXCursor_FirstStmt: self = .FirstStmt
		case CXCursor_UnexposedStmt: self = .UnexposedStmt
		case CXCursor_LabelStmt: self = .LabelStmt
		case CXCursor_CompoundStmt: self = .CompoundStmt
		case CXCursor_CaseStmt: self = .CaseStmt
		case CXCursor_DefaultStmt: self = .DefaultStmt
		case CXCursor_IfStmt: self = .IfStmt
		case CXCursor_SwitchStmt: self = .SwitchStmt
		case CXCursor_WhileStmt: self = .WhileStmt
		case CXCursor_DoStmt: self = .DoStmt
		case CXCursor_ForStmt: self = .ForStmt
		case CXCursor_GotoStmt: self = .GotoStmt
		case CXCursor_IndirectGotoStmt: self = .IndirectGotoStmt
		case CXCursor_ContinueStmt: self = .ContinueStmt
		case CXCursor_BreakStmt: self = .BreakStmt
		case CXCursor_ReturnStmt: self = .ReturnStmt
		case CXCursor_GCCAsmStmt: self = .GCCAsmStmt
		case CXCursor_AsmStmt: self = .AsmStmt
		case CXCursor_ObjCAtTryStmt: self = .ObjCAtTryStmt
		case CXCursor_ObjCAtCatchStmt: self = .ObjCAtCatchStmt
		case CXCursor_ObjCAtFinallyStmt: self = .ObjCAtFinallyStmt
		case CXCursor_ObjCAtThrowStmt: self = .ObjCAtThrowStmt
		case CXCursor_ObjCAtSynchronizedStmt: self = .ObjCAtSynchronizedStmt
		case CXCursor_ObjCAutoreleasePoolStmt: self = .ObjCAutoreleasePoolStmt
		case CXCursor_ObjCForCollectionStmt: self = .ObjCForCollectionStmt
		case CXCursor_CXXCatchStmt: self = .CXXCatchStmt
		case CXCursor_CXXTryStmt: self = .CXXTryStmt
		case CXCursor_CXXForRangeStmt: self = .CXXForRangeStmt
		case CXCursor_SEHTryStmt: self = .SEHTryStmt
		case CXCursor_SEHExceptStmt: self = .SEHExceptStmt
		case CXCursor_SEHFinallyStmt: self = .SEHFinallyStmt
		case CXCursor_MSAsmStmt: self = .MSAsmStmt
		case CXCursor_NullStmt: self = .NullStmt
		case CXCursor_DeclStmt: self = .DeclStmt
		case CXCursor_OMPParallelDirective: self = .OMPParallelDirective
		case CXCursor_OMPSimdDirective: self = .OMPSimdDirective
		case CXCursor_OMPForDirective: self = .OMPForDirective
		case CXCursor_OMPSectionsDirective: self = .OMPSectionsDirective
		case CXCursor_OMPSectionDirective: self = .OMPSectionDirective
		case CXCursor_OMPSingleDirective: self = .OMPSingleDirective
		case CXCursor_OMPParallelForDirective: self = .OMPParallelForDirective
		case CXCursor_OMPParallelSectionsDirective: self = .OMPParallelSectionsDirective
		case CXCursor_OMPTaskDirective: self = .OMPTaskDirective
		case CXCursor_OMPMasterDirective: self = .OMPMasterDirective
		case CXCursor_OMPCriticalDirective: self = .OMPCriticalDirective
		case CXCursor_OMPTaskyieldDirective: self = .OMPTaskyieldDirective
		case CXCursor_OMPBarrierDirective: self = .OMPBarrierDirective
		case CXCursor_OMPTaskwaitDirective: self = .OMPTaskwaitDirective
		case CXCursor_OMPFlushDirective: self = .OMPFlushDirective
		case CXCursor_SEHLeaveStmt: self = .SEHLeaveStmt
		case CXCursor_OMPOrderedDirective: self = .OMPOrderedDirective
		case CXCursor_OMPAtomicDirective: self = .OMPAtomicDirective
		case CXCursor_OMPForSimdDirective: self = .OMPForSimdDirective
		case CXCursor_OMPParallelForSimdDirective: self = .OMPParallelForSimdDirective
		case CXCursor_OMPTargetDirective: self = .OMPTargetDirective
		case CXCursor_OMPTeamsDirective: self = .OMPTeamsDirective
		case CXCursor_OMPTaskgroupDirective: self = .OMPTaskgroupDirective
		case CXCursor_OMPCancellationPointDirective: self = .OMPCancellationPointDirective
		case CXCursor_OMPCancelDirective: self = .OMPCancelDirective
		case CXCursor_OMPTargetDataDirective: self = .OMPTargetDataDirective
		case CXCursor_LastStmt: self = .LastStmt
		case CXCursor_TranslationUnit: self = .TranslationUnit
		case CXCursor_FirstAttr: self = .FirstAttr
		case CXCursor_UnexposedAttr: self = .UnexposedAttr
		case CXCursor_IBActionAttr: self = .IBActionAttr
		case CXCursor_IBOutletAttr: self = .IBOutletAttr
		case CXCursor_IBOutletCollectionAttr: self = .IBOutletCollectionAttr
		case CXCursor_CXXFinalAttr: self = .CXXFinalAttr
		case CXCursor_CXXOverrideAttr: self = .CXXOverrideAttr
		case CXCursor_AnnotateAttr: self = .AnnotateAttr
		case CXCursor_AsmLabelAttr: self = .AsmLabelAttr
		case CXCursor_PackedAttr: self = .PackedAttr
		case CXCursor_PureAttr: self = .PureAttr
		case CXCursor_ConstAttr: self = .ConstAttr
		case CXCursor_NoDuplicateAttr: self = .NoDuplicateAttr
		case CXCursor_CUDAConstantAttr: self = .CUDAConstantAttr
		case CXCursor_CUDADeviceAttr: self = .CUDADeviceAttr
		case CXCursor_CUDAGlobalAttr: self = .CUDAGlobalAttr
		case CXCursor_CUDAHostAttr: self = .CUDAHostAttr
		case CXCursor_CUDASharedAttr: self = .CUDASharedAttr
		case CXCursor_VisibilityAttr: self = .VisibilityAttr
		case CXCursor_LastAttr: self = .LastAttr
		case CXCursor_PreprocessingDirective: self = .PreprocessingDirective
		case CXCursor_MacroDefinition: self = .MacroDefinition
		case CXCursor_MacroExpansion: self = .MacroExpansion
		case CXCursor_MacroInstantiation: self = .MacroInstantiation
		case CXCursor_InclusionDirective: self = .InclusionDirective
		case CXCursor_FirstPreprocessing: self = .FirstPreprocessing
		case CXCursor_LastPreprocessing: self = .LastPreprocessing
		case CXCursor_ModuleImportDecl: self = .ModuleImportDecl
		case CXCursor_FirstExtraDecl: self = .FirstExtraDecl
		case CXCursor_LastExtraDecl: self = .LastExtraDecl
		case CXCursor_OverloadCandidate: self = .OverloadCandidate
		default: return nil
		}
	}
	
	var rawValue: CXCursorKind {
		switch self {
		case .UnexposedDecl: return CXCursor_UnexposedDecl
		case .StructDecl: return CXCursor_StructDecl
		case .UnionDecl: return CXCursor_UnionDecl
		case .ClassDecl: return CXCursor_ClassDecl
		case .EnumDecl: return CXCursor_EnumDecl
		case .FieldDecl: return CXCursor_FieldDecl
		case .EnumConstantDecl: return CXCursor_EnumConstantDecl
		case .FunctionDecl: return CXCursor_FunctionDecl
		case .VarDecl: return CXCursor_VarDecl
		case .ParmDecl: return CXCursor_ParmDecl
		case .ObjCInterfaceDecl: return CXCursor_ObjCInterfaceDecl
		case .ObjCCategoryDecl: return CXCursor_ObjCCategoryDecl
		case .ObjCProtocolDecl: return CXCursor_ObjCProtocolDecl
		case .ObjCPropertyDecl: return CXCursor_ObjCPropertyDecl
		case .ObjCIvarDecl: return CXCursor_ObjCIvarDecl
		case .ObjCInstanceMethodDecl: return CXCursor_ObjCInstanceMethodDecl
		case .ObjCClassMethodDecl: return CXCursor_ObjCClassMethodDecl
		case .ObjCImplementationDecl: return CXCursor_ObjCImplementationDecl
		case .ObjCCategoryImplDecl: return CXCursor_ObjCCategoryImplDecl
		case .TypedefDecl: return CXCursor_TypedefDecl
		case .CXXMethod: return CXCursor_CXXMethod
		case .Namespace: return CXCursor_Namespace
		case .LinkageSpec: return CXCursor_LinkageSpec
		case .Constructor: return CXCursor_Constructor
		case .Destructor: return CXCursor_Destructor
		case .ConversionFunction: return CXCursor_ConversionFunction
		case .TemplateTypeParameter: return CXCursor_TemplateTypeParameter
		case .NonTypeTemplateParameter: return CXCursor_NonTypeTemplateParameter
		case .TemplateTemplateParameter: return CXCursor_TemplateTemplateParameter
		case .FunctionTemplate: return CXCursor_FunctionTemplate
		case .ClassTemplate: return CXCursor_ClassTemplate
		case .ClassTemplatePartialSpecialization: return CXCursor_ClassTemplatePartialSpecialization
		case .NamespaceAlias: return CXCursor_NamespaceAlias
		case .UsingDirective: return CXCursor_UsingDirective
		case .UsingDeclaration: return CXCursor_UsingDeclaration
		case .TypeAliasDecl: return CXCursor_TypeAliasDecl
		case .ObjCSynthesizeDecl: return CXCursor_ObjCSynthesizeDecl
		case .ObjCDynamicDecl: return CXCursor_ObjCDynamicDecl
		case .CXXAccessSpecifier: return CXCursor_CXXAccessSpecifier
		case .FirstDecl: return CXCursor_FirstDecl
		case .LastDecl: return CXCursor_LastDecl
		case .FirstRef: return CXCursor_FirstRef
		case .ObjCSuperClassRef: return CXCursor_ObjCSuperClassRef
		case .ObjCProtocolRef: return CXCursor_ObjCProtocolRef
		case .ObjCClassRef: return CXCursor_ObjCClassRef
		case .TypeRef: return CXCursor_TypeRef
		case .CXXBaseSpecifier: return CXCursor_CXXBaseSpecifier
		case .TemplateRef: return CXCursor_TemplateRef
		case .NamespaceRef: return CXCursor_NamespaceRef
		case .MemberRef: return CXCursor_MemberRef
		case .LabelRef: return CXCursor_LabelRef
		case .OverloadedDeclRef: return CXCursor_OverloadedDeclRef
		case .VariableRef: return CXCursor_VariableRef
		case .LastRef: return CXCursor_LastRef
		case .FirstInvalid: return CXCursor_FirstInvalid
		case .InvalidFile: return CXCursor_InvalidFile
		case .NoDeclFound: return CXCursor_NoDeclFound
		case .NotImplemented: return CXCursor_NotImplemented
		case .InvalidCode: return CXCursor_InvalidCode
		case .LastInvalid: return CXCursor_LastInvalid
		case .FirstExpr: return CXCursor_FirstExpr
		case .UnexposedExpr: return CXCursor_UnexposedExpr
		case .DeclRefExpr: return CXCursor_DeclRefExpr
		case .MemberRefExpr: return CXCursor_MemberRefExpr
		case .CallExpr: return CXCursor_CallExpr
		case .ObjCMessageExpr: return CXCursor_ObjCMessageExpr
		case .BlockExpr: return CXCursor_BlockExpr
		case .IntegerLiteral: return CXCursor_IntegerLiteral
		case .FloatingLiteral: return CXCursor_FloatingLiteral
		case .ImaginaryLiteral: return CXCursor_ImaginaryLiteral
		case .StringLiteral: return CXCursor_StringLiteral
		case .CharacterLiteral: return CXCursor_CharacterLiteral
		case .ParenExpr: return CXCursor_ParenExpr
		case .UnaryOperator: return CXCursor_UnaryOperator
		case .ArraySubscriptExpr: return CXCursor_ArraySubscriptExpr
		case .BinaryOperator: return CXCursor_BinaryOperator
		case .CompoundAssignOperator: return CXCursor_CompoundAssignOperator
		case .ConditionalOperator: return CXCursor_ConditionalOperator
		case .CStyleCastExpr: return CXCursor_CStyleCastExpr
		case .CompoundLiteralExpr: return CXCursor_CompoundLiteralExpr
		case .InitListExpr: return CXCursor_InitListExpr
		case .AddrLabelExpr: return CXCursor_AddrLabelExpr
		case .StmtExpr: return CXCursor_StmtExpr
		case .GenericSelectionExpr: return CXCursor_GenericSelectionExpr
		case .GNUNullExpr: return CXCursor_GNUNullExpr
		case .CXXStaticCastExpr: return CXCursor_CXXStaticCastExpr
		case .CXXDynamicCastExpr: return CXCursor_CXXDynamicCastExpr
		case .CXXReinterpretCastExpr: return CXCursor_CXXReinterpretCastExpr
		case .CXXConstCastExpr: return CXCursor_CXXConstCastExpr
		case .CXXFunctionalCastExpr: return CXCursor_CXXFunctionalCastExpr
		case .CXXTypeidExpr: return CXCursor_CXXTypeidExpr
		case .CXXBoolLiteralExpr: return CXCursor_CXXBoolLiteralExpr
		case .CXXNullPtrLiteralExpr: return CXCursor_CXXNullPtrLiteralExpr
		case .CXXThisExpr: return CXCursor_CXXThisExpr
		case .CXXThrowExpr: return CXCursor_CXXThrowExpr
		case .CXXNewExpr: return CXCursor_CXXNewExpr
		case .CXXDeleteExpr: return CXCursor_CXXDeleteExpr
		case .UnaryExpr: return CXCursor_UnaryExpr
		case .ObjCStringLiteral: return CXCursor_ObjCStringLiteral
		case .ObjCEncodeExpr: return CXCursor_ObjCEncodeExpr
		case .ObjCSelectorExpr: return CXCursor_ObjCSelectorExpr
		case .ObjCProtocolExpr: return CXCursor_ObjCProtocolExpr
		case .ObjCBridgedCastExpr: return CXCursor_ObjCBridgedCastExpr
		case .PackExpansionExpr: return CXCursor_PackExpansionExpr
		case .SizeOfPackExpr: return CXCursor_SizeOfPackExpr
		case .LambdaExpr: return CXCursor_LambdaExpr
		case .ObjCBoolLiteralExpr: return CXCursor_ObjCBoolLiteralExpr
		case .ObjCSelfExpr: return CXCursor_ObjCSelfExpr
		case .OMPArraySectionExpr: return CXCursor_OMPArraySectionExpr
		case .LastExpr: return CXCursor_LastExpr
		case .FirstStmt: return CXCursor_FirstStmt
		case .UnexposedStmt: return CXCursor_UnexposedStmt
		case .LabelStmt: return CXCursor_LabelStmt
		case .CompoundStmt: return CXCursor_CompoundStmt
		case .CaseStmt: return CXCursor_CaseStmt
		case .DefaultStmt: return CXCursor_DefaultStmt
		case .IfStmt: return CXCursor_IfStmt
		case .SwitchStmt: return CXCursor_SwitchStmt
		case .WhileStmt: return CXCursor_WhileStmt
		case .DoStmt: return CXCursor_DoStmt
		case .ForStmt: return CXCursor_ForStmt
		case .GotoStmt: return CXCursor_GotoStmt
		case .IndirectGotoStmt: return CXCursor_IndirectGotoStmt
		case .ContinueStmt: return CXCursor_ContinueStmt
		case .BreakStmt: return CXCursor_BreakStmt
		case .ReturnStmt: return CXCursor_ReturnStmt
		case .GCCAsmStmt: return CXCursor_GCCAsmStmt
		case .AsmStmt: return CXCursor_AsmStmt
		case .ObjCAtTryStmt: return CXCursor_ObjCAtTryStmt
		case .ObjCAtCatchStmt: return CXCursor_ObjCAtCatchStmt
		case .ObjCAtFinallyStmt: return CXCursor_ObjCAtFinallyStmt
		case .ObjCAtThrowStmt: return CXCursor_ObjCAtThrowStmt
		case .ObjCAtSynchronizedStmt: return CXCursor_ObjCAtSynchronizedStmt
		case .ObjCAutoreleasePoolStmt: return CXCursor_ObjCAutoreleasePoolStmt
		case .ObjCForCollectionStmt: return CXCursor_ObjCForCollectionStmt
		case .CXXCatchStmt: return CXCursor_CXXCatchStmt
		case .CXXTryStmt: return CXCursor_CXXTryStmt
		case .CXXForRangeStmt: return CXCursor_CXXForRangeStmt
		case .SEHTryStmt: return CXCursor_SEHTryStmt
		case .SEHExceptStmt: return CXCursor_SEHExceptStmt
		case .SEHFinallyStmt: return CXCursor_SEHFinallyStmt
		case .MSAsmStmt: return CXCursor_MSAsmStmt
		case .NullStmt: return CXCursor_NullStmt
		case .DeclStmt: return CXCursor_DeclStmt
		case .OMPParallelDirective: return CXCursor_OMPParallelDirective
		case .OMPSimdDirective: return CXCursor_OMPSimdDirective
		case .OMPForDirective: return CXCursor_OMPForDirective
		case .OMPSectionsDirective: return CXCursor_OMPSectionsDirective
		case .OMPSectionDirective: return CXCursor_OMPSectionDirective
		case .OMPSingleDirective: return CXCursor_OMPSingleDirective
		case .OMPParallelForDirective: return CXCursor_OMPParallelForDirective
		case .OMPParallelSectionsDirective: return CXCursor_OMPParallelSectionsDirective
		case .OMPTaskDirective: return CXCursor_OMPTaskDirective
		case .OMPMasterDirective: return CXCursor_OMPMasterDirective
		case .OMPCriticalDirective: return CXCursor_OMPCriticalDirective
		case .OMPTaskyieldDirective: return CXCursor_OMPTaskyieldDirective
		case .OMPBarrierDirective: return CXCursor_OMPBarrierDirective
		case .OMPTaskwaitDirective: return CXCursor_OMPTaskwaitDirective
		case .OMPFlushDirective: return CXCursor_OMPFlushDirective
		case .SEHLeaveStmt: return CXCursor_SEHLeaveStmt
		case .OMPOrderedDirective: return CXCursor_OMPOrderedDirective
		case .OMPAtomicDirective: return CXCursor_OMPAtomicDirective
		case .OMPForSimdDirective: return CXCursor_OMPForSimdDirective
		case .OMPParallelForSimdDirective: return CXCursor_OMPParallelForSimdDirective
		case .OMPTargetDirective: return CXCursor_OMPTargetDirective
		case .OMPTeamsDirective: return CXCursor_OMPTeamsDirective
		case .OMPTaskgroupDirective: return CXCursor_OMPTaskgroupDirective
		case .OMPCancellationPointDirective: return CXCursor_OMPCancellationPointDirective
		case .OMPCancelDirective: return CXCursor_OMPCancelDirective
		case .OMPTargetDataDirective: return CXCursor_OMPTargetDataDirective
		case .LastStmt: return CXCursor_LastStmt
		case .TranslationUnit: return CXCursor_TranslationUnit
		case .FirstAttr: return CXCursor_FirstAttr
		case .UnexposedAttr: return CXCursor_UnexposedAttr
		case .IBActionAttr: return CXCursor_IBActionAttr
		case .IBOutletAttr: return CXCursor_IBOutletAttr
		case .IBOutletCollectionAttr: return CXCursor_IBOutletCollectionAttr
		case .CXXFinalAttr: return CXCursor_CXXFinalAttr
		case .CXXOverrideAttr: return CXCursor_CXXOverrideAttr
		case .AnnotateAttr: return CXCursor_AnnotateAttr
		case .AsmLabelAttr: return CXCursor_AsmLabelAttr
		case .PackedAttr: return CXCursor_PackedAttr
		case .PureAttr: return CXCursor_PureAttr
		case .ConstAttr: return CXCursor_ConstAttr
		case .NoDuplicateAttr: return CXCursor_NoDuplicateAttr
		case .CUDAConstantAttr: return CXCursor_CUDAConstantAttr
		case .CUDADeviceAttr: return CXCursor_CUDADeviceAttr
		case .CUDAGlobalAttr: return CXCursor_CUDAGlobalAttr
		case .CUDAHostAttr: return CXCursor_CUDAHostAttr
		case .CUDASharedAttr: return CXCursor_CUDASharedAttr
		case .VisibilityAttr: return CXCursor_VisibilityAttr
		case .LastAttr: return CXCursor_LastAttr
		case .PreprocessingDirective: return CXCursor_PreprocessingDirective
		case .MacroDefinition: return CXCursor_MacroDefinition
		case .MacroExpansion: return CXCursor_MacroExpansion
		case .MacroInstantiation: return CXCursor_MacroInstantiation
		case .InclusionDirective: return CXCursor_InclusionDirective
		case .FirstPreprocessing: return CXCursor_FirstPreprocessing
		case .LastPreprocessing: return CXCursor_LastPreprocessing
		case .ModuleImportDecl: return CXCursor_ModuleImportDecl
		case .FirstExtraDecl: return CXCursor_FirstExtraDecl
		case .LastExtraDecl: return CXCursor_LastExtraDecl
		case .OverloadCandidate: return CXCursor_OverloadCandidate
		}
	}
}


func ~=(lhs: CXCursorKind, rhs: CXCursorKind) -> Bool {
	return lhs == rhs
}

