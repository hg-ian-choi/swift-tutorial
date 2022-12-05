import Cocoa

/* ------------------------------------ Arithmetic Operator ------------------------------------ */
/*
 "+" => addition
 "-" => subtraction
 "*" => multiplication
 "/" => division
 "%" => remainder
 
 * swift3 removed ++ and --
 */
var A = 10;
var B = 20;

print("A + B => \(A + B)"); // => 30
print("A - B => \(A - B)"); // => -10
print("A * B => \(A * B)"); // => 200
print("B / A => \(B / A)"); // => 2
A += 1; // the same like A++
print("A += 1 => \(A)");    // => 11
B -= 1; // the same like B--
print("B -= 1 => \(B)");    // => 19



/* ------------------------------------ Comparison Operator ------------------------------------ */
/*
 "==" => equal to
 "!=" => not equal to
 ">"  => greater than
 "<"  => less than
 ">=" => equal to or greater than
 "<=" => less than or equal to
 */
var C = 10;
var D = 20;

print("C == D => \(A == B)"); // => false
print("C != D => \(A != B)"); // => true
print("C > D => \(A > B)");   // => false
print("C < D => \(A < B)");   // => true
print("C >= D => \(A >= B)"); // => false
print("C <= D => \(A <= B)"); // => true



/* ------------------------------------ Logical Operator ------------------------------------ */
/*
 "&&" => and
 "||" => or
 "!" => negation
 */
var E = true;
var F = false;

print("E && F => \(E && F)"); // => false
print("E || F => \(E || F)"); // => true
print("!E => \(!E)");         // => false
print("!F => \(!F)");         // => true



/* ------------------------------------ Bitwise Operator ------------------------------------ */
/*
 Binary Level Operation:
 "&"  => and
 "|"  => or
 "^"  => xor(exclusive OR)
 "~"  => negation
 "<<" => left shift
 ">>" => right shift
 */
var p0 = 0;
var q0 = 0;
var p1 = 1;
var q1 = 1;
// p = 0, q = 0
print(p0 & q0); // => 0
print(p0 | q0); // => 0
print(p0 ^ q0); // => 0

// p = 0, q = 1
print(p0 & q1); // => 0
print(p0 | q1); // => 1
print(p0 ^ q1); // => 1

// p = 1, q = 0
print(p1 & q0); // => 0
print(p1 | q0); // => 1
print(p1 ^ q0); // => 1

// p = 1, q = 1
print(p1 & q1); // => 1
print(p1 | q1); // => 1
print(p1 ^ q1); // => 0

var G = 60; // binary: 0011 1100
var H = 13; // binary: 0000 1101
print("G&H => \(G&H)"); // => 12 => binary: 0000 1100
print("G|H => \(G|H)"); // => 61 => binary: 0011 1101
print("G^H => \(G^H)"); // => 49 => binary: 0011 0001
print("~G => \(~G)");   // => -61 => binary: -0011 1101
print("~H => \(~H)");   // => -14 => binary: -0000 1110



/* ------------------------------------ Assignment Operator ------------------------------------ */
/*
 "="   => assignment
 "+="  => assignment after addition
 "-="  => assignment after subtraction
 "*="  => assignment after multiplication
 "/="  => assignment after division
 "%="  => assignment after remainder
 "<<=" => assignment after left shift
 ">>=" => assignment after right shift
 "&="  => assignment after and
 "|="  => assignment after or
 "^="  => assignment after xor
 */
var I = 10;
var J = 20;
var K = 100;

K = I + J;
print("K => \(K)");

K += I;
print("K => \(K)");

K -= I;
print("K => \(K)");

K *= I;
print("K => \(K)");

K /= I;
print("K => \(K)");

K %= I;
print("K => \(K)");

K <<= I;
print("K => \(K)");

K >>= I;
print("K => \(K)");

K &= I;
print("K => \(K)");

K ^= I;
print("K => \(K)");

K |= I;
print("K => \(K)");



/* ------------------------------------ Interval Arithmetic Operator ------------------------------------ */
/*
 X:Integer
 "Closed interval"    => [a, b]: a <= X <= b
 "Semi open interval" => [a, b): a <= X < b
 */
print("Closed interval:")
for index in 1...5 {
   print("\(index) * 5 = \(index * 5)")
}
print("Semi open interval:")
for index in 1..<5 {
    print("\(index) * 5 = \(index * 5)")
}



/* ------------------------------------ Other Operator ------------------------------------ */
/*
 "Unary operation"   => add "-" before an Integer
 "Binary operation"  => add "+" before an Integer
 "Ternary operation" => condition ? X : Y
 "Nullish coalescing operator" => [a "??" b] === [a != nil ? a! : b]
 */
var L = 1;
var M = 2;
var N = true;
var O = false;
print("-L => \(-L)");
print("L + M => \(L + M)");
print("Ternary Operator => \(N ? L : M )");
print("Ternary Operator => \(O ? L : M )");

var P:Int? = 0;
var Q:Int? = nil;
print("P ?? Q => \(P ?? 1)");
print("P ?? Q => \(Q ?? 1)");


/* ------------------------------------ Operator Precedence ------------------------------------ */
/*
 1.  Bitwise Operator                                       => >> &<< &>> >>
 2.  Arithmetic Operator(multiplication/division/remainder) => &* % & * /
 3.  Arithmetic Operator(addition/subtraction)              => | &+ &- + -  ^
 4.  Interval Arithmetic Operator                           => ..< ...
 5.  is as
 6.  Nullish Coalescing Operator                            => ??
 7.  Comparison Operator                                    => != > < >= <= === ==
 8.  Logical Operator(and)                                  => &&
 9.  Logical Operator(or)                                   => ||
 10. ~>
 11. Ternary Operator                                       => ?:
 12. Arrow Function                                         => ()
 13. Assignment Operator                                    => |= %= /= &<<= &>>= &= *= >>= <<= ^= += -=
 */
var R = 0;
R = 2 + 3 * 4 % 5;
print("R => \(R)");
