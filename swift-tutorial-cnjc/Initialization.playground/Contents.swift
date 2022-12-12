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



/* ------------------------------------ Parameter Names and Argument Labels ------------------------------------ */
/*
 As with function and method parameters, initialization parameters can have both a parameter name
 for use within the initializer’s body and an argument label for use when calling the initializer.

 However, initializers don’t have an identifying function name before their parentheses in the way
 that functions and methods do. Therefore, the names and types of an initializer’s parameters play a
 particularly important role in identifying which initializer should be called. Because of this,
 Swift provides an automatic argument label for every parameter in an initializer if you don’t provide one.
 */
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}

// create a new Color instance (with 3 parameters)
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)

// create a new Color instance (with 1 parameter)
let halfGray = Color(white: 0.5)

//let veryGreen = Color(0.0, 1.0, 0.0) => ERROR: Missing argument labels 'red:green:blue:' in call



/* ------------------------------------ Initializer Parameters Without Argument Labels ------------------------------------ */
/*
 If you don’t want to use an argument label for an initializer parameter, write an underscore (_)
 instead of an explicit argument label for that parameter to override the default behavior.
 */
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = Celsius(37.0)
print(bodyTemperature.temperatureInCelsius); // => 37.0



/* ------------------------------------ Optional Property Types ------------------------------------ */
/*
 If your custom type has a stored property that’s logically allowed to have “no value”—perhaps because its value
 can’t be set during initialization, or because it’s allowed to have “no value” at some later point—declare the
 property with an optional type. Properties of optional type are automatically initialized with a value of nil,
 indicating that the property is deliberately intended to have “no value yet” during initialization.
 */
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask() // => Do you like cheese?
cheeseQuestion.response = "Yes, I do like cheese."



/* ------------------------------------ Assigning Constant Properties During Initialization ------------------------------------ */
/*
 You can assign a value to a constant property at any point during initialization,
 as long as it’s set to a definite value by the time initialization finishes.
 Once a constant property is assigned a value, it can’t be further modified.
 
 NOTE:
    For class instances, a constant property can be modified during initialization only by the class that introduces it.
    It can’t be modified by a subclass.
 */
class SurveyQuestion2 {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestion2(text: "How about beets?")
beetsQuestion.ask() // => How about beets?
beetsQuestion.response = "I also like beets. (But not with cheese.)"



/* ------------------------------------ Default Initializers ------------------------------------ */
/*
 Swift provides a default initializer for any structure or class that provides default
 values for all of its properties and doesn’t provide at least one initializer itself.
 The default initializer simply creates a new instance with all of its properties set to
 their default values.
 */
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()



/* ------------------------------------ Memberwise Initializers for Structure Types ------------------------------------ */
/*
 Structure types automatically receive a memberwise initializer if they don’t define any of
 their own custom initializers. Unlike a default initializer, the structure receives a
 memberwise initializer even if it has stored properties that don’t have default values.

 The memberwise initializer is a shorthand way to initialize the member properties of new structure instances.
 Initial values for the properties of the new instance can be passed to the memberwise initializer by name.
 */
struct Size {
    var width = 0.0, height = 0.0 // => Auto Inject Double Type to "width" and "height"
}
let twoByTwo = Size(width: 2.0, height: 2.0)

let zeroByTwo = Size(height: 2.0)
print(zeroByTwo.width, zeroByTwo.height) // => 0.0, 2.0

let zeroByZero = Size()
print(zeroByZero.width, zeroByZero.height) // => 0.0, 0.0


