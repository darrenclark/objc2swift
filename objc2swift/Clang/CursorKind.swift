enum CursorKind {
	case unexposedDecl
	case structDecl
	case unionDecl
	case classDecl
	case enumDecl
	case fieldDecl
	case enumConstantDecl
	case functionDecl
	case varDecl
	case parmDecl
	case objCInterfaceDecl
	case objCCategoryDecl
	case objCProtocolDecl
	case objCPropertyDecl
	case objCIvarDecl
	case objCInstanceMethodDecl
	case objCClassMethodDecl
	case objCImplementationDecl
	case objCCategoryImplDecl
	case typedefDecl
	case cxxMethod
	case namespace
	case linkageSpec
	case constructor
	case destructor
	case conversionFunction
	case templateTypeParameter
	case nonTypeTemplateParameter
	case templateTemplateParameter
	case functionTemplate
	case classTemplate
	case classTemplatePartialSpecialization
	case namespaceAlias
	case usingDirective
	case usingDeclaration
	case typeAliasDecl
	case objCSynthesizeDecl
	case objCDynamicDecl
	case cxxAccessSpecifier
	case firstDecl
	case lastDecl
	case firstRef
	case objCSuperClassRef
	case objCProtocolRef
	case objCClassRef
	case typeRef
	case cxxBaseSpecifier
	case templateRef
	case namespaceRef
	case memberRef
	case labelRef
	case overloadedDeclRef
	case variableRef
	case lastRef
	case firstInvalid
	case invalidFile
	case noDeclFound
	case notImplemented
	case invalidCode
	case lastInvalid
	case firstExpr
	case unexposedExpr
	case declRefExpr
	case memberRefExpr
	case callExpr
	case objCMessageExpr
	case blockExpr
	case integerLiteral
	case floatingLiteral
	case imaginaryLiteral
	case stringLiteral
	case characterLiteral
	case parenExpr
	case unaryOperator
	case arraySubscriptExpr
	case binaryOperator
	case compoundAssignOperator
	case conditionalOperator
	case cStyleCastExpr
	case compoundLiteralExpr
	case initListExpr
	case addrLabelExpr
	case stmtExpr
	case genericSelectionExpr
	case gnuNullExpr
	case cxxStaticCastExpr
	case cxxDynamicCastExpr
	case cxxReinterpretCastExpr
	case cxxConstCastExpr
	case cxxFunctionalCastExpr
	case cxxTypeidExpr
	case cxxBoolLiteralExpr
	case cxxNullPtrLiteralExpr
	case cxxThisExpr
	case cxxThrowExpr
	case cxxNewExpr
	case cxxDeleteExpr
	case unaryExpr
	case objCStringLiteral
	case objCEncodeExpr
	case objCSelectorExpr
	case objCProtocolExpr
	case objCBridgedCastExpr
	case packExpansionExpr
	case sizeOfPackExpr
	case lambdaExpr
	case objCBoolLiteralExpr
	case objCSelfExpr
	case ompArraySectionExpr
	case lastExpr
	case firstStmt
	case unexposedStmt
	case labelStmt
	case compoundStmt
	case caseStmt
	case defaultStmt
	case ifStmt
	case switchStmt
	case whileStmt
	case doStmt
	case forStmt
	case gotoStmt
	case indirectGotoStmt
	case continueStmt
	case breakStmt
	case returnStmt
	case gccAsmStmt
	case asmStmt
	case objCAtTryStmt
	case objCAtCatchStmt
	case objCAtFinallyStmt
	case objCAtThrowStmt
	case objCAtSynchronizedStmt
	case objCAutoreleasePoolStmt
	case objCForCollectionStmt
	case cxxCatchStmt
	case cxxTryStmt
	case cxxForRangeStmt
	case sehTryStmt
	case sehExceptStmt
	case sehFinallyStmt
	case msAsmStmt
	case nullStmt
	case declStmt
	case ompParallelDirective
	case ompSimdDirective
	case ompForDirective
	case ompSectionsDirective
	case ompSectionDirective
	case ompSingleDirective
	case ompParallelForDirective
	case ompParallelSectionsDirective
	case ompTaskDirective
	case ompMasterDirective
	case ompCriticalDirective
	case ompTaskyieldDirective
	case ompBarrierDirective
	case ompTaskwaitDirective
	case ompFlushDirective
	case sehLeaveStmt
	case ompOrderedDirective
	case ompAtomicDirective
	case ompForSimdDirective
	case ompParallelForSimdDirective
	case ompTargetDirective
	case ompTeamsDirective
	case ompTaskgroupDirective
	case ompCancellationPointDirective
	case ompCancelDirective
	case ompTargetDataDirective
	case lastStmt
	case translationUnit
	case firstAttr
	case unexposedAttr
	case ibActionAttr
	case ibOutletAttr
	case ibOutletCollectionAttr
	case cxxFinalAttr
	case cxxOverrideAttr
	case annotateAttr
	case asmLabelAttr
	case packedAttr
	case pureAttr
	case constAttr
	case noDuplicateAttr
	case cudaConstantAttr
	case cudaDeviceAttr
	case cudaGlobalAttr
	case cudaHostAttr
	case cudaSharedAttr
	case visibilityAttr
	case lastAttr
	case preprocessingDirective
	case macroDefinition
	case macroExpansion
	case macroInstantiation
	case inclusionDirective
	case firstPreprocessing
	case lastPreprocessing
	case moduleImportDecl
	case firstExtraDecl
	case lastExtraDecl
	case overloadCandidate
}


