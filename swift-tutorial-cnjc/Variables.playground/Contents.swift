import Cocoa

/* ------------------------------------ declare variable ------------------------------------ */
// var variableName = <initial value>
var varA = 0;
print(varA);

var varB: Float;
varB = 3.14159;
print(varB);



/* ------------------------------------ variable naming rules ------------------------------------ */
var _var = "Hello, Swift!"; // startsWith("_")
var 안녕 = "안녕, 세계!"; // can naming by korean
var 你好 = "你好, 世界!"; // alse can use chinese
print(안녕);
print(你好);



/* ------------------------------------ variable output ------------------------------------ */
var firstName = "IAN";
var lastName = "CHOI";
print("\(firstName) \(lastName)");




/* ------------------------------------ Optionals  ------------------------------------ */
/* variable "optionalInteger" is "Optional Integer" type.
   "Optional" type includes "None" and "Some<T>" types,
   for express the variable which may exists or not. */
// Both declarations are same
var optionalInteger1: Int?;
var optionalInteger2: Optional<Int>;

var optionalIntArray: [Int]?;
   



