import Cocoa

var greeting:String;
greeting = "Hello, playground" // semicolon(;) is not necessary
greeting = "Hello, playground" // or add semicolon(;) at end of code

// single line contains multiple codes, need semicolon(;)
//var hw = "Hello, World!" print(hw) // => ERROR: Consecutive statements on a line must be separated by ';'.
var hw = "Hello, World!"; print(hw)



/* ------------------------------------ comment ------------------------------------ */
// single line comment

/* multiple
 line
 comment */

/* start of comment
 /* another comment */
 end of comment */



/* ------------------------------------ identifier ------------------------------------ */
// uppercase != lowercase
var Myname:String?;
var myname:String?;

// can startsWith "_"
var _myName:String?;

// not allowed to startsWith "number"
//var 8myName:String?; => ERROR: 'm' is not a valid digit in integer literal.

// not allowed to contain special symbols, except underline(_)
//var myName#:String?; => ERROR: Consecutive statements on a line must be separated by ';'.

// now allowed to use keyword
//var class:String?; => ERROR: Keyword 'class' cannot be used as an identifier here.

// can use keyword by wrapping identifier by backquote（`) => Not Recommended
var `class`:String?;


/* ------------------------------------ keyword ------------------------------------ */
/*
 => declare keyword:
 class    deinit     enum     extension   func        import
 init     internal   let      operator    private     protocol
 public   static     struct   subscript   typealias   var
 */
/*
 => grammar keyword:
 break   case   continue   default   do       else    fallthrough
 for     if     in         return    switch   where   while
 */
/*
 => expression & type keyword:
 as      dynamicType   false      is       nil         self     Self
 super   true          _COLUMN_   _FILE_   _FUNCTION_  _LINE_
 */
/*
 => special keyword:
 associativity convenience dynamic didSet final get inifix inout lazy left mutating none
 nonmutating optional override postfix precedence prefix Protocol required right set Type
 unowned weak willSet
 */



/* ------------------------------------ space ------------------------------------ */
// let a= 1 + 2 => error: '=' must have consistent whitespace on both sides
// let a = 1+ 2 => error: '+' is not a postfix unary operator
let a = 1 + 2 // => right
let b = 3+4 // => also right



/* ------------------------------------ print ------------------------------------ */
print("Hello, World!");

for x in 0...10 {
    print("\(x)", terminator: " ");
}

let theInput = readLine();



/* ------------------------------------ literal ------------------------------------ */
42             // integer
3.14159        // float
"Hello, World" // string
true           // boolean
