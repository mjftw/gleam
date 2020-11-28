@0xb533a99cfdbcedbe;

struct Module {
  name @0 :Text;
  types @1 :Map(Text, Type);
  values @2 :Map(Text, ValueConstructor);
  accessors @3 :Map(Text, AccessorsMap);
}

struct AccessorsMap {
  type @0 :Type;
  accessors @1 :Map(Text, RecordAccessor);

  struct RecordAccessor {
    type @0 :Type;
    index @1 :UInt16;
  }
}

struct Map(Key, Value) {
  entries @0 :List(Entry);
  struct Entry {
    key @0 :Key;
    value @1 :Value;
  }
}

struct Type {
  union {
    app :group {
      name @0 :Text;
      parameters @1 :List(Type);
    }

    fn :group {
      arguments @2 :List(Type);
      return @3 :Type;
    }

    var :group {
      id @4 :UInt16;
    }

    tuple :group {
      elements @5 :List(Type);
    }
  }
}

struct ValueConstructor {
  type @0 :Type;
  # ValueConstructorVariant
}

# pub enum ValueConstructorVariant {
#     /// A locally defined variable or function parameter
#     LocalVariable,
# 
#     /// A module constant
#     ModuleConstant {
#         literal: Constant<Arc<Type>, String>,
#     },
# 
#     /// A function belonging to the module
#     ModuleFn {
#         name: String,
#         field_map: Option<FieldMap>,
#         module: Vec<String>,
#         arity: usize,
#     },
# 
#     /// A constructor for a custom type
#     Record {
#         name: String,
#         field_map: Option<FieldMap>,
#     },
# }

# #[derive(Debug, Clone, PartialEq)]
# pub struct FieldMap {
#     pub arity: usize,
#     pub fields: HashMap<String, usize>,
# }

# #[derive(Debug, PartialEq, Clone)]
# pub enum Constant<T, RecordTag> {
#     Int {
#         location: SrcSpan,
#         value: String,
#     },
# 
#     Float {
#         location: SrcSpan,
#         value: String,
#     },
# 
#     String {
#         location: SrcSpan,
#         value: String,
#     },
# 
#     Tuple {
#         location: SrcSpan,
#         elements: Vec<Self>,
#     },
# 
#     List {
#         location: SrcSpan,
#         elements: Vec<Self>,
#         typ: T,
#     },
# 
#     Record {
#         location: SrcSpan,
#         module: Option<String>,
#         name: String,
#         args: Vec<CallArg<Self>>,
#         tag: RecordTag,
#         typ: T,
#     },
# 
#     BitString {
#         location: SrcSpan,
#         segments: Vec<BitStringSegment<Self, T>>,
#     },
# }
# 
# 
# #[derive(Debug, Clone, PartialEq)]
# pub struct BitStringSegment<Value, Type> {
#     pub location: SrcSpan,
#     pub value: Box<Value>,
#     pub options: Vec<BitStringSegmentOption<Value>>,
#     pub typ: Type,
# }
# 
# #[derive(Debug, PartialEq, Clone)]
# pub enum BitStringSegmentOption<Value> {
#     Binary {
#         location: SrcSpan,
#     },
# 
#     Integer {
#         location: SrcSpan,
#     },
# 
#     Float {
#         location: SrcSpan,
#     },
# 
#     BitString {
#         location: SrcSpan,
#     },
# 
#     UTF8 {
#         location: SrcSpan,
#     },
# 
#     UTF16 {
#         location: SrcSpan,
#     },
# 
#     UTF32 {
#         location: SrcSpan,
#     },
# 
#     UTF8Codepoint {
#         location: SrcSpan,
#     },
# 
#     UTF16Codepoint {
#         location: SrcSpan,
#     },
# 
#     UTF32Codepoint {
#         location: SrcSpan,
#     },
# 
#     Signed {
#         location: SrcSpan,
#     },
# 
#     Unsigned {
#         location: SrcSpan,
#     },
# 
#     Big {
#         location: SrcSpan,
#     },
# 
#     Little {
#         location: SrcSpan,
#     },
# 
#     Native {
#         location: SrcSpan,
#     },
# 
#     Size {
#         location: SrcSpan,
#         value: Box<Value>,
#         short_form: bool,
#     },
# 
#     Unit {
#         location: SrcSpan,
#         value: Box<Value>,
#         short_form: bool,
#     },
# 
#     Invalid {
#         location: SrcSpan,
#         label: String,
#     },
# }
