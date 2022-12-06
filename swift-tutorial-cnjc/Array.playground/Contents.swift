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



