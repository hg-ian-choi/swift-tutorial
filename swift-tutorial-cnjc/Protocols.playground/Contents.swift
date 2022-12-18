import Cocoa

/*------------------------------------ Protocols ------------------------------------ */
/*
 A protocol defines a blueprint of methods, properties, and other requirements that
 suit a particular task or piece of functionality.
 The protocol can then be adopted by a class, structure, or enumeration to provide
 an actual implementation of those requirements.
 Any type that satisfies the requirements of a protocol is said to conform to that protocol.

 In addition to specifying requirements that conforming types must implement,
 you can extend a protocol to implement some of these requirements or to implement
 additional functionality that conforming types can take advantage of.
 */



/*------------------------------------ Protocol Syntax ------------------------------------ */
/*
 You define protocols in a very similar way to classes, structures, and enumerations:
     protocol SomeProtocol {
         // protocol definition goes here
     }
 */
/*
 Custom types state that they adopt a particular protocol by placing the protocol’s name after the type’s name,
 separated by a colon, as part of their definition. Multiple protocols can be listed, and are separated by commas:
     struct SomeStructure: FirstProtocol, AnotherProtocol {
         // structure definition goes here
     }
 */
/*
 If a class has a superclass, list the superclass name before any protocols it adopts, followed by a comma:
     class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
         // class definition goes here
     }
 */
