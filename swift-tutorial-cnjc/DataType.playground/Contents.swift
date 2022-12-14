import Cocoa

/* ------------------------------------ variable type ------------------------------------ */
let int:Int = -42;                   // Integer (int)
let uint:UInt = 42;                  // Unsigned Integer (uint)
let float:Float = 3.14;              // float
let double:Double = 3.1415926;       // double
let string:String = "Hello, World!"; // string
let bool:Bool = true;                // Boolean
let character:Character = "C";       // character (char)
let optional:Optional = {};          // Optional (include null and undefined)



/* ------------------------------------ range ------------------------------------ */
let int8_range:Int8 = -128;                     // 1 byte => -128 ~ 127
let uint8_range:UInt8 = 255;                    // 1 byte => 0 ~ 255
let int32_range:Int32 = -2147483648;            // 4 bytes => -2147483648 ~ 2147483647
let uint32_range:UInt32 = 4294967295;           // 4 bytes => 0 ~ 4294967295
let int64_range:Int64 = -9223372036854775808;   // 8 bytes => -9223372036854775808 ~ 9223372036854775807
let uint64_range:UInt64 = 18446744073709551615; // 8 bytes => 0 ~ 18446744073709551615
let float_range:Float = 3.4E+38;                // 4 bytes => 1.2E-38 ~ 3.4E+38 (~6 digits)
let double_range:Double = 1.7E+308;             // 8 bytes => 2.3E-308 ~ 1.7E+308 (~15 digits)



/* ------------------------------------ typealias ------------------------------------ */
// ex) typealias newname = type
typealias Feet = Int;   // Feet = Int
let feet:Feet = 100;   // 100
print(feet);            // 100
print(type(of: feet)); // => Int



/* ------------------------------------ type safe ------------------------------------ */
var varA = 42;
// varA = "Hello, World"; => error: Cannot assign value of type 'String' to type 'Int'

/* ------------------------------------ type inference ------------------------------------ */
let notDeclareType = 42;         // auto type => Int
print(type(of: notDeclareType)); // Int
let pi = 3.1415926;              // auto type => Double
print(type(of: pi));             // Double
var c = 3 + 0.1415926;           // auto type => Double
print(type(of: c));              // Double
