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


