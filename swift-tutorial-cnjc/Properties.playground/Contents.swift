import Cocoa

/* ------------------------------------ Stored Properties ------------------------------------ */
/*
 In its simplest form, a stored property is a constant or variable that’s
 stored as part of an instance of a particular class or structure.
 Stored properties can be either variable stored properties (introduced by
 the var keyword) or constant stored properties (introduced by the let keyword).
 */
struct Name
{
    let firstName = "Hello, ";
    var lastName: String;
}

var fullname = Name(lastName: "World!");
//fullname.firstName = ""; => ERROR: Cannot assign to property: 'firstName' is a 'let' constant
fullname.lastName = "Swift!";

print("firstName = \(fullname.firstName)");
print("lastName = \(fullname.lastName)");



/* ------------------------------------ Lazy Stored Properties ------------------------------------ */
/*
 A lazy stored property is a property whose initial value isn’t calculated until the first time it’s used.
 You indicate a lazy stored property by writing the lazy modifier before its declaration.
 
 NOTE:
     You must always declare a lazy property as a variable (with the var keyword),
     because its initial value might not be retrieved until after instance initialization completes.
     Constant properties must always have a value before initialization completes,
     and therefore can’t be declared as lazy.
 */
class Name1 {
    lazy var firstName = Name2(); // Must using `var`
}

class Name2 {
    var lastName = "World!";
}

var name = Name1();
print("firstName = \(name.firstName.lastName)");



/* ------------------------------------ Computed Properties ------------------------------------ */
/*
 In addition to stored properties, classes, structures, and enumerations can define
 computed properties, which don’t actually store a value. Instead, they provide a getter
 and an optional setter to retrieve and set other properties and values indirectly.
 */
class sample {
    var no1 = 0.0, no2 = 0.0;
    var length = 300.0, breadth = 150.0;
    
    var middle: (Double, Double) {
        get {
            return (length / 2, breadth / 2);
        }
        set(axis) {
            no1 = axis.0 - (length / 2);
            no2 = axis.1 - (breadth / 2);
        }
    }
}

var result = sample();
print(result.middle); // => (150.0, 75.0)
result.middle = (0.0, 10.0);
print(result.no1); // => -150.0
print(result.no2); // => -65.0

