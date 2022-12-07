import Cocoa

/* ------------------------------------ Function Declaration ------------------------------------ */
/*
   func functionName(parameters) -> returnType
   {
     Statement1
     Statement2
     ...
     Statement N
     return returnType
   }
 */
func funcA(_string: String) -> String {
    return _string;
}



/* ------------------------------------ Function Call ------------------------------------ */
/*
   function()
 */
var stringA = funcA(_string: "Hello, World!");
print(stringA);



/* ------------------------------------ Function with Parameters ------------------------------------ */
func funcB(_stringA: String, _stringB: String) -> String {
    return _stringA + _stringB;
}
print(funcB(_stringA: "Hello,", _stringB: " World!"));



/* ------------------------------------ Function without Parameters ------------------------------------ */
/*
   func functionName() -> returnType {
     return returnType
   }
 */
func funcC() -> String {
    return "Hello, World!";
}
print(funcC());



/* ------------------------------------ Function returns tuple ------------------------------------ */
func funcD(_array: [Int]) -> (min: Int, max: Int) {
    var currentMin = _array[0];
    var currentMax = _array[0];
    for value in _array[1..<_array.count] {
        if value < currentMin {
            currentMin = value;
        } else if value > currentMax {
            currentMax = value;
        }
    }
    return (currentMin, currentMax);
}

let resultD = funcD(_array: [8, -6, 2, 109, 3, 71]);
print("min = \(resultD.min)， max = \(resultD.max)");


// You can return Optional type if your return data include nil
func funcE(_array: [Int]) -> (min: Int, max: Int?) {
    var currentMin = _array[0];
    var currentMax = _array[0];
    for value in _array[1..<_array.count] {
        if value < currentMin {
            currentMin = value;
        } else if value > currentMax {
            currentMax = value;
        }
    }
    return (currentMin, currentMax);
}

let resultE = funcE(_array: [8, -6, 2, 109, 3, 71]);
print("min = \(resultE.min)， max = \(resultE.max)");



/* ------------------------------------ void Function ------------------------------------ */
func funcF(_string: String) {
    print(_string);
}
funcF(_string: "Hello, World!");



/* ------------------------------------ Function's internal parameters ------------------------------------ */
func funcG(_number: Int) {
    // _number is funcG's internal argument
    print(_number);
}
funcG(_number: 1);
funcG(_number: 2);
funcG(_number: 3);



/* ------------------------------------ Function's external parameters ------------------------------------ */
func funcH(_paramA _a: Int, _paramB _b: Int) -> Int {
    // _paramA and _paramB are funcH's external arguments
    var result = _a;
    for _ in 1..<_b {
        result = result * _a
    }
    print(result);
    return result;
}
funcH(_paramA: 5, _paramB: 3);



/* ------------------------------------ Variadic Function ------------------------------------ */
/*
   add "..." after function's parameter
     => func functionName<T>(_param: T...) {...}
 */
func funcI<T>(_params: T...) {
    for _param in _params {
        print(_param);
    }
}
funcI(_params: 4,3,5);
funcI(_params: 4.5, 3.1, 5.6);
funcI(_params: "Google", "Microsoft", "Amazon");



/* ------------------------------------ Constants, Variables, I/O and Parameters ------------------------------------ */
/*
   add "inout" before parameter
     => func functionName(_ param: inout String) {...}
   add "&" before argument
     => funcName(&argument)
 */
func funcJ(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a;
    a = b;
    b = temporaryA;
}


var x = 1;
var y = 5;
funcJ(&x, &y);
print("x = \(x), y = \(y)");
