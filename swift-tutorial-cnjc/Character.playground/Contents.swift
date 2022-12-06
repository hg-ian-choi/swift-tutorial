import Cocoa

/* ------------------------------------ Character ------------------------------------ */
/* only one word is allowed */
//let charAB: Character = "AB"; => ERROR: Cannot convert value of type 'String' to specified type 'Character'

let charA: Character = "A";
let charB: Character = "B";
print("charA = \(charA)");
print("charB = \(charB)");



/* ------------------------------------ Empty Character ------------------------------------ */
/* Empty Character is not allowed */
//let emptyChar: Character = ""; => ERROR: Cannot convert value of type 'String' to specified type 'Character'



/* ------------------------------------ Traversal ------------------------------------ */
for char in "Hello, World!" {
    print(char);
}



/* ------------------------------------ Concat ------------------------------------ */
var string:String = "Hello, World";
let char:Character = "!";
string.append(char);
print("string  =  \(string)");
