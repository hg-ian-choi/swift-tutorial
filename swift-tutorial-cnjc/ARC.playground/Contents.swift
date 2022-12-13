import Cocoa

/* ------------------------------------ Automatic Reference Counting ------------------------------------ */
/*
 Swift uses Automatic Reference Counting (ARC) to track and manage your app’s memory usage. In most cases,
 this means that memory management “just works” in Swift, and you don’t need to think about memory management
 yourself. ARC automatically frees up the memory used by class instances when those instances are no longer needed.

 However, in a few cases ARC requires more information about the relationships between parts of your
 code in order to manage memory for you. This chapter describes those situations and shows how you
 enable ARC to manage all of your app’s memory. Using ARC in Swift is very similar to the approach
 described in Transitioning to ARC Release Notes for using ARC with Objective-C.
 
 Reference counting applies only to instances of classes. Structures and enumerations are value types,
 not reference types, and aren’t stored and passed by reference.
 */



/* ------------------------------------ How ARC Works ------------------------------------ */
/*
 Every time you create a new instance of a class, ARC allocates a chunk of memory to store
 information about that instance. This memory holds information about the type of the instance,
 together with the values of any stored properties associated with that instance.

 Additionally, when an instance is no longer needed, ARC frees up the memory used by that
 instance so that the memory can be used for other purposes instead. This ensures that class
 instances don’t take up space in memory when they’re no longer needed.

 However, if ARC were to deallocate an instance that was still in use, it would no longer
 be possible to access that instance’s properties, or call that instance’s methods.
 Indeed, if you tried to access the instance, your app would most likely crash.

 To make sure that instances don’t disappear while they’re still needed, ARC tracks how many
 properties, constants, and variables are currently referring to each class instance. ARC will not
 deallocate an instance as long as at least one active reference to that instance still exists.

 To make this possible, whenever you assign a class instance to a property, constant, or variable,
 that property, constant, or variable makes a strong reference to the instance. The reference is
 called a “strong” reference because it keeps a firm hold on that instance, and doesn’t allow it
 to be deallocated for as long as that strong reference remains.
 */



/* ------------------------------------ ARC in Action ------------------------------------ */
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

// reference1, reference2, reference3 automatically initialized with a value of nil, and don’t currently reference a Person instance.
var reference1: Person?
var reference2: Person?
var reference3: Person?

// create a new Person instance and assign it to one of these three variables
reference1 = Person(name: "(Ian Choi)1") // => (Ian Choi)1 is being initialized

// assign the same Person instance to two more variables, two more strong references to that instance are established
reference2 = reference1
reference3 = reference1

// break two of these strong references (including the original reference) by assigning nil to two of the variables, a single strong reference remains, and the Person instance isn’t deallocated
reference1 = nil
reference2 = nil

// ARC doesn’t deallocate the Person instance until the third and final strong reference is broken, at which point it’s clear that you are no longer using the Person instance
reference3 = nil // => (Ian Choi)1 is being deinitialized



/* ------------------------------------ Strong Reference Cycles Between Class Instances ------------------------------------ */
/*
 In the examples above, ARC is able to track the number of references to the new Person
 instance you create and to deallocate that Person instance when it’s no longer needed.

 However, it’s possible to write code in which an instance of a class never gets to a point where it has
 zero strong references. This can happen if two class instances hold a strong reference to each other,
 such that each instance keeps the other alive. This is known as a strong reference cycle.
 */