extension CursorKind {
	init?(rawValue: CXCursorKind) {
		switch rawValue {
		case CXCursor_UnexposedDecl: self = .unexposedDecl
		case CXCursor_StructDecl: self = .structDecl
		case CXCursor_UnionDecl: self = .unionDecl
		case CXCursor_ClassDecl: self = .classDecl
		case CXCursor_EnumDecl: self = .enumDecl
		case CXCursor_FieldDecl: self = .fieldDecl
		case CXCursor_EnumConstantDecl: self = .enumConstantDecl
		case CXCursor_FunctionDecl: self = .functionDecl
		case CXCursor_VarDecl: self = .varDecl
		case CXCursor_ParmDecl: self = .parmDecl
		case CXCursor_ObjCInterfaceDecl: self = .objCInterfaceDecl
		case CXCursor_ObjCCategoryDecl: self = .objCCategoryDecl
		case CXCursor_ObjCProtocolDecl: self = .objCProtocolDecl
		case CXCursor_ObjCPropertyDecl: self = .objCPropertyDecl
		case CXCursor_ObjCIvarDecl: self = .objCIvarDecl
		case CXCursor_ObjCInstanceMethodDecl: self = .objCInstanceMethodDecl
		case CXCursor_ObjCClassMethodDecl: self = .objCClassMethodDecl
		case CXCursor_ObjCImplementationDecl: self = .objCImplementationDecl
		case CXCursor_ObjCCategoryImplDecl: self = .objCCategoryImplDecl
		case CXCursor_TypedefDecl: self = .typedefDecl
		case CXCursor_CXXMethod: self = .cxxMethod
		case CXCursor_Namespace: self = .namespace
		case CXCursor_LinkageSpec: self = .linkageSpec
		case CXCursor_Constructor: self = .constructor
		case CXCursor_Destructor: self = .destructor
		case CXCursor_ConversionFunction: self = .conversionFunction
		case CXCursor_TemplateTypeParameter: self = .templateTypeParameter
		case CXCursor_NonTypeTemplateParameter: self = .nonTypeTemplateParameter
		case CXCursor_TemplateTemplateParameter: self = .templateTemplateParameter
		case CXCursor_FunctionTemplate: self = .functionTemplate
		case CXCursor_ClassTemplate: self = .classTemplate
		case CXCursor_ClassTemplatePartialSpecialization: self = .classTemplatePartialSpecialization
		case CXCursor_NamespaceAlias: self = .namespaceAlias
		case CXCursor_UsingDirective: self = .usingDirective
		case CXCursor_UsingDeclaration: self = .usingDeclaration
		case CXCursor_TypeAliasDecl: self = .typeAliasDecl
		case CXCursor_ObjCSynthesizeDecl: self = .objCSynthesizeDecl
		case CXCursor_ObjCDynamicDecl: self = .objCDynamicDecl
		case CXCursor_CXXAccessSpecifier: self = .cxxAccessSpecifier
		case CXCursor_FirstDecl: self = .firstDecl
		case CXCursor_LastDecl: self = .lastDecl
		case CXCursor_FirstRef: self = .firstRef
		case CXCursor_ObjCSuperClassRef: self = .objCSuperClassRef
		case CXCursor_ObjCProtocolRef: self = .objCProtocolRef
		case CXCursor_ObjCClassRef: self = .objCClassRef
		case CXCursor_TypeRef: self = .typeRef
		case CXCursor_CXXBaseSpecifier: self = .cxxBaseSpecifier
		case CXCursor_TemplateRef: self = .templateRef
		case CXCursor_NamespaceRef: self = .namespaceRef
		case CXCursor_MemberRef: self = .memberRef
		case CXCursor_LabelRef: self = .labelRef
		case CXCursor_OverloadedDeclRef: self = .overloadedDeclRef
		case CXCursor_VariableRef: self = .variableRef
		case CXCursor_LastRef: self = .lastRef
		case CXCursor_FirstInvalid: self = .firstInvalid
		case CXCursor_InvalidFile: self = .invalidFile
		case CXCursor_NoDeclFound: self = .noDeclFound
		case CXCursor_NotImplemented: self = .notImplemented
		case CXCursor_InvalidCode: self = .invalidCode
		case CXCursor_LastInvalid: self = .lastInvalid
		case CXCursor_FirstExpr: self = .firstExpr
		case CXCursor_UnexposedExpr: self = .unexposedExpr
		case CXCursor_DeclRefExpr: self = .declRefExpr
		case CXCursor_MemberRefExpr: self = .memberRefExpr
		case CXCursor_CallExpr: self = .callExpr
		case CXCursor_ObjCMessageExpr: self = .objCMessageExpr
		case CXCursor_BlockExpr: self = .blockExpr
		case CXCursor_IntegerLiteral: self = .integerLiteral
		case CXCursor_FloatingLiteral: self = .floatingLiteral
		case CXCursor_ImaginaryLiteral: self = .imaginaryLiteral
		case CXCursor_StringLiteral: self = .stringLiteral
		case CXCursor_CharacterLiteral: self = .characterLiteral
		case CXCursor_ParenExpr: self = .parenExpr
		case CXCursor_UnaryOperator: self = .unaryOperator
		case CXCursor_ArraySubscriptExpr: self = .arraySubscriptExpr
		case CXCursor_BinaryOperator: self = .binaryOperator
		case CXCursor_CompoundAssignOperator: self = .compoundAssignOperator
		case CXCursor_ConditionalOperator: self = .conditionalOperator
		case CXCursor_CStyleCastExpr: self = .cStyleCastExpr
		case CXCursor_CompoundLiteralExpr: self = .compoundLiteralExpr
		case CXCursor_InitListExpr: self = .initListExpr
		case CXCursor_AddrLabelExpr: self = .addrLabelExpr
		case CXCursor_StmtExpr: self = .stmtExpr
		case CXCursor_GenericSelectionExpr: self = .genericSelectionExpr
		case CXCursor_GNUNullExpr: self = .gnuNullExpr
		case CXCursor_CXXStaticCastExpr: self = .cxxStaticCastExpr
		case CXCursor_CXXDynamicCastExpr: self = .cxxDynamicCastExpr
		case CXCursor_CXXReinterpretCastExpr: self = .cxxReinterpretCastExpr
		case CXCursor_CXXConstCastExpr: self = .cxxConstCastExpr
		case CXCursor_CXXFunctionalCastExpr: self = .cxxFunctionalCastExpr
		case CXCursor_CXXTypeidExpr: self = .cxxTypeidExpr
		case CXCursor_CXXBoolLiteralExpr: self = .cxxBoolLiteralExpr
		case CXCursor_CXXNullPtrLiteralExpr: self = .cxxNullPtrLiteralExpr
		case CXCursor_CXXThisExpr: self = .cxxThisExpr
		case CXCursor_CXXThrowExpr: self = .cxxThrowExpr
		case CXCursor_CXXNewExpr: self = .cxxNewExpr
		case CXCursor_CXXDeleteExpr: self = .cxxDeleteExpr
		case CXCursor_UnaryExpr: self = .unaryExpr
		case CXCursor_ObjCStringLiteral: self = .objCStringLiteral
		case CXCursor_ObjCEncodeExpr: self = .objCEncodeExpr
		case CXCursor_ObjCSelectorExpr: self = .objCSelectorExpr
		case CXCursor_ObjCProtocolExpr: self = .objCProtocolExpr
		case CXCursor_ObjCBridgedCastExpr: self = .objCBridgedCastExpr
		case CXCursor_PackExpansionExpr: self = .packExpansionExpr
		case CXCursor_SizeOfPackExpr: self = .sizeOfPackExpr
		case CXCursor_LambdaExpr: self = .lambdaExpr
		case CXCursor_ObjCBoolLiteralExpr: self = .objCBoolLiteralExpr
		case CXCursor_ObjCSelfExpr: self = .objCSelfExpr
		case CXCursor_OMPArraySectionExpr: self = .ompArraySectionExpr
		case CXCursor_LastExpr: self = .lastExpr
		case CXCursor_FirstStmt: self = .firstStmt
		case CXCursor_UnexposedStmt: self = .unexposedStmt
		case CXCursor_LabelStmt: self = .labelStmt
		case CXCursor_CompoundStmt: self = .compoundStmt
		case CXCursor_CaseStmt: self = .caseStmt
		case CXCursor_DefaultStmt: self = .defaultStmt
		case CXCursor_IfStmt: self = .ifStmt
		case CXCursor_SwitchStmt: self = .switchStmt
		case CXCursor_WhileStmt: self = .whileStmt
		case CXCursor_DoStmt: self = .doStmt
		case CXCursor_ForStmt: self = .forStmt
		case CXCursor_GotoStmt: self = .gotoStmt
		case CXCursor_IndirectGotoStmt: self = .indirectGotoStmt
		case CXCursor_ContinueStmt: self = .continueStmt
		case CXCursor_BreakStmt: self = .breakStmt
		case CXCursor_ReturnStmt: self = .returnStmt
		case CXCursor_GCCAsmStmt: self = .gccAsmStmt
		case CXCursor_AsmStmt: self = .asmStmt
		case CXCursor_ObjCAtTryStmt: self = .objCAtTryStmt
		case CXCursor_ObjCAtCatchStmt: self = .objCAtCatchStmt
		case CXCursor_ObjCAtFinallyStmt: self = .objCAtFinallyStmt
		case CXCursor_ObjCAtThrowStmt: self = .objCAtThrowStmt
		case CXCursor_ObjCAtSynchronizedStmt: self = .objCAtSynchronizedStmt
		case CXCursor_ObjCAutoreleasePoolStmt: self = .objCAutoreleasePoolStmt
		case CXCursor_ObjCForCollectionStmt: self = .objCForCollectionStmt
		case CXCursor_CXXCatchStmt: self = .cxxCatchStmt
		case CXCursor_CXXTryStmt: self = .cxxTryStmt
		case CXCursor_CXXForRangeStmt: self = .cxxForRangeStmt
		case CXCursor_SEHTryStmt: self = .sehTryStmt
		case CXCursor_SEHExceptStmt: self = .sehExceptStmt
		case CXCursor_SEHFinallyStmt: self = .sehFinallyStmt
		case CXCursor_MSAsmStmt: self = .msAsmStmt
		case CXCursor_NullStmt: self = .nullStmt
		case CXCursor_DeclStmt: self = .declStmt
		case CXCursor_OMPParallelDirective: self = .ompParallelDirective
		case CXCursor_OMPSimdDirective: self = .ompSimdDirective
		case CXCursor_OMPForDirective: self = .ompForDirective
		case CXCursor_OMPSectionsDirective: self = .ompSectionsDirective
		case CXCursor_OMPSectionDirective: self = .ompSectionDirective
		case CXCursor_OMPSingleDirective: self = .ompSingleDirective
		case CXCursor_OMPParallelForDirective: self = .ompParallelForDirective
		case CXCursor_OMPParallelSectionsDirective: self = .ompParallelSectionsDirective
		case CXCursor_OMPTaskDirective: self = .ompTaskDirective
		case CXCursor_OMPMasterDirective: self = .ompMasterDirective
		case CXCursor_OMPCriticalDirective: self = .ompCriticalDirective
		case CXCursor_OMPTaskyieldDirective: self = .ompTaskyieldDirective
		case CXCursor_OMPBarrierDirective: self = .ompBarrierDirective
		case CXCursor_OMPTaskwaitDirective: self = .ompTaskwaitDirective
		case CXCursor_OMPFlushDirective: self = .ompFlushDirective
		case CXCursor_SEHLeaveStmt: self = .sehLeaveStmt
		case CXCursor_OMPOrderedDirective: self = .ompOrderedDirective
		case CXCursor_OMPAtomicDirective: self = .ompAtomicDirective
		case CXCursor_OMPForSimdDirective: self = .ompForSimdDirective
		case CXCursor_OMPParallelForSimdDirective: self = .ompParallelForSimdDirective
		case CXCursor_OMPTargetDirective: self = .ompTargetDirective
		case CXCursor_OMPTeamsDirective: self = .ompTeamsDirective
		case CXCursor_OMPTaskgroupDirective: self = .ompTaskgroupDirective
		case CXCursor_OMPCancellationPointDirective: self = .ompCancellationPointDirective
		case CXCursor_OMPCancelDirective: self = .ompCancelDirective
		case CXCursor_OMPTargetDataDirective: self = .ompTargetDataDirective
		case CXCursor_LastStmt: self = .lastStmt
		case CXCursor_TranslationUnit: self = .translationUnit
		case CXCursor_FirstAttr: self = .firstAttr
		case CXCursor_UnexposedAttr: self = .unexposedAttr
		case CXCursor_IBActionAttr: self = .ibActionAttr
		case CXCursor_IBOutletAttr: self = .ibOutletAttr
		case CXCursor_IBOutletCollectionAttr: self = .ibOutletCollectionAttr
		case CXCursor_CXXFinalAttr: self = .cxxFinalAttr
		case CXCursor_CXXOverrideAttr: self = .cxxOverrideAttr
		case CXCursor_AnnotateAttr: self = .annotateAttr
		case CXCursor_AsmLabelAttr: self = .asmLabelAttr
		case CXCursor_PackedAttr: self = .packedAttr
		case CXCursor_PureAttr: self = .pureAttr
		case CXCursor_ConstAttr: self = .constAttr
		case CXCursor_NoDuplicateAttr: self = .noDuplicateAttr
		case CXCursor_CUDAConstantAttr: self = .cudaConstantAttr
		case CXCursor_CUDADeviceAttr: self = .cudaDeviceAttr
		case CXCursor_CUDAGlobalAttr: self = .cudaGlobalAttr
		case CXCursor_CUDAHostAttr: self = .cudaHostAttr
		case CXCursor_CUDASharedAttr: self = .cudaSharedAttr
		case CXCursor_VisibilityAttr: self = .visibilityAttr
		case CXCursor_LastAttr: self = .lastAttr
		case CXCursor_PreprocessingDirective: self = .preprocessingDirective
		case CXCursor_MacroDefinition: self = .macroDefinition
		case CXCursor_MacroExpansion: self = .macroExpansion
		case CXCursor_MacroInstantiation: self = .macroInstantiation
		case CXCursor_InclusionDirective: self = .inclusionDirective
		case CXCursor_FirstPreprocessing: self = .firstPreprocessing
		case CXCursor_LastPreprocessing: self = .lastPreprocessing
		case CXCursor_ModuleImportDecl: self = .moduleImportDecl
		case CXCursor_FirstExtraDecl: self = .firstExtraDecl
		case CXCursor_LastExtraDecl: self = .lastExtraDecl
		case CXCursor_OverloadCandidate: self = .overloadCandidate
		default: return nil
		}
	}
	
