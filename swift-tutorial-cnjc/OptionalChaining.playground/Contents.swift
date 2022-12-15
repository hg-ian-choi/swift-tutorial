import Cocoa

/* ------------------------------------ Optional Chaining ------------------------------------ */
/*
 Optional chaining is a process for querying and calling properties, methods, and subscripts on an
 optional that might currently be nil. If the optional contains a value, the property, method, or subscript
 call succeeds; if the optional is nil, the property, method, or subscript call returns nil. Multiple
 queries can be chained together, and the entire chain fails gracefully if any link in the chain is nil.
 
 NOTE:
     Optional chaining in Swift is similar to messaging nil in Objective-C, but in
     a way that works for any type, and that can be checked for success or failure.
 */


/* ------------------------------------ Optional Chaining as an Alternative to Forced Unwrapping ------------------------------------ */
/*
 You specify optional chaining by placing a question mark (?) after the optional value on which you wish to call
 a property, method or subscript if the optional is non-nil. This is very similar to placing an exclamation point (!)
 after an optional value to force the unwrapping of its value. The main difference is that optional chaining fails
 gracefully when the optional  is nil, whereas forced unwrapping triggers a runtime error when the optional is nil.
 
 To reflect the fact that optional chaining can be called on a nil value, the result of an optional chaining call is
 always an optional value, even if the property, method, or subscript you are querying returns a non-optional value.
 You can use this optional return value to check whether the optional chaining call was successful (the returned optional
 contains a value), or didn’t succeed due to a nil value in the chain (the returned optional value is nil).

 Specifically, the result of an optional chaining call is of the same type as the expected return value, but wrapped in
 an optional. A property that normally returns an Int will return an Int? when accessed through optional chaining.

 The next several code snippets demonstrate how optional chaining differs from forced unwrapping and enables you to check for success.
 */
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let ian = Person() //let roomCount = john.residence!.numberOfRooms => error: Execution was interrupted, reason: EXC_BREAKPOINT (code=1, subcode=0x193ca7fa0).

if let roomCount = ian.residence?.numberOfRooms {
    print("Ian's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.") // => Unable to retrieve the number of rooms.
}

ian.residence = Residence()

if let roomCount = ian.residence?.numberOfRooms {
    print("Ian's residence has \(roomCount) room(s).") // => John's residence has 1 room(s).
} else {
    print("Unable to retrieve the number of rooms.")
}



/* ------------------------------------ Defining Model Classes for Optional Chaining ------------------------------------ */
/*
 You can use optional chaining with calls to properties, methods, and subscripts that are more than one level deep.
 This enables you to drill down into subproperties within complex models of interrelated types,
 and to check whether it’s possible to access properties, methods, and subscripts on those subproperties.
 */
class Person2 {
    var residence: Residence2?
}

