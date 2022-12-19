import Cocoa

/*------------------------------------ Protocols ------------------------------------ */
/*
 A protocol defines a blueprint of methods, properties, and other requirements that
 suit a particular task or piece of functionality.
 The protocol can then be adopted by a class, structure, or enumeration to provide
 an actual implementation of those requirements.
 Any type that satisfies the requirements of a protocol is said to conform to that protocol.

 In addition to specifying requirements that conforming types must implement,
 you can extend a protocol to implement some of these requirements or to implement
 additional functionality that conforming types can take advantage of.
 */



/*------------------------------------ Protocol Syntax ------------------------------------ */
/*
 You define protocols in a very similar way to classes, structures, and enumerations:
 
     protocol SomeProtocol {
         // protocol definition goes here
     }
 */
/*
 Custom types state that they adopt a particular protocol by placing the protocol’s name after the type’s name,
 separated by a colon, as part of their definition. Multiple protocols can be listed, and are separated by commas:
 
     struct SomeStructure: FirstProtocol, AnotherProtocol {
         // structure definition goes here
     }
 */
/*
 If a class has a superclass, list the superclass name before any protocols it adopts, followed by a comma:
 
     class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
         // class definition goes here
     }
 */



/*------------------------------------ Property Requirements ------------------------------------ */
/*
 A protocol can require any conforming type to provide an instance property or type property with
 a particular name and type. The protocol doesn’t specify whether the property should be a stored
 property or a computed property—it only specifies the required property name and type.
 The protocol also specifies whether each property must be gettable or gettable and settable.

 If a protocol requires a property to be gettable and settable, that property requirement
 can’t be fulfilled by a constant stored property or a read-only computed property.
 If the protocol only requires a property to be gettable, the requirement can be satisfied by any kind of property,
 and it’s valid for the property to be also settable if this is useful for your own code.

 Property requirements are always declared as variable properties, prefixed with the var keyword.
 Gettable and settable properties are indicated by writing { get set } after their type declaration,
 and gettable properties are indicated by writing { get }.
 
    protocol SomeProtocol {
        var mustBeSettable: Int { get set }
        var doesNotNeedToBeSettable: Int { get }
    }

    protocol AnotherProtocol {
        static var someTypeProperty: Int { get set }
    }
 */
protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}
let ian = Person(fullName: "Ian Choi")
print("ian.fullName is \(ian.fullName)") // => ian.fullName is Ian Choi


class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print("ncc1701.fullName is \(ncc1701.fullName)") // => ncc1701.fullName is USS Enterprise



/*------------------------------------ Method Requirements ------------------------------------ */
/*
 Protocols can require specific instance methods and type methods to be implemented by conforming types.
 These methods are written as part of the protocol’s definition in exactly the same way as for normal instance
 and type methods, but without curly braces or a method body. Variadic parameters are allowed, subject to the same rules
 as for normal methods. Default values, however, can’t be specified for method parameters within a protocol’s definition.
 
     protocol SomeProtocol {
         static func someTypeMethod()
     }
 */
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c)
            .truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())") // => Here's a random number: 0.3746499199817101
print("And another one: \(generator.random())") // => And another one: 0.729023776863283



/*------------------------------------ Mutating Method Requirements ------------------------------------ */
/*
 It’s sometimes necessary for a method to modify (or mutate) the instance it belongs to.
 For instance methods on value types (that is, structures and enumerations) you place
 the mutating keyword before a method’s func keyword to indicate that the method is
 allowed to modify the instance it belongs to and any properties of that instance.
 This process is described in Modifying Value Types from Within Instance Methods.

 If you define a protocol instance method requirement that’s intended to mutate instances of any type
 that adopts the protocol, mark the method with the mutating keyword as part of the protocol’s definition.
 This enables structures and enumerations to adopt the protocol and satisfy that method requirement.
 
 NOTE:
    If you mark a protocol instance method requirement as mutating,
    you don’t need to write the mutating keyword when writing an implementation of that method for a class.
    The mutating keyword is only used by structures and enumerations.
 */
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
print("lightSwitch is now equal to .\(lightSwitch)") // => lightSwitch is now equal to .on



/*------------------------------------ Initializer Requirements ------------------------------------ */
/*
 Protocols can require specific initializers to be implemented by conforming types.
 You write these initializers as part of the protocol’s definition in exactly the same way as for normal initializers,
 but without curly braces or an initializer body:
 */
protocol SomeProtocol {
    init(someParameter: Int)
}

/* Class Implementations of Protocol Initializer Requirements */
/*
 You can implement a protocol initializer requirement on a conforming class as either
 a designated initializer or a convenience initializer.
 In both cases, you must mark the initializer implementation with the required modifier:
 */
class SomeClass: SomeProtocol {
    required init(someParameter: Int) {
        // initializer implementation goes here
    }
}

/*
 The use of the required modifier ensures that you provide an explicit or inherited implementation of the
 initializer requirement on all subclasses of the conforming class, such that they also conform to the protocol.
 
 NOTE:
     You don’t need to mark protocol initializer implementations with the required modifier on classes
     that are marked with the final modifier, because final classes can’t subclassed.
     For more about the final modifier, see Preventing Overrides.
 */


/*
 If a subclass overrides a designated initializer from a superclass,
 and also implements a matching initializer requirement from a protocol,
 mark the initializer implementation with both the required and override modifiers:
 */
protocol SomeProtocolA {
    init()
}

class SomeSuperClassA {
    init() {
        // initializer implementation goes here
    }
}

class SomeSubClassA: SomeSuperClassA, SomeProtocolA {
    // "required" from SomeProtocol conformance; "override" from SomeSuperClass
    required override init() {
        // initializer implementation goes here
    }
}


/* Failable Initializer Requirements */
/*
 Protocols can define failable initializer requirements for conforming types, as defined in Failable Initializers.

 A failable initializer requirement can be satisfied by a failable or nonfailable initializer on a conforming type.
 A nonfailable initializer requirement can be satisfied by a nonfailable initializer or an implicitly unwrapped failable initializer.
 */
