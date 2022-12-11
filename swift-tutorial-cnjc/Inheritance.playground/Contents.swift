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
    
    init(firstName: String, _lastName: String, _height: Double, _weight: Double ) {
        self.firstName = firstName
        self.lastName = _lastName
        self.height = _height
        self.weight = _weight
    }
    
    func getFullName() -> String {
        return firstName + self.lastName
    }
}
let firstName = "Hello, "
let lastName = "World!"
let height = 180.00
let weight = 88.00

let info = Info(firstName: firstName, _lastName: lastName, _height: height, _weight: weight)

print(info.firstName) // => Hello,
print(info.lastName)  // => World!
print(info.height)    // => 180.0
print(info.weight)    // => 88.0



/* ------------------------------------ Subclassing ------------------------------------ */
/*
 Subclassing is the act of basing a new class on an existing class.
 The subclass inherits characteristics from the existing class,
 which you can then refine. You can also add new characteristics to the subclass.
 */
class SubInfo: Info {
    init() {
        super.init(firstName: "Hello, ", _lastName: "Swift!", _height: 188.0, _weight: 90.0)
    }
}
let subInfo = SubInfo()
print("full name => \(subInfo.getFullName())") // => Hello, Swift!



/* ------------------------------------ Overriding ------------------------------------ */
/*
 A subclass can provide its own custom implementation of an instance method, type method,
 instance property, type property, or subscript that it would otherwise inherit from a superclass.
 This is known as overriding.

 To override a characteristic that would otherwise be inherited, you prefix your overriding definition
 with the override keyword. Doing so clarifies that you intend to provide an override and haven’t
 provided a matching definition by mistake. Overriding by accident can cause unexpected behavior,
 and any overrides without the override keyword are diagnosed as an error when your code is compiled.

 The override keyword also prompts the Swift compiler to check that your overriding class’s superclass
 (or one of its parents) has a declaration that matches the one you provided for the override.
 This check ensures that your overriding definition is correct.
 */
/*
 Method:
    => someMethod() -> super.someMethod()
 Property:
    => someProperty -> super.someProperty
 Subscript:
    => someIndex    -> super[someIndex]
 */
/* Overriding Method */
class SuperClass {
    func show() {
        print("It's SuperClass")
    }
}

class SubClass: SuperClass  {
    override func show() {
        print("It's SubClass")
    }
}

let superClass = SuperClass()
superClass.show() // => It's SuperClass

let subClass = SubClass()
subClass.show() // => It's SubClass


/* Overriding Property */
/*
 If you provide a setter as part of a property override, you must also provide a getter for that override.
 If you don’t want to modify the inherited property’s value within the overriding getter,
 you can simply pass through the inherited value by returning super.someProperty from the getter,
 where someProperty is the name of the property you are overriding.
 */
class SuperNameA {
    var name = "World!"
    var getName: String {
        return "name is \(name)"
    }
}

// inherited from Circle
class SubNameA: SuperNameA {
    var newName = "Swift!"
    override var getName: String {
        return "\(super.getName), but now name is \(newName)"
    }
}

let subNameA = SubNameA()
subNameA.name = "Hello!"
subNameA.newName = "Hi"
print(subNameA.getName) // => name is Hello!, but now name is Hi



/* ------------------------------------ Overriding Property Observers ------------------------------------ */
/*
 You can use property overriding to add property observers to an inherited property.
 This enables you to be notified when the value of an inherited property changes,
 regardless of how that property was originally implemented.
 
 NOTE:
     You can’t add property observers to inherited constant stored properties or inherited
     read-only computed properties. The value of these properties can’t be set, and so it isn’t
     appropriate to provide a willSet or didSet implementation as part of an override.

     Note also that you can’t provide both an overriding setter and an overriding property observer for the
     same property. If you want to observe changes to a property’s value, and you are already providing a
     custom setter for that property, you can simply observe any value changes from within the custom setter.
 */
class SuperNameB {
    var name = "Hello"
    var getName: String {
        return "name is \(name) "
    }
}

class SubNameB1: SuperNameB {
    var newName = "Hi"
    override var getName: String {
        return super.getName + ", but now name is \(newName)"
    }
}


let subNameB1 = SubNameB1()
subNameB1.name = "Swift"
subNameB1.newName = "World"
print(subNameB1.getName) // => name is Swift , but now name is World

class SubNameB2: SubNameB1 {
    override var name: String {
        didSet {
            newName = "Hey"
        }
    }
}


let subNameB2 = SubNameB2()
subNameB2.name = "Yo"
print(subNameB2.getName) // => name is Yo , but now name is Hey



/* ------------------------------------ Preventing Overrides ------------------------------------ */
/*
 You can prevent a method, property, or subscript from being overridden by marking it as final.
 Do this by writing the final modifier before the method, property, or subscript’s introducer
 keyword (such as final var, final func, final class func, and final subscript).

 Any attempt to override a final method, property, or subscript in a subclass is reported as a
 compile-time error. Methods, properties, or subscripts that you add to a class in an extension
 can also be marked as final within the extension’s definition.

 You can mark an entire class as final by writing the final modifier before the class keyword in its class
 definition (final class). Any attempt to subclass a final class is reported as a compile-time error.
 */
final class SuperNameC {
    final var name = "Hello"
    var getName: String {
        return "name is \(name)"
    }
}
class SubNameC1: SuperNameC { // => Inheritance from a final class 'SuperNameC'
    var newName = "Hi"
    override var getName: String { // => Property overrides a 'final' property
        return super.getName + ", but now name is \(newName)"
    }
}

let subNameC1 = SubNameC1()
subNameC1.name = "World"
subNameC1.newName = "Swift"
print(subNameC1.getName) // => Ambiguous use of 'getName'

class SubNameC2: SubNameC1 {
    override var name: String { // => Property overrides a 'final' property
        didSet {
            newName = "Hey"
        }
    }
}

let subNameC2 = SubNameC2()
subNameC2.name = "Yo" // => Ambiguous use of 'name'
print(subNameC2.getName) // => Ambiguous use of 'getName'
