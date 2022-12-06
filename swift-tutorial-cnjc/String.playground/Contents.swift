import Cocoa

/* ------------------------------------ String ------------------------------------ */
// String Literal
var stringA = "Hello, World!";
print(stringA);

// String Instantiation
var stringB = String("Hello, World!");
print(stringB);



/* ------------------------------------ Empty String ------------------------------------ */
var stringC = "";
if stringC.isEmpty {
    print("stringC is empty");
} else {
    print("stringC is not empty");
}



/* ------------------------------------ String Constant ------------------------------------ */
// can modity stringD
var stringD = "Hello";
stringD += ", World!";
print(stringD);

// can not modify StringE
let stringE = String("Hello");
//stringE += ", World!"; => ERROR: Left side of mutating operator isn't mutable: 'stringE' is a 'let' constant
print(stringE);



/* ------------------------------------ Nested String ------------------------------------ */
var varA = 20;
let constA = 100;
var varB:Float = 20.0;
var stringF = "\(varA) * \(constA) = \(varB * 100)";
print(stringF);



/* ------------------------------------ String Concat ------------------------------------ */
let constB = "Hello";
let constC = ", World!";
var stringG = constB + constC;
print(stringG);



/* ------------------------------------ String Length ------------------------------------ */
var varC = "Hello, World!";
print("\(varC), length is \(varC.count)");



/* ------------------------------------ String Compare ------------------------------------ */
var varD = "Hello, World!";
var varE = "Hello, Swift!";
if varD == varE {
    print("\(varD) == \(varE)");
} else {
    print("\(varD) != \(varE)");
}



/* ------------------------------------ Unicode String ------------------------------------ */
var unicodeString = "Hello, World!";
print("UTF-8 Codes is: ");
for code in unicodeString.utf8 {
    print("\(code)");
}
print("UTF-16 Codes is: ")
for code in unicodeString.utf16 {
    print("\(code)");
}
print("Unicode Scalars is: ")
for code in unicodeString.unicodeScalars {
    print("\(code)");
}



/* ------------------------------------ String Split ------------------------------------ */
let stringH = "Hello, World!";
let stringHArr1 = stringH.components(separatedBy: " ");
print("stringHArr1[0] is \(stringHArr1[0])");
print("stringHArr1[1] is \(stringHArr1[1])");



/* ------------------------------------ String Function & Operator ------------------------------------ */
/*
   1.  String.isEmpty                                 => check if String is nil, return Bool
   2.  hasPrefix(prefix: String)                      => check if String has prefix, return Bool
   3.  hasSuffix(suffix: String)                      => check if String has suffix, return Bool
   4.  Int(String)                                    => transform String to Int
   5.  String.count (Swift3: String.characters.count) => return String's length, return Int
   6.  String.utf8                                    => return String's uft8 codes, return [Uint8]
   7.  String.uft16                                   => return String's uft16 codes, return [Uint16]
   8.  String.unicodeScalars                          => return String's unicodes scalars, return [Scalar]
   9.  StirngA + StringB                              => concat StringA and StringB
   10. StringA += StringB                             => concat StringA and StringB, and assign to StringA
   11. StringA == StringB                             => check if StringA and StringB is same
   12. StringA < StringB                              => compare StringA and StringB
   13. StringA != StringB                             => check if StringA and StringB is not same
   14. StringA.components(separatedBy: StringB)       => split StringA by StringB, return [String]
 */
