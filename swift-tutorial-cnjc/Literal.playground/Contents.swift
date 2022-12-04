import Cocoa

/* ------------------------------------ Literal ------------------------------------ */
let number = 3;
print(type(of: number)); // => Int

let double = 3.14;
print(type(of: double)); // => Double

let string = "Hello";
print(type(of: string)); // => String

let bool = true;
print(type(of: bool)); // => Bool



/* ------------------------------------ Integer Literal ------------------------------------ */
let decimalInteger = 17;       // decimal
let binaryInteger = 0b1001;    // binary => startsWith("0b")
let octalInteger = 0o21;       // octal => startsWith("0o")
let hexadecimalInteger = 0x11; // hexadecimal => startsWith("0x")



/* ------------------------------------ Float Literal ------------------------------------ */
let decimalDouble = 12.1875;       // decimal Double
let exponentDouble = 1.21875e1;    // decimal Double
let hexadecimalDouble = 0xC.3p0;   // hexadecimal Double



/* ------------------------------------ Characters Literal ------------------------------------ */
// string is characters wrapped by double quotes
var characters:String = "characters";

/*
 \0 => Null
 \\ => Backslash(\)
 \b => Backspace(←)
 \f => Fromfeed(↡)
 \n => Linefeed(↓)
 \r => Enter(↵)
 \t => Tab(↹)
 \v => Vertical Tab
 \' => Single Quoto
 \" => Double Quoto
 \000 => Any character represented by an octal number of 1 to 3 digits
 \xhh... => Any character represented by a 1 - to 2-digit hexadecimal
 */

// but can not include "not transferred" [Double Quotes("), Backslash(\), Enter(↵), Linefeed(↓), etc.]
let stringLiteral = "Hello\tWorld\n\n\'//IAN | CHOI\'";
print(stringLiteral);



/* ------------------------------------ Boolean Literal ------------------------------------ */
var boolLiteral:Bool?;
boolLiteral = true;  // 1
boolLiteral = false; // 0
boolLiteral = nil;   // 0
