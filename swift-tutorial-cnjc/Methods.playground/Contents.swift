import Cocoa

/* ------------------------------------ Method declaration ------------------------------------ */
/*
 Methods are functions that are associated with a particular type. Classes, structures,
 and enumerations can all define instance methods, which encapsulate specific tasks and
 functionality for working with an instance of a given type. Classes, structures,
 and enumerations can also define type methods, which are associated with the type itself.
 Type methods are similar to class methods in Objective-C.
 
 The fact that structures and enumerations can define methods in Swift is a major difference
 from C and Objective-C. In Objective-C, classes are the only types that can define methods.
 In Swift, you can choose whether to define a class, structure, or enumeration,
 and still have the flexibility to define methods on the type you create.
 */
/*
     func funcname(Parameters) -> returnType {
         Statement 1
         Statement 2
         ...
         Statement N
         return value:returnType
     }
 */
class Counter {
    var count = 0;
    func increase() {
        count += 1;
    }
    func decrease() {
        count -= 1;
    }
    func increaseBy(amount: Int) {
        count += amount;
    }
    func decreaseBy(amount: Int) {
        count -= amount;
    }
    func reset() {
        count = 0;
    }
}
let counter = Counter();
counter.increase();
print(counter.count); // => 1
counter.increaseBy(amount: 5);
print(counter.count); // => 6
counter.decrease();
print(counter.count); // => 5
counter.decreaseBy(amount: 2);
print(counter.count); // => 3
counter.reset();
print(counter.count); // => 0



/* ------------------------------------ The self Propert ------------------------------------ */
/*
 Every instance of a type has an implicit property called self,
 which is exactly equivalent to the instance itself.
 You use the self property to refer to the current instance within its own instance methods.
 */
class Name1 {
    let firstName: String;
    let midName: String;
    let fullName: String;
    
    init(_firstName: String, _midName: String) {
        self.firstName = _firstName;
        self.midName = _midName;
        fullName = firstName + midName;
        print("fullName => \(fullName)"); // => Hello,
    }
    
    func addLastName(_lastName: String) -> String {
        return fullName + _lastName;
    }
    
    func result() {
        print("result => \(addLastName(_lastName: "World!"))"); // => Hello, World!
    }
}

let name1 = Name1(_firstName: "Hello", _midName: ", ");
name1.result()



/* ------------------------------------ Modifying Value Types from Within Instance Methods ------------------------------------ */
/*
 Structures and enumerations are value types. By default, the properties
 of a value type can’t be modified from within its instance methods.

 However, if you need to modify the properties of your structure or enumeration within a
 particular method, you can opt in to mutating behavior for that method.
 The method can then mutate (that is, change) its properties from within the method,
 and any changes that it makes are written back to the original structure when the method ends.
 The method can also assign a completely new instance to its implicit self property,
 and this new instance will replace the existing one when the method ends.
 */
struct area {
    var length = 1;
    var breadth = 1;
    
    func area() -> Int {
        return length * breadth;
    }
    
    mutating func scaleBy(res: Int) {
        length *= res;
        breadth *= res;
        print("length => \(length)");   // => [ 9, 270,  81000]
        print("breadth => \(breadth)"); // => [15, 450, 135000]
    }
}

var val = area(length: 3, breadth: 5);
val.scaleBy(res: 3);
val.scaleBy(res: 30);
val.scaleBy(res: 300);



/* ------------------------------------ Assigning to self Within a Mutating Method ------------------------------------ */
/*
 Mutating methods can assign an entirely new instance to the implicit self property.
 */
struct area2 {
    var length = 1;
    var breadth = 1;
    
    func area() -> Int {
        return length * breadth;
    }
    
    mutating func scaleBy(res: Int) {
        self.length *= res;
        self.breadth *= res;
        print("length => \(length)");   // => 39
        print("breadth => \(breadth)"); // => 65
    }
}
var val2 = area(length: 3, breadth: 5);
val2.scaleBy(res: 13);



/* ------------------------------------ Type Methods ------------------------------------ */
/*
 Instance methods, as described above, are methods that you call on an instance of a particular type.
 You can also define methods that are called on the type itself. These kinds of methods are called type methods.
 You indicate type methods by writing the static keyword before the method’s func keyword.
 Classes can use the class keyword instead, to allow subclasses to override the superclass’s implementation of that method.
 
 NOTE:
     In Objective-C, you can define type-level methods only for Objective-C classes.
     In Swift, you can define type-level methods for all classes, structures, and enumerations.
     Each type method is explicitly scoped to the type it supports.
 */
class Math {
    class func abs(number: Int) -> Int {
        if number < 0 {
            return (-number);
        } else {
            return number;
        }
    }
}

struct absno {
    static func abs(number: Int) -> Int {
        if number < 0 {
            return (-number);
        } else {
            return number;
        }
    }
}

let no = Math.abs(number: -35);
let num = absno.abs(number: -15);
print("no => \(no)");   // => 35
print("num => \(num)"); // => 15
