import Cocoa

/* ------------------------------------ Class Declaration ------------------------------------ */
/*
   class className {
     Definition 1
     Definition 2
     ...
     Definition N
   }
 */
class nameClass1 {
    var firstName = "Hello, ";
    var lastName = "Swift!";
}
let fullName1 = nameClass1();
print(fullName1.firstName + fullName1.lastName);

// OR
class nameClass2 {
    var firstName: String;
    var lastName: String;
    
    init(_firstName: String, _lastName: String) {
        self.firstName = _firstName;
        self.lastName = _lastName;
    }
}
let fullName2 = nameClass2(_firstName: "Hello, ", _lastName: "World!");
print(fullName2.firstName + fullName2.lastName);

// OR
class nameClass3 {
    var firstName: String;
    var lastName: String;
    init(_firstName: String, _lastName: String) {
        self.firstName = _firstName;
        self.lastName = _lastName;
    }
}
let fullName3 = nameClass3(_firstName: "Hello, ", _lastName: "Swift!");
print(fullName3.firstName + fullName3.lastName);



/* ------------------------------------ Identity Operator ------------------------------------ */
/*
   "===" => both Type and Value are equal, returns Bool
   "!==" => Type or Value not equal, returns Bool
 */
class nameClass4: Equatable {
    let name: String;
    init(_name: String) {
        name = _name;
    }
}
func == (lhs: nameClass4, rhs: nameClass4) -> Bool {
    return lhs.name == rhs.name;
}

let fullName4 = nameClass4(_name: "Hello");
let fullName5 = nameClass4(_name: "Hello");
let fullName6 = nameClass4(_name: "World");

print(fullName4 === fullName5); // => false Type & Value
print(fullName4 === fullName6); // => false Type

print(fullName4 !== fullName5); // => true
print(fullName4 !== fullName6); // => true
