import Cocoa

/* ------------------------------------ Conditional Statement ------------------------------------ */
/*
   1. if
   2. if...else
   3. if...else if...else
   4. nested if
   5. switch
   6. ternary operator (? :)
 */



// 1. if
/*
 if boolean_expression {
   /* executed when boolean_expression is true */
 }
 */
var A:Int = 10;
if A < 20 {
    print("A < 20");
}
print("A = \(A)");



// 2. if...else
/*
 if boolean_expression {
   /* executed when boolean_expression is true */
 } else {
   /* executed when boolean_expression is false */
 }
 */
var B:Int = 100;
if B < 20 {
    print("B < 20");
} else {
    print("B >= 20");
}
print("B = \(B)");



// 3. if...else if...else
/*
 if boolean_expression_1 {
   /* executed when boolean_expression_1 is true */
 } else if boolean_expression_2 {
   /* executed when boolean_expression_2 is true */
 } else if boolean_expression_3 {
   /* executed when boolean_expression_3 is true */
 } else {
   /* executed when all of the boolean_expressions is false */
 }
 */
var C:Int = 100;
if C == 20 {
    print("C == 20");
} else if C == 50 {
    print("C == 50");
} else {
    print("All False");
}
print("C = \(C)");



// 4. nested if
/*
 if boolean_expression_1 {
   /* executed when boolean_expression_1 is true */
   if boolean_expression_2 {
     /* executed when boolean_expression_2 is true */
   }
 }
 */
var D:Int = 100;
var E:Int = 200;
if D == 100 {
   print("boolean_expression_1 is true");
   if E == 200 {
      print("boolean_expression_2 is true");
   }
}
print("D = \(D)");
print("E = \(E)");



// 5. switch
/*
   switch expression {
     case expression1:
       statement(s)
       fallthrough /* optional */
     case expression2, expression3:
       statement(s)
       fallthrough /* optional */
   
     default: /* optional */
       statement(s);
   }
 */
var F = 10
switch F {
case 100:
    print("F == 100");
case 10, 15:
    print("F == 10 || 15");
case 5:
    print("F == 5");
default:
    print("default case");
}

var G = 10
switch G {
case 100:
    print("G == 100");
    fallthrough;
case 10, 15:
    print("G == 10 || 15");
    fallthrough;
case 5:
    print("G == 5");
default:
    print("default case");
}
