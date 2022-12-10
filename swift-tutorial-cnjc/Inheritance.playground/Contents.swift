import Cocoa

/* ------------------------------------ Inheritance ------------------------------------ */
/*
 A class can inherit methods, properties, and other characteristics from another class.
 When one class inherits from another, the inheriting class is known as a subclass,
 and the class it inherits from is known as its superclass.
 Inheritance is a fundamental behavior that differentiates classes from other types in Swift.

 Classes in Swift can call and access methods, properties, and subscripts belonging to
 their superclass and can provide their own overriding versions of those methods, properties,
 and subscripts to refine or modify their behavior. Swift helps to ensure your overrides are
 correct by checking that the override definition has a matching superclass definition.

 Classes can also add property observers to inherited properties in order to be notified
 when the value of a property changes. Property observers can be added to any property,
 regardless of whether it was originally defined as a stored or computed property.
 */



/* ------------------------------------ Defining a Base Class ------------------------------------ */
/*
 Any class that doesn’t inherit from another class is known as a base class.
 */
class Info {
    var firstName: String!
    var lastName: String!
    var height: Double!
    var weight: Double!
    
    init(_firstName: String, _lastName: String, _height: Double, _weight: Double ) {
        self.firstName = _firstName
        self.lastName = _lastName
        self.height = _height
        self.weight = _weight
    }
}
let firstName = "Hello, "
let lastName = "World!"
let height = 180.00
let weight = 88.00

let info = Info(_firstName: firstName, _lastName: lastName, _height: height, _weight: weight)

print(info.firstName) // => Hello,
print(info.lastName)  // => World!
print(info.height)    // => 180.0
print(info.weight)    // => 88.0
