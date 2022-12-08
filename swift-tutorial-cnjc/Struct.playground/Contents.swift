import Cocoa

/* ------------------------------------ Struct Declaration  ------------------------------------ */
/*
   struct structName {
      Definition 1
      Definition 2
      ...
      Definition N
   }
 */
struct nameStruct {
    var firstName: String;
    var midName: String;
    var lastName: String;
}



struct nameStruct2 {
    var firstName = "Hello,";
    var midName = " ";
    var lastName = "World!";
}
let fullName2 = nameStruct2();
print("firstName is \(fullName2.firstName)");
print("lastName is \(fullName2.lastName)");



struct nameStruct3 {
    var name: String;
    init(_name: String) {
        self.name = _name;
    }
}
var nameA = nameStruct3(_name: "Hello, World!");
var nameB = nameA;
nameB.name = "Hello, Swift!";
print(nameA.name);
print(nameB.name);



/* ------------------------------------ Struct Usage  ------------------------------------ */
struct nameStruct4 {
    var firstName: String;
    var midName: String;
    var lastName: String;
    
    init(_firstName: String, _midName: String, _lastName: String){
        self.firstName = _firstName;
        self.midName = _midName;
        self.lastName = _lastName;
    }
}

var fullName4 = nameStruct4(_firstName: "Hello", _midName: ", ", _lastName: "World!");
print(fullName4.firstName);
print(fullName4.midName);
print(fullName4.lastName);