class Person2 {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment2?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment2 {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person2?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

// two variables have an initial value of nil
var ian2: Person2?
var chois2: Apartment2?

// create a specific Person instance and Apartment instance and assign these new instances to the ian and chois variables
ian2 = Person2(name: "(Ian Choi)2")
chois2 = Apartment2(unit: "(Chois)2")


// link the two instances together so that the person has an apartment, and the apartment has a tenant. Note that an exclamation point (!) is used to unwrap and access the instances stored inside the ian and chois optional variables, so that the properties of those instances can be set
ian2!.apartment = chois2
chois2!.tenant = ian2

// break the strong references held by the ian and chois variables, the reference counts don’t drop to zero, and the instances aren’t deallocated by ARC
// Note that neither deinitializer was called when you set these two variables to nil. The strong reference cycle prevents the Person and Apartment instances from ever being deallocated, causing a memory leak in your app.
ian2 = nil
chois2 = nil



/* ------------------------------------ Resolving Strong Reference Cycles Between Class Instances ------------------------------------ */
/*
 Swift provides two ways to resolve strong reference cycles when you work with properties of class type:
    weak references and unowned references.
 
 Weak and unowned references enable one instance in a reference cycle to refer to the other instance without keeping
 a strong hold on it. The instances can then refer to each other without creating a strong reference cycle.

 Use a weak reference when the other instance has a shorter lifetime—that is, when the other instance can be deallocated first.
 In the Apartment example above, it’s appropriate for an apartment to be able to have no tenant at some point in its lifetime,
 and so a weak reference is an appropriate way to break the reference cycle in this case. In contrast, use an unowned reference
 when the other instance has the same lifetime or a longer lifetime.
 */



/* ------------------------------------ Weak References ------------------------------------ */
/*
 A weak reference is a reference that doesn’t keep a strong hold on the instance it refers to,
 and so doesn’t stop ARC from disposing of the referenced instance.
 This behavior prevents the reference from becoming part of a strong reference cycle.
 You indicate a weak reference by placing the weak keyword before a property or variable declaration.
 */
class Person3 {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment3?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment3 {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person3?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

// The strong references from the two variables (ian and chois) and the links between the two instances are created as before:
var ian3: Person3?
var chois3: Apartment3?

ian3 = Person3(name: "(Ian Choi)3")
chois3 = Apartment3(unit: "(Chois)3")

ian3!.apartment = chois3
chois3!.tenant = ian3

ian3 = nil // => (Ian Choi)3 is being deinitialized
chois3 = nil // => Apartment (Chois)3 is being deinitialized



/* ------------------------------------ Unowned References ------------------------------------ */
/*
 Like a weak reference, an unowned reference doesn’t keep a strong hold on the instance it refers to.
 Unlike a weak reference, however, an unowned reference is used when the other instance has the same
 lifetime or a longer lifetime. You indicate an unowned reference by placing the unowned keyword
 before a property or variable declaration.

 Unlike a weak reference, an unowned reference is expected to always have a value.
 As a result, marking a value as unowned doesn’t make it optional,
 and ARC never sets an unowned reference’s value to nil.
 
 IMPORTANT:
    Use an unowned reference only when you are sure that the reference always refers to an instance that hasn’t been deallocated.
    If you try to access the value of an unowned reference after that instance has been deallocated, you’ll get a runtime error.
 */
class Customer4 {
    let name: String
    var card: CreditCard4?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard4 {
    let number: UInt64
    unowned let customer: Customer4
    init(number: UInt64, customer: Customer4) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

var ian4: Customer4?

ian4 = Customer4(name: "(Ian Choi)4")
ian4!.card = CreditCard4(number: 4444_4444_4444_4444, customer: ian4!)

ian4 = nil
// => (Ian Choi)4 is being deinitialized
// => Card #4444444444444444 is being deinitialized



/* ------------------------------------ Unowned Optional References ------------------------------------ */
/*
 You can mark an optional reference to a class as unowned. In terms of the ARC ownership model,
 an unowned optional reference and a weak reference can both be used in the same contexts.
 The difference is that when you use an unowned optional reference, you’re responsible for
 making sure it always refers to a valid object or is set to nil.
 */
class Department {
    var name: String
    var courses: [Course]
    init(name: String) {
        self.name = name
        self.courses = []
    }
}

class Course {
    var name: String
    unowned var department: Department
    unowned var nextCourse: Course?
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextCourse = nil
    }
}
let department = Department(name: "Horticulture")

let intro = Course(name: "Survey of Plants", in: department)
let intermediate = Course(name: "Growing Common Herbs", in: department)
let advanced = Course(name: "Caring for Tropical Plants", in: department)

intro.nextCourse = intermediate
intermediate.nextCourse = advanced
department.courses = [intro, intermediate, advanced]



/* ------------------------------------ Unowned References and Implicitly Unwrapped Optional Properties ------------------------------------ */
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")
// Prints "Canada's capital city is called Ottawa"


/* ------------------------------------ Strong Reference Cycles for Closures ------------------------------------ */
class HTMLElement {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }

}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())
// Prints "<h1>some default text</h1>"

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
// Prints "<p>hello, world</p>"

paragraph = nil



/* ------------------------------------ Weak and Unowned References ------------------------------------ */
/*
 Define a capture in a closure as an unowned reference when the closure and the instance it
 captures will always refer to each other, and will always be deallocated at the same time.

 Conversely, define a capture as a weak reference when the captured reference may become nil at some point in the future.
 Weak references are always of an optional type, and automatically become nil when the instance they reference is deallocated.
 This enables you to check for their existence within the closure’s body.
 
 NOTE:
    If the captured reference will never become nil,
    it should always be captured as an unowned reference,
    rather than a weak reference.
 */
class HTMLElement2 {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }

}
var paragraph2: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph2!.asHTML())
// Prints "<p>hello, world</p>"

paragraph = nil
// Prints "p is being deinitialized"
