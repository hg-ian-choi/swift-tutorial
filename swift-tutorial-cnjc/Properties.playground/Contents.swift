import Cocoa

/* ------------------------------------ Stored Properties ------------------------------------ */
/*
 In its simplest form, a stored property is a constant or variable that’s
 stored as part of an instance of a particular class or structure.
 Stored properties can be either variable stored properties (introduced by
 the var keyword) or constant stored properties (introduced by the let keyword).
 */
struct Name {
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
print(result.middle);        // => (150.0, 75.0)
result.middle = (0.0, 10.0);
print(result.no1);           // => -150.0
print(result.no2);           // => -65.0



/* ------------------------------------ Read-Only Computed Properties ------------------------------------ */
/*
 A computed property with a getter but no setter is known as a read-only computed property.
 A read-only computed property always returns a value, and can be accessed through dot syntax,
 but can’t be set to a different value.
 
 NOTE:
     You must declare computed properties—including read-only computed properties—as variable properties with
     the var keyword, because their value isn’t fixed. The let keyword is only used for constant properties,
     to indicate that their values can’t be changed once they’re set as part of instance initialization.
 */
class PersonA {
    var firstName = "Hello, ";
    var lastName = "World!";
    var age = 30;
    var info: [String:String] {
        return [
            "first_name": self.firstName,
            "last_name": self.lastName,
            "age": "\(self.age)"
        ]
    }
}

var personA = PersonA();
personA.lastName = "Swift!";
personA.age = 18;
print(personA.info["last_name"]!); // => Swift!
print(personA.info["age"]!);       // =>18



/* ------------------------------------ Property Observers ------------------------------------ */
/*
 Property observers observe and respond to changes in a property’s value.
 Property observers are called every time a property’s value is set,
 even if the new value is the same as the property’s current value.
 
 You can add property observers in the following places:
     1. Stored properties that you define
     2. Stored properties that you inherit
     3. Computed properties that you inherit

 For an inherited property, you add a property observer by overriding that property in a subclass.
 For a computed property that you define, use the property’s setter to observe and respond to value changes,
 instead of trying to create an observer. Overriding properties is described in Overriding.

 You have the option to define either or both of these observers on a property:
    1. willSet is called just before the value is stored.
    2. didSet is called immediately after the new value is stored.
 
 If you implement a willSet observer, it’s passed the new property value as a constant parameter.
 You can specify a name for this parameter as part of your willSet implementation.
 If you don’t write the parameter name and parentheses within your implementation,
 the parameter is made available with a default parameter name of newValue.

 Similarly, if you implement a didSet observer, it’s passed a constant parameter containing the old property value.
 You can name the parameter or use the default parameter name of oldValue.
 If you assign a value to a property within its own didSet observer,
 the new value that you assign replaces the one that was just set.
 
 NOTE:
    The willSet and didSet observers of superclass properties are called when a property is set in a subclass initializer,
    after the superclass initializer has been called. They aren’t called while a class is setting its own properties,
    before the superclass initializer has been called.
 */
class Samplepgm {
    var counter: Int = 0{
        willSet(newTotal) {
            print("counter: => \(newTotal)");
        }
        didSet {
            if counter > oldValue {
                print("new count => \(counter - oldValue)");
            }
        }
    }
}
let NewCounter = Samplepgm();
NewCounter.counter = 100;
NewCounter.counter = 800;

