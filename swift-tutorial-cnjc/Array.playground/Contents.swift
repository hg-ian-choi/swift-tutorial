import Cocoa

/* ------------------------------------ Array ------------------------------------ */
/*
   1. dynamic empty array:
     => var someArray = [SomeType]();
   2. static array:
     => var someArray = [SomeType](repeating: InitialValue, count: NumbeOfElements)
 */
var someIntsA = [Int](repeating: 0, count: 3);
var someIntsB:[Int] = [10, 20, 30];
print(someIntsA);
print(someIntsB);

var someStrsA: [String] = [];
var someFloatsA: [Float] = [];
var someDoublesA: [Double] = [];
var someDictionaryA: [String: Int] = [:];



/* ------------------------------------ Read Array ------------------------------------ */
/*
 someArray[index]
 */
var someIntsC = [Int](repeating: 10, count: 3);

var someIntA = someIntsC[0];
var someIntB = someIntsC[1];
var someIntC = someIntsC[2];
print("someIntsC[0] = \(someIntA)");
print("someIntsC[1] = \(someIntsC[1])");
print("someIntsC[2] = \(someIntsC[2])");



/* ------------------------------------ Update Array ------------------------------------ */
/*
   1. someArray.append(someVar)
   2. someArray += someVar
   3. someArray[index] = someVar
 */
var someIntsD = [Int]();
someIntsD.append(20);
someIntsD.append(30);
someIntsD += [40];

print("someIntsD[0] = \(someIntsD[0])");
print("someIntsD[1] = \(someIntsD[1])");
print("someIntsD[2] = \(someIntsD[2])");

someIntsD[2] = 50;
print("someIntsD[2] = \(someIntsD[2])");



/* ------------------------------------ Traversal Array ------------------------------------ */
var someStrsB = [String]()

someStrsB.append("Apple");
someStrsB.append("Amazon");
someStrsB.append("Microsoft");
someStrsB += ["Google"];

for item in someStrsB {
    print(item);
}

for (index, item) in someStrsB.enumerated() {
    print("someStrsA[\(index)] = \(item)");
}



/* ------------------------------------ Concat Array ------------------------------------ */
var someIntsE = [Int](repeating: 2, count:2);
var someIntsF = [Int](repeating: 1, count:3);
var someIntsG = someIntsE + someIntsF;

for item in someIntsG {
    print(item);
}



/* ------------------------------------ Array count ------------------------------------ */
/*
 returns Int
 */
var someIntsH = [Int](repeating: 2, count:2);
var someIntsI = [Int](repeating: 1, count:3);
var someIntsJ = someIntsH + someIntsI;

print("someIntsH has \(someIntsH.count) items");
print("someIntsI has \(someIntsI.count) items");
print("someIntsJ has \(someIntsJ.count) items");



/* ------------------------------------ Array isEmpty ------------------------------------ */
/*
 returns Bool
 */
var someIntsK = [Int](repeating: 2, count:2);
var someIntsL = [Int](repeating: 1, count:3);
var someIntsM = [Int]();

print("someIntsK.isEmpty = \(someIntsK.isEmpty)");
print("someIntsL.isEmpty = \(someIntsL.isEmpty)");
print("someIntsM.isEmpty = \(someIntsM.isEmpty)");
