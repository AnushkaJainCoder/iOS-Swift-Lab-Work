/*:
## Exercise - Adopt Protocols: CustomStringConvertible, Equatable, and Comparable
 
 Create a `Human` class with two properties: `name` of type `String`, and `age` of type `Int`. You'll need to create a memberwise initializer for the class. Initialize two `Human` instances.
 */
//class Human: CustomStringConvertible{
//    var name: String
//    var age: Int
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//    var description: String{
//        return "Name: \(name), age:\(age)"
//    }
//}
//let h =  Human(name: "Anushka Jain", age: 21)
//let h1 = Human(name: "Anu", age: 21)
//print(h)
//print(h1)
//:  Make the `Human` class adopt the `CustomStringConvertible` protocol. Print both of your previously initialized `Human` objects.


//:  Make the `Human` class adopt the `Equatable` protocol. Two instances of `Human` should be considered equal if their names and ages are identical to one another. Print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are equal to eachother (using `==`). Then print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are not equal to eachother (using `!=`).

class Human: Equatable{
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    static func == (h1:Human, h2: Human)->Bool{
        return h1.name == h2.name && h1.age == h2.age
        }
}

var h1 = Human(name: "Anu", age: 21)
var h2 = Human(name: "Anus", age: 21)
let areequal = h1 == h2
print(areequal)

//:  Make the `Human` class adopt the `Comparable` protocol. Sorting should be based on age. Create another three instances of a `Human`, then create an array called `people` of type `[Human]` with all of the `Human` objects that you have initialized. Create a new array called `sortedPeople` of type `[Human]` that is the `people` array sorted by age.


//:  Make the `Human` class adopt the `Codable` protocol. Create a `JSONEncoder` and use it to encode as data one of the `Human` objects you have initialized. Then use that `Data` object to initialize a `String` representing the data that is stored, and print it to the console.


/*:
page 1 of 5  |  [Next: App Exercise - Printable Workouts](@next)
 */
