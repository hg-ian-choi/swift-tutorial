import Cocoa

/* ------------------------------------ Initialization ------------------------------------ */
/*
 Initialization is the process of preparing an instance of a class, structure, or enumeration for use.
 This process involves setting an initial value for each stored property on that instance and
 performing any other setup or initialization that’s required before the new instance is ready for use.

 You implement this initialization process by defining initializers, which are like special methods
 that can be called to create a new instance of a particular type. Unlike Objective-C initializers,
 Swift initializers don’t return a value. Their primary role is to ensure that new instances of a type
 are correctly initialized before they’re used for the first time.

 Instances of class types can also implement a deinitializer,
 which performs any custom cleanup just before an instance of that class is deallocated.
 */



/* ------------------------------------ Setting Initial Values for Stored Properties ------------------------------------ */
/*
 Classes and structures must set all of their stored properties to an appropriate initial value by the time an
 instance of that class or structure is created. Stored properties can’t be left in an indeterminate state.

 You can set an initial value for a stored property within an initializer, or by assigning a default property
 value as part of the property’s definition. These actions are described in the following sections.
 
 NOTE:
    When you assign a default value to a stored property, or set its initial value within an initializer,
    the value of that property is set directly, without calling any property observers.
 */
/* Initializers */
/*
 Initializers are called to create a new instance of a particular type.
 In its simplest form, an initializer is like an instance method with no parameters,
 written using the init keyword:
     init() {
         // perform some initialization here
     }
 */
struct fullNameA {
    var firstName: String
    var lastName: String
    init() {
        firstName = "Hello, "
        lastName = "World!"
    }
}
var nameA = fullNameA()
print("full name = \(nameA.firstName + nameA.lastName)") // => full name = Hello, World!



/* ------------------------------------ Default Property Values ------------------------------------ */
/*
 You can set the initial value of a stored property from within an initializer, as shown above.
 Alternatively, specify a default property value as part of the property’s declaration.
 You specify a default property value by assigning an initial value to the property when it’s defined.

 NOTE:
     If a property always takes the same initial value, provide a default value rather than setting a value within an initializer.
     The end result is the same, but the default value ties the property’s initialization more closely to its declaration.
     It makes for shorter, clearer initializers and enables you to infer the type of the property from its default value.
     The default value also makes it easier for you to take advantage of default initializers and initializer inheritance,
     as described later in this chapter.
 */
/*
 You can write the Fahrenheit structure from above in a simpler form by providing a default
 value for its temperature property at the point that the property is declared:
     struct Fahrenheit {
         var temperature = 32.0
     }
 */
struct fullNameB {
    var firstName = "Hello, "
    var lastName = "World!"
}
var nameB = fullNameB()
print("full name = \(nameB.firstName + nameB.lastName)") // => full name = Hello, World!



/* ------------------------------------ Customizing Initialization ------------------------------------ */
/*
 You can customize the initialization process with input parameters and optional property types,
 or by assigning constant properties during initialization, as described in the following sections.
 */
/* Initialization Parameters */
/*
 You can provide initialization parameters as part of an initializer’s definition,
 to define the types and names of values that customize the initialization process.
 Initialization parameters have the same capabilities and syntax as function and method parameters.
 */
struct Rectangle {
    var length: Double
    var breadth: Double
    var area: Double
    
    init(fromLength length: Double, fromBreadth breadth: Double) {
        self.length = length
        self.breadth = breadth
        area = length * breadth
    }
    
    init(fromLeng leng: Double, fromBread bread: Double) {
        self.length = leng
        self.breadth = bread
        area = leng * bread
    }
}

let ar = Rectangle(fromLength: 6, fromBreadth: 12)
print("area is: \(ar.area)")

let are = Rectangle(fromLeng: 36, fromBread: 12)
print("area is: \(are.area)")
