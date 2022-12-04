import Cocoa

/* ------------------------------------ declare variable ------------------------------------ */
// var variableName = <initial value>
var varA = 0;
print(varA);

var varB:Float;
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




/* ------------------------------------ "?" Optionals  ------------------------------------ */
/* variable "optionalInteger" is "Optional Integer" type.
 "Optional" type includes "None" and "Some<T>" types,
 for express the variable which may exists or not. */
// Both declarations are same
var optionalInteger1:Int?;
var optionalInteger2:Optional<Int>;

var optionalIntArray:[Int]?;

var optionalString1:String? = nil;
if (optionalString1 != nil) {
    print(optionalString1);
} else {
    print("optionalString1 is nil" );
}



/* ------------------------------------ "!" => forced unwrapping  ------------------------------------ */
/* Use "!", get the value of an Optional Type. */
var optionalInteger3 = 42;
//optionalInteger3!; => ERROR: Cannot force unwrap value of non-optional type 'Int'
var optionalInteger4:Int? = 42;
optionalInteger4!; // => 42

var optionalString2:String?;
optionalString2 = "Hello, Swift!";

if (optionalString2 != nil) {
    print(optionalString2); // Optional("Hello, Swift!") => WARNING: Expression implicitly coerced from 'String?' to 'Any'
} else {
    print("optionalString2 is nil");
}


if (optionalString2 != nil) {
    // forced unwrapping
    print(optionalString2!); // Hello, Swift!
} else {
    print("optionalString2 is nil");
}



/* ------------------------------------ auto unwrapping  ------------------------------------ */
/* declare variable with Optional Symbol "!", will auto unwrapping while useing it */
var optionalString3:String!;
print(optionalString3);

optionalString3 = "Hello, Swift!";

if optionalString3 != nil {
    print(optionalString3);
} else {
    print("optionalString3 is nil");
}



/* ------------------------------------ optional binding  ------------------------------------ */
/*
 if let constantName = someOptional { statements }
 */
var optionalString4:String?;

optionalString4 = "Hello, Swift";

if let tempString = optionalString4 {
    print("optionalString4 is: \(tempString)");
} else {
    print("optionalString4 is nil");
}
