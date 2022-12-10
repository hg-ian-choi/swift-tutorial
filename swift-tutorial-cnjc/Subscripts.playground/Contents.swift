import Cocoa

/* ------------------------------------ Subscripts ------------------------------------ */
/*
 Classes, structures, and enumerations can define subscripts, which are shortcuts for accessing
 the member elements of a collection, list, or sequence. You use subscripts to set and retrieve
 values by index without needing separate methods for setting and retrieval.
 For example, you access elements in an Array instance as someArray[index] and elements in a
 Dictionary instance as someDictionary[key].
 
 You can define multiple subscripts for a single type, and the appropriate subscript overload to
 use is selected based on the type of index value you pass to the subscript.
 Subscripts aren’t limited to a single dimension, and you can define subscripts with multiple
 input parameters to suit your custom type’s needs.
 */



/* ------------------------------------ Subscript Syntax ------------------------------------ */
/*
 subscript(index: Int) -> Int {
     get {
         // Return an appropriate subscript value here.
     }
     set(newValue) {
         // Perform a suitable setting action here.
     }
 }
 */
struct divisionMethod {
    let numerator: Int;
    subscript(denominator: Int) -> Int {
        return numerator / denominator;
    }
}
let division = divisionMethod(numerator: 100);
print("100 / 9 = \(division[9])"); // => 11
print("100 / 2 = \(division[2])"); // => 50
print("100 / 3 = \(division[3])"); // => 33
print("100 / 5 = \(division[5])"); // => 20
print("100 / 7 = \(division[7])"); // => 14


class weeks {
    private var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "saturday"];
    subscript(index: Int) -> String {
        get {
            return days[index];
        }
        set(newValue) {
            self.days[index] = newValue;
        }
    }
}
var week = weeks();

print(week[0]); // => Sunday
print(week[1]); // => Monday
print(week[2]); // => Tuesday
print(week[3]); // => Wednesday

/* ------------------------------------ Subscript Usage ------------------------------------ */
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4];
numberOfLegs["bird"] = 2;
print(numberOfLegs); // => ["cat": 4, "ant": 6, "spider": 8, "bird": 2]



/* ------------------------------------ Subscript Options ------------------------------------ */
struct Matrix {
    let rows: Int, columns: Int;
    var print: [Double];
    init(rows: Int, columns: Int) {
        self.rows = rows;
        self.columns = columns;
        print = Array(repeating: 0.0, count: rows * columns);
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            return print[(row * columns) + column];
        }
        set {
            print[(row * columns) + column] = newValue;
        }
    }
}
// create a new Matrix with 3 rows and 3 columns
var mat = Matrix(rows: 3, columns: 3);

mat[0, 0] = 1.0;
mat[0, 1] = 2.0;
mat[1, 0] = 3.0;
mat[1, 1] = 5.0;
print("mat[0, 0] = \(mat[0, 0])"); // => 1.0
print("mat[0, 1] = \(mat[0, 1])"); // => 2.0
print("mat[1, 0] = \(mat[1, 0])"); // => 3.0
print("mat[1, 1] = \(mat[1, 1])"); // => 5.0
