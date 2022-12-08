import Cocoa

/* ------------------------------------ emun declaration  ------------------------------------ */
/*
   enum enumName {
      ...
   }
 */
enum Week {
    case Sunday;
    case Monday;
    case TUESDAY;
    case WEDNESDAY;
    case THURSDAY;
    case FRIDAY;
    case Saturday;
}

var day = Week.THURSDAY;
day = .THURSDAY;

switch day {
case .Sunday:
    print("Sunday");
case .Monday:
    print("Monday");
case .TUESDAY:
    print("TUESDAY");
case .WEDNESDAY:
    print("WEDNESDAY");
case .THURSDAY:
    print("THURSDAY");
case .FRIDAY:
    print("FRIDAY");
case .Saturday:
    print("Saturday");
}




enum FullName {
    case FirstName(String);
    case LastName(String);
}

var firstName = FullName.FirstName("Hello, ");
var lastName = FullName.LastName("World!");

switch firstName {
case .FirstName(let _firstName):
    print("first nams is \(_firstName)"); // called
case .LastName(let _lastName):
    print("last nams is \(_lastName)");
}

switch lastName {
case .FirstName(let _firstName):
    print("first nams is \(_firstName)");
case .LastName(let _lastName):
    print("last nams is \(_lastName)"); // called
}


enum Month: Int {
    case January = 1, February, March, April, May, June, July, August, September, October, November, December;
}

let may = Month.May.rawValue;
print("may in Month = \(may)");
