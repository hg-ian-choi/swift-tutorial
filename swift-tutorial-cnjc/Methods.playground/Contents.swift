import Cocoa

/* ------------------------------------ Method declaration ------------------------------------ */
/*
 Methods are functions that are associated with a particular type. Classes, structures,
 and enumerations can all define instance methods, which encapsulate specific tasks and
 functionality for working with an instance of a given type. Classes, structures,
 and enumerations can also define type methods, which are associated with the type itself.
 Type methods are similar to class methods in Objective-C.
 
 The fact that structures and enumerations can define methods in Swift is a major difference
 from C and Objective-C. In Objective-C, classes are the only types that can define methods.
 In Swift, you can choose whether to define a class, structure, or enumeration,
 and still have the flexibility to define methods on the type you create.
 */
/*
     func funcname(Parameters) -> returnType {
         Statement 1
         Statement 2
         ...
         Statement N
         return value:returnType
     }
 */
class Counter {
    var count = 0;
    func increase() {
        count += 1;
    }
    func decrease() {
        count -= 1;
    }
    func increaseBy(amount: Int) {
        count += amount;
    }
    func decreaseBy(amount: Int) {
        count -= amount;
    }
    func reset() {
        count = 0;
    }
}
let counter = Counter();
counter.increase();
print(counter.count); // => 1
counter.increaseBy(amount: 5);
print(counter.count); // => 6
counter.decrease();
print(counter.count); // => 5
counter.decreaseBy(amount: 2);
print(counter.count); // => 3
counter.reset();
print(counter.count); // => 0
