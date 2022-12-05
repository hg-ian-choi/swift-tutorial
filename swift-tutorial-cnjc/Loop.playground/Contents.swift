import Cocoa

/* ------------------------------------ Loop ------------------------------------ */
/*
   1. Loop Type:
     1-1. for-in
     1-2. for loop
     1-3. while loop
     1-4. repeat...while loop
   2. Loop Control keywords:
     2-1. continue
     2-2. break
     2-3. fallthrough
 */



// 1. Loop Type:
// 1-1. for-in
/*
   for index in var {
     /* loop */
   }
 */
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)");
}

var A:[Int] = [10, 20, 30];
for index in A {
    print( "index = \(index)");
}



// 1-2. for loop
/*
   for init; condition; increment {
     /* loop */
   }
 */
/* C-style for statement has been removed in Swift 3 */



// 1-3. while loop
/*
   while condition
   {
     statement(s)
   }
 */
var B = 10

while B < 20
{
    print( "B = \(B)");
    B = B + 1;
}



// 1-4. repeat...while loop
/*
   repeat
   {
     statement(s);
   } while (condition);
 */
var C = 15;

repeat{
    print( "C = \(C)");
    C = C + 1;
} while (C < 20);



// 2. Loop Control Keywords
// 2-1. continue
var D = 10;

repeat {
    D = D + 1;
    if (D == 15) {
        continue;
    }
    print("D = \(D)");
} while (D < 20);



// 2-2. break
var E = 10;

repeat{
    E = E + 1;
    if (E == 15) {
        break;
    }
    print("E = \(E)");
} while (E < 20);



// 2-3. fallthrough
var F = 10;
switch F {
case 100:
    print("F == 100");
case 10,15:
    print("F == 10 || 15");
case 5:
    print("F == 5");
default:
    print("default case");
}