class Residence2 {
    var rooms: [Room2] = []
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room2 {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address2?
}

class Room2 {
    let name: String
    init(name: String) { self.name = name }
}

class Address2 {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}



/* ------------------------------------ Accessing Properties Through Optional Chaining ------------------------------------ */
/*
 As demonstrated in Optional Chaining as an Alternative to Forced Unwrapping,
 you can use optional chaining to access a property on an optional value,
 and to check if that property access is successful.
 */
class Person3 {
    var residence: Residence3?
}

class Residence3 {
    var rooms: [Room3] = []
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room3 {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address3?
}

class Room3 {
    let name: String
    init(name: String) { self.name = name }
}

class Address3 {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

let ian3 = Person3()

if let roomCount = ian3.residence?.numberOfRooms {
    print("Ian3's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.") // => Unable to retrieve the number of rooms.
}

let someAddress = Address3()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
ian3.residence?.address = someAddress

func createAddress3() -> Address3 {
    print("Function was called.")

    let someAddress = Address3()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"

    return someAddress
}
ian3.residence?.address = createAddress3()



/* ------------------------------------ Calling Methods Through Optional Chaining ------------------------------------ */
/*
 You can use optional chaining to call a method on an optional value,
 and to check whether that method call is successful.
 You can do this even if that method doesn’t define a return value.
 */
if ian3.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.") // => It was not possible to print the number of rooms.
}

if (ian3.residence?.address = someAddress) != nil {
    print("It was possible to set the address.") // => It was not possible to set the address.
} else {
    print("It was not possible to set the address.")
}



/* ------------------------------------ Accessing Subscripts Through Optional Chaining ------------------------------------ */
/*
 You can use optional chaining to try to retrieve and set a value from a subscript on an optional value,
 and to check whether that subscript call is successful.
 
 NOTE:
    When you access a subscript on an optional value through optional chaining,
    you place the question mark before the subscript’s brackets, not after.
    The optional chaining question mark always follows immediately after the part of the expression that’s optional.
 */
if let firstRoomName = ian3.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")// => Unable to retrieve the first room name.
}

ian3.residence?[0] = Room3(name: "Bathroom")

let ian3sHouse = Residence3()
ian3sHouse.rooms.append(Room3(name: "Living Room"))
ian3sHouse.rooms.append(Room3(name: "Kitchen"))
ian3.residence = ian3sHouse

if let firstRoomName = ian3.residence?[0].name {
    print("The first room name is \(firstRoomName).") // => The first room name is Living Room.
} else {
    print("Unable to retrieve the first room name.")
}

/*
 Accessing Subscripts of Optional Type:
    If a subscript returns a value of optional type—such as the key
    subscript of Swift’s Dictionary type—place a question mark after
    the subscript’s closing bracket to chain on its optional return value:
 */
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
// the "Dave" array is now [91, 82, 84] and the "Bev" array is now [80, 94, 81]



/* ------------------------------------ Linking Multiple Levels of Chaining ------------------------------------ */
/*
 You can link together multiple levels of optional chaining to drill down to properties,
 methods, and subscripts deeper within a model.
 However, multiple levels of optional chaining don’t add more levels of optionality to the returned value.
 
 To put it another way:
    1. If the type you are trying to retrieve isn’t optional, it will become optional because of the optional chaining.
    2. If the type you are trying to retrieve is already optional, it will not become more optional because of the chaining.
 
 Therefore:
    1. If you try to retrieve an Int value through optional chaining, an Int?
       is always returned, no matter how many levels of chaining are used.
    2. Similarly, if you try to retrieve an Int? value through optional chaining, an Int?
       is always returned, no matter how many levels of chaining are used.
 */
if let ian3sStreet = ian3.residence?.address?.street {
    print("Ian3's street name is \(ian3sStreet).")
} else {
    print("Unable to retrieve the address.") // => Unable to retrieve the address.
}

let ian3sAddress = Address3()
ian3sAddress.buildingName = "The Larches"
ian3sAddress.street = "Laurel Street"
ian3.residence?.address = ian3sAddress

if let ian3sStreet = ian3.residence?.address?.street {
    print("Ian3's street name is \(ian3sStreet).") // => Ian3's street name is Laurel Street.
} else {
    print("Unable to retrieve the address.")
}


/* ------------------------------------ Chaining on Methods with Optional Return Values ------------------------------------ */
/*
 The previous example shows how to retrieve the value of a property of optional type through optional chaining.
 You can also use optional chaining to call a method that returns a value of optional type,
 and to chain on that method’s return value if needed.
 */
if let buildingIdentifier = ian3.residence?.address?.buildingIdentifier() {
    print("Ian3's building identifier is \(buildingIdentifier).") // => Ian3's building identifier is The Larches.
}

if let beginsWithThe = ian3.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("Ian3's building identifier begins with \"The\".") // => Ian3's building identifier begins with "The".
    } else {
        print("Ian3's building identifier doesn't begin with \"The\".")
    }
}
