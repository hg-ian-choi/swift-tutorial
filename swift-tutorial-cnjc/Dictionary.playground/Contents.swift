import Cocoa

/* ------------------------------------ Dictionary ------------------------------------ */
/*
   var someDict =  [KeyType: ValueType]()
 */
var someDictA = [Int: String]();
var someDictB:[Int:String] = [1:"One", 2:"Two", 3:"Three"];
print(someDictA);
print(someDictB);



/* ------------------------------------ Read Dictionary ------------------------------------ */
/*
   var someVar = someDict[key]
 */
var someDictC:[Int:String] = [1:"One", 2:"Two", 3:"Three"];
var someVarC = someDictC[1];

print("key = 1 => \(someVarC)"); // WARNING => String interpolation produces a debug description for an optional value; did you mean to make this explicit?
print("key = 2 => \(someDictC[2])");
print("key = 3 => \(someDictC[3])");



/* ------------------------------------ Update Dictionary ------------------------------------ */
/*
   Dictionary.updateValue(Value, forKey: Key)
     => if Key exist, Update Value
     => if Key not exist, Insert Value
 */
var someDictD:[Int:String] = [1:"One", 2:"Two", 3:"Three"];
var oldValueD = someDictD.updateValue("One v2", forKey: 1);
var someVarD = someDictD[1];

print("key = 1 => \(oldValueD)");
print("key = 1 => \(someVarD)");
print("key = 2 => \(someDictD[2])");
print("key = 3 => \(someDictD[3])");

// OR
/*
   Dictionary[Key] = Value;
 */
var someDictE:[Int:String] = [1:"One", 2:"Two", 3:"Three"];

var oldValueE = someDictE[1];
someDictE[1] = "One v2";
var someVarE = someDictE[1];

print("key = 1 => \(oldValueE)");
print("key = 1 => \(someVarE)");
print("key = 2 => \(someDictE[2])");
print("key = 3 => \(someDictE[3])");



/* ------------------------------------ Delete Dictionary ------------------------------------ */
/*
   Dictionary.removeValueForKey(Key);
     => if Key exist, Delete Key and Value
     => if Key not exist, return nil
 */
var someDictF:[Int:String] = [1:"One", 2:"Two", 3:"Three"];
var removedValueF = someDictF.removeValue(forKey: 2);

print("key = 1 => \(someDictF[1])");
print("key = 2 => \(someDictF[2])"); // => nil
print("key = 3 => \(someDictF[3])");

// OR
/*
   Dictionary[Key] = nil;
 */
var someDictG:[Int:String] = [1:"One", 2:"Two", 3:"Three"];
someDictG[2] = nil;

print("key = 1 => \(someDictG[1])");
print("key = 2 => \(someDictG[2])"); // => nil
print("key = 3 => \(someDictG[3])");



/* ------------------------------------ Traversal Dictionary ------------------------------------ */
/*
   for-in
 */
var someDictH:[Int:String] = [1:"One", 2:"Two", 3:"Three"];
for (key, value) in someDictH {
    print("someDictH[\(key)] = \(value)");
}

// OR
/*
   Dictionary.enumerate()
 */
var someDictI:[Int:String] = [1:"One", 2:"Two", 3:"Three"];

for (key, value) in someDictI.enumerated() {
    print("someDictI[\(key)]= \(value)");
}



/* ------------------------------------ Dictionary => Array ------------------------------------ */
var someDictJ:[Int:String] = [1:"One", 2:"Two", 3:"Three"];

let dictKeysJ = [Int](someDictJ.keys);
let dictValuesJ = [String](someDictJ.values);

for (key) in dictKeysJ {
    print("dictKeysJ = \(key)");
}

for (value) in dictValuesJ {
    print("dictValuesJ = \(value)");
}



/* ------------------------------------ Dictionary count ------------------------------------ */
/*
   Dictionary.count => returns Int
 */
var someDictK:[Int:String] = [1:"One", 2:"Two", 3:"Three"];
var someDictL:[Int:String] = [4:"Four", 5:"Five"];

print("someDictK has \(someDictK.count) Key-Value pairs");
print("someDictL has \(someDictL.count) Key-Value pairs");



/* ------------------------------------ Dictionary isEmpty ------------------------------------ */
/*
   Dictionary.isEmpty => returns Bool
 */
var someDictM:[Int:String] = [1:"One", 2:"Two", 3:"Three"];
var someDictN:[Int:String] = [4:"Four", 5:"Five"];
var someDictO:[Int:String] = [Int:String]();

print("someDictM is empty? => \(someDictM.isEmpty)");
print("someDictN is empty? => \(someDictN.isEmpty)");
print("someDictO is empty? => \(someDictO.isEmpty)");

