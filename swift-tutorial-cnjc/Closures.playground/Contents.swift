import Cocoa

/* ------------------------------------ Closures Declaration  ------------------------------------ */
/*
   {(parameters) -> return type in
     statements
   }
 */
let closureA = { print("Hello, World!"); };
closureA();

/*
   {(Int, Int) -> Bool in
     Statement 1
     Statement 2
     ...
     Statement n
   }
 */
let closureB = {(param1: Int, param2: Int) -> Int in
    return param1 + param2;
}
print(closureB(1, 2));



/* ------------------------------------ sort  ------------------------------------ */
/*
   sorted(by:)
 */
let intArrayA = [1, 3, 5, 7, 9];
func sortDesc(i1: Int, i2: Int) -> Bool {
    return i1 > i2;
}
var reversed = intArrayA.sorted(by: sortDesc);
print(reversed);

var reversed2 = intArrayA.sorted(by: {$0 > $1});
print(reversed2);

var reverse3 = intArrayA.sorted(by: >);
print(reverse3);

var reverse4 = intArrayA.sorted() {$0 > $1};
print(reverse4);

var reverse5 = intArrayA.sorted {$0 > $1};
print(reverse5);



func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0;
    func incrementor() -> Int {
        runningTotal += amount;
        return runningTotal;
    }
    return incrementor;
}
let incrementByTen = makeIncrementor(forIncrement: 10);

print(incrementByTen()); // => 10
print(incrementByTen()); // => 20
print(incrementByTen()); // => 30
let alsoIncrementByTen = incrementByTen;
print(alsoIncrementByTen()); // => 40
print(alsoIncrementByTen()); // => 50
