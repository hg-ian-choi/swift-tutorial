import Cocoa

/* ------------------------------------ Deinitialization ------------------------------------ */
/*
 A deinitializer is called immediately before a class instance is deallocated.
 You write deinitializers with the deinit keyword, similar to how initializers
 are written with the init keyword. Deinitializers are only available on class types.
 */

/* ------------------------------------ How Deinitialization Works ------------------------------------ */
/*
 Swift automatically deallocates your instances when they’re no longer needed, to free up resources.
 Swift handles the memory management of instances through automatic reference counting (ARC),
 as described in Automatic Reference Counting. Typically you don’t need to perform manual cleanup
 when your instances are deallocated. However, when you are working with your own resources,
 you might need to perform some additional cleanup yourself. For example,
 if you create a custom class to open a file and write some data to it,
 you might need to close the file before the class instance is deallocated.
 */
/*
 deinit {
     // perform the deinitialization
 }
 */

/*
 Deinitializers are called automatically, just before instance deallocation takes place.
 You aren’t allowed to call a deinitializer yourself. Superclass deinitializers are inherited
 by their subclasses, and the superclass deinitializer is called automatically at the end of
 a subclass deinitializer implementation. Superclass deinitializers are always called,
 even if a subclass doesn’t provide its own deinitializer.
 
 Because an instance isn’t deallocated until after its deinitializer is called, a deinitializer
 can access all properties of the instance it’s called on and can modify its behavior based on
 those properties (such as looking up the name of a file that needs to be closed).
 */
var counter = 0;
class BaseClass {
    init() {
        counter += 1;
    }
    deinit {
        counter -= 1;
    }
}

var show: BaseClass? = BaseClass()
print(counter) // => 1
show = nil
print(counter) // => 0

