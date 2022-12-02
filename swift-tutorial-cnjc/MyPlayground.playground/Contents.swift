import UIKit

var greeting: String;
greeting = "Hello, playground" // semicolon(;) is not necessary
greeting = "Hello, playground" // or add semicolon(;) at end of code

// need semicolon(;)
var hw = "Hello, World!"; print(hw)



/* ------------------------------------ comment ------------------------------------ */
// one line comment

/* multiple
 line
 comment */

/* start of comment
 /* another comment */
 end of comment */



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
let b = 3+4 // => alse right



/* ------------------------------------ variable type ------------------------------------ */
let int:Int = -42;                   // Integer (int)
let uint:UInt = 42;                  // Unsigned Integer (uint)
let float:Float = 3.14;              // float
let double:Double = 3.1415926;       // double
let string:String = "Hello, World!"; // string
let bool:Bool = true;                // Boolean
let character: Character = "C";      // character (char)
let optional:Optional = {};          // Optional (include null and undefined)


/* ------------------------------------ print ------------------------------------ */
print("Hello, World!");

for x in 0...10 {
    print("\(x)", terminator: " ");
}

let theInput = readLine();