	var rawValue: CXCursorKind {
		switch self {
		case .unexposedDecl: return CXCursor_UnexposedDecl
		case .structDecl: return CXCursor_StructDecl
		case .unionDecl: return CXCursor_UnionDecl
		case .classDecl: return CXCursor_ClassDecl
		case .enumDecl: return CXCursor_EnumDecl
		case .fieldDecl: return CXCursor_FieldDecl
		case .enumConstantDecl: return CXCursor_EnumConstantDecl
		case .functionDecl: return CXCursor_FunctionDecl
		case .varDecl: return CXCursor_VarDecl
		case .parmDecl: return CXCursor_ParmDecl
		case .objCInterfaceDecl: return CXCursor_ObjCInterfaceDecl
		case .objCCategoryDecl: return CXCursor_ObjCCategoryDecl
		case .objCProtocolDecl: return CXCursor_ObjCProtocolDecl
		case .objCPropertyDecl: return CXCursor_ObjCPropertyDecl
		case .objCIvarDecl: return CXCursor_ObjCIvarDecl
		case .objCInstanceMethodDecl: return CXCursor_ObjCInstanceMethodDecl
		case .objCClassMethodDecl: return CXCursor_ObjCClassMethodDecl
		case .objCImplementationDecl: return CXCursor_ObjCImplementationDecl
		case .objCCategoryImplDecl: return CXCursor_ObjCCategoryImplDecl
		case .typedefDecl: return CXCursor_TypedefDecl
		case .cxxMethod: return CXCursor_CXXMethod
		case .namespace: return CXCursor_Namespace
		case .linkageSpec: return CXCursor_LinkageSpec
		case .constructor: return CXCursor_Constructor
		case .destructor: return CXCursor_Destructor
		case .conversionFunction: return CXCursor_ConversionFunction
		case .templateTypeParameter: return CXCursor_TemplateTypeParameter
		case .nonTypeTemplateParameter: return CXCursor_NonTypeTemplateParameter
		case .templateTemplateParameter: return CXCursor_TemplateTemplateParameter
		case .functionTemplate: return CXCursor_FunctionTemplate
		case .classTemplate: return CXCursor_ClassTemplate
		case .classTemplatePartialSpecialization: return CXCursor_ClassTemplatePartialSpecialization
		case .namespaceAlias: return CXCursor_NamespaceAlias
		case .usingDirective: return CXCursor_UsingDirective
		case .usingDeclaration: return CXCursor_UsingDeclaration
		case .typeAliasDecl: return CXCursor_TypeAliasDecl
		case .objCSynthesizeDecl: return CXCursor_ObjCSynthesizeDecl
		case .objCDynamicDecl: return CXCursor_ObjCDynamicDecl
		case .cxxAccessSpecifier: return CXCursor_CXXAccessSpecifier
		case .firstDecl: return CXCursor_FirstDecl
		case .lastDecl: return CXCursor_LastDecl
		case .firstRef: return CXCursor_FirstRef
		case .objCSuperClassRef: return CXCursor_ObjCSuperClassRef
		case .objCProtocolRef: return CXCursor_ObjCProtocolRef
		case .objCClassRef: return CXCursor_ObjCClassRef
		case .typeRef: return CXCursor_TypeRef
		case .cxxBaseSpecifier: return CXCursor_CXXBaseSpecifier
		case .templateRef: return CXCursor_TemplateRef
		case .namespaceRef: return CXCursor_NamespaceRef
		case .memberRef: return CXCursor_MemberRef
		case .labelRef: return CXCursor_LabelRef
		case .overloadedDeclRef: return CXCursor_OverloadedDeclRef
		case .variableRef: return CXCursor_VariableRef
		case .lastRef: return CXCursor_LastRef
		case .firstInvalid: return CXCursor_FirstInvalid
		case .invalidFile: return CXCursor_InvalidFile
		case .noDeclFound: return CXCursor_NoDeclFound
		case .notImplemented: return CXCursor_NotImplemented
		case .invalidCode: return CXCursor_InvalidCode
		case .lastInvalid: return CXCursor_LastInvalid
		case .firstExpr: return CXCursor_FirstExpr
		case .unexposedExpr: return CXCursor_UnexposedExpr
		case .declRefExpr: return CXCursor_DeclRefExpr
		case .memberRefExpr: return CXCursor_MemberRefExpr
		case .callExpr: return CXCursor_CallExpr
		case .objCMessageExpr: return CXCursor_ObjCMessageExpr
		case .blockExpr: return CXCursor_BlockExpr
		case .integerLiteral: return CXCursor_IntegerLiteral
		case .floatingLiteral: return CXCursor_FloatingLiteral
		case .imaginaryLiteral: return CXCursor_ImaginaryLiteral
		case .stringLiteral: return CXCursor_StringLiteral
		case .characterLiteral: return CXCursor_CharacterLiteral
		case .parenExpr: return CXCursor_ParenExpr
		case .unaryOperator: return CXCursor_UnaryOperator
		case .arraySubscriptExpr: return CXCursor_ArraySubscriptExpr
		case .binaryOperator: return CXCursor_BinaryOperator
		case .compoundAssignOperator: return CXCursor_CompoundAssignOperator
		case .conditionalOperator: return CXCursor_ConditionalOperator
		case .cStyleCastExpr: return CXCursor_CStyleCastExpr
		case .compoundLiteralExpr: return CXCursor_CompoundLiteralExpr
		case .initListExpr: return CXCursor_InitListExpr
		case .addrLabelExpr: return CXCursor_AddrLabelExpr
		case .stmtExpr: return CXCursor_StmtExpr
		case .genericSelectionExpr: return CXCursor_GenericSelectionExpr
		case .gnuNullExpr: return CXCursor_GNUNullExpr
		case .cxxStaticCastExpr: return CXCursor_CXXStaticCastExpr
		case .cxxDynamicCastExpr: return CXCursor_CXXDynamicCastExpr
		case .cxxReinterpretCastExpr: return CXCursor_CXXReinterpretCastExpr
		case .cxxConstCastExpr: return CXCursor_CXXConstCastExpr
		case .cxxFunctionalCastExpr: return CXCursor_CXXFunctionalCastExpr
		case .cxxTypeidExpr: return CXCursor_CXXTypeidExpr
		case .cxxBoolLiteralExpr: return CXCursor_CXXBoolLiteralExpr
		case .cxxNullPtrLiteralExpr: return CXCursor_CXXNullPtrLiteralExpr
		case .cxxThisExpr: return CXCursor_CXXThisExpr
		case .cxxThrowExpr: return CXCursor_CXXThrowExpr
		case .cxxNewExpr: return CXCursor_CXXNewExpr
		case .cxxDeleteExpr: return CXCursor_CXXDeleteExpr
		case .unaryExpr: return CXCursor_UnaryExpr
		case .objCStringLiteral: return CXCursor_ObjCStringLiteral
		case .objCEncodeExpr: return CXCursor_ObjCEncodeExpr
		case .objCSelectorExpr: return CXCursor_ObjCSelectorExpr
		case .objCProtocolExpr: return CXCursor_ObjCProtocolExpr
		case .objCBridgedCastExpr: return CXCursor_ObjCBridgedCastExpr
		case .packExpansionExpr: return CXCursor_PackExpansionExpr
		case .sizeOfPackExpr: return CXCursor_SizeOfPackExpr
		case .lambdaExpr: return CXCursor_LambdaExpr
		case .objCBoolLiteralExpr: return CXCursor_ObjCBoolLiteralExpr
		case .objCSelfExpr: return CXCursor_ObjCSelfExpr
		case .ompArraySectionExpr: return CXCursor_OMPArraySectionExpr
		case .lastExpr: return CXCursor_LastExpr
		case .firstStmt: return CXCursor_FirstStmt
		case .unexposedStmt: return CXCursor_UnexposedStmt
		case .labelStmt: return CXCursor_LabelStmt
		case .compoundStmt: return CXCursor_CompoundStmt
		case .caseStmt: return CXCursor_CaseStmt
		case .defaultStmt: return CXCursor_DefaultStmt
		case .ifStmt: return CXCursor_IfStmt
		case .switchStmt: return CXCursor_SwitchStmt
		case .whileStmt: return CXCursor_WhileStmt
		case .doStmt: return CXCursor_DoStmt
		case .forStmt: return CXCursor_ForStmt
		case .gotoStmt: return CXCursor_GotoStmt
		case .indirectGotoStmt: return CXCursor_IndirectGotoStmt
		case .continueStmt: return CXCursor_ContinueStmt
		case .breakStmt: return CXCursor_BreakStmt
		case .returnStmt: return CXCursor_ReturnStmt
		case .gccAsmStmt: return CXCursor_GCCAsmStmt
		case .asmStmt: return CXCursor_AsmStmt
		case .objCAtTryStmt: return CXCursor_ObjCAtTryStmt
		case .objCAtCatchStmt: return CXCursor_ObjCAtCatchStmt
		case .objCAtFinallyStmt: return CXCursor_ObjCAtFinallyStmt
		case .objCAtThrowStmt: return CXCursor_ObjCAtThrowStmt
		case .objCAtSynchronizedStmt: return CXCursor_ObjCAtSynchronizedStmt
		case .objCAutoreleasePoolStmt: return CXCursor_ObjCAutoreleasePoolStmt
		case .objCForCollectionStmt: return CXCursor_ObjCForCollectionStmt
		case .cxxCatchStmt: return CXCursor_CXXCatchStmt
		case .cxxTryStmt: return CXCursor_CXXTryStmt
		case .cxxForRangeStmt: return CXCursor_CXXForRangeStmt
		case .sehTryStmt: return CXCursor_SEHTryStmt
		case .sehExceptStmt: return CXCursor_SEHExceptStmt
		case .sehFinallyStmt: return CXCursor_SEHFinallyStmt
		case .msAsmStmt: return CXCursor_MSAsmStmt
		case .nullStmt: return CXCursor_NullStmt
		case .declStmt: return CXCursor_DeclStmt
		case .ompParallelDirective: return CXCursor_OMPParallelDirective
		case .ompSimdDirective: return CXCursor_OMPSimdDirective
		case .ompForDirective: return CXCursor_OMPForDirective
		case .ompSectionsDirective: return CXCursor_OMPSectionsDirective
		case .ompSectionDirective: return CXCursor_OMPSectionDirective
		case .ompSingleDirective: return CXCursor_OMPSingleDirective
		case .ompParallelForDirective: return CXCursor_OMPParallelForDirective
		case .ompParallelSectionsDirective: return CXCursor_OMPParallelSectionsDirective
		case .ompTaskDirective: return CXCursor_OMPTaskDirective
		case .ompMasterDirective: return CXCursor_OMPMasterDirective
		case .ompCriticalDirective: return CXCursor_OMPCriticalDirective
		case .ompTaskyieldDirective: return CXCursor_OMPTaskyieldDirective
		case .ompBarrierDirective: return CXCursor_OMPBarrierDirective
		case .ompTaskwaitDirective: return CXCursor_OMPTaskwaitDirective
		case .ompFlushDirective: return CXCursor_OMPFlushDirective
		case .sehLeaveStmt: return CXCursor_SEHLeaveStmt
		case .ompOrderedDirective: return CXCursor_OMPOrderedDirective
		case .ompAtomicDirective: return CXCursor_OMPAtomicDirective
		case .ompForSimdDirective: return CXCursor_OMPForSimdDirective
		case .ompParallelForSimdDirective: return CXCursor_OMPParallelForSimdDirective
		case .ompTargetDirective: return CXCursor_OMPTargetDirective
		case .ompTeamsDirective: return CXCursor_OMPTeamsDirective
		case .ompTaskgroupDirective: return CXCursor_OMPTaskgroupDirective
		case .ompCancellationPointDirective: return CXCursor_OMPCancellationPointDirective
		case .ompCancelDirective: return CXCursor_OMPCancelDirective
		case .ompTargetDataDirective: return CXCursor_OMPTargetDataDirective
		case .lastStmt: return CXCursor_LastStmt
		case .translationUnit: return CXCursor_TranslationUnit
		case .firstAttr: return CXCursor_FirstAttr
		case .unexposedAttr: return CXCursor_UnexposedAttr
		case .ibActionAttr: return CXCursor_IBActionAttr
		case .ibOutletAttr: return CXCursor_IBOutletAttr
		case .ibOutletCollectionAttr: return CXCursor_IBOutletCollectionAttr
		case .cxxFinalAttr: return CXCursor_CXXFinalAttr
		case .cxxOverrideAttr: return CXCursor_CXXOverrideAttr
		case .annotateAttr: return CXCursor_AnnotateAttr
		case .asmLabelAttr: return CXCursor_AsmLabelAttr
		case .packedAttr: return CXCursor_PackedAttr
		case .pureAttr: return CXCursor_PureAttr
		case .constAttr: return CXCursor_ConstAttr
		case .noDuplicateAttr: return CXCursor_NoDuplicateAttr
		case .cudaConstantAttr: return CXCursor_CUDAConstantAttr
		case .cudaDeviceAttr: return CXCursor_CUDADeviceAttr
		case .cudaGlobalAttr: return CXCursor_CUDAGlobalAttr
		case .cudaHostAttr: return CXCursor_CUDAHostAttr
		case .cudaSharedAttr: return CXCursor_CUDASharedAttr
		case .visibilityAttr: return CXCursor_VisibilityAttr
		case .lastAttr: return CXCursor_LastAttr
		case .preprocessingDirective: return CXCursor_PreprocessingDirective
		case .macroDefinition: return CXCursor_MacroDefinition
		case .macroExpansion: return CXCursor_MacroExpansion
		case .macroInstantiation: return CXCursor_MacroInstantiation
		case .inclusionDirective: return CXCursor_InclusionDirective
		case .firstPreprocessing: return CXCursor_FirstPreprocessing
		case .lastPreprocessing: return CXCursor_LastPreprocessing
		case .moduleImportDecl: return CXCursor_ModuleImportDecl
		case .firstExtraDecl: return CXCursor_FirstExtraDecl
		case .lastExtraDecl: return CXCursor_LastExtraDecl
		case .overloadCandidate: return CXCursor_OverloadCandidate
		}
	}
}


func ~=(lhs: CXCursorKind, rhs: CXCursorKind) -> Bool {
	return lhs == rhs
}

