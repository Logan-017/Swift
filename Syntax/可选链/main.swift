//
//  main.swift
//  可选链
//
//  Created by David on 2020/11/11.
//

import Foundation

// MARK:- 可选链强制解包
class Person {
    var residence: Residence?
}

//class Residence {
//    var numberOfRooms = 1
//}
Void
class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

class Room {
    let name: String
    init(name: String) { self.name = name }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
             return buildingName
        } else if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}

let john = Person()
// 强制解包
//let roomCount = john.residence!.numberOfRooms
// Fatal error: Unexpectedly found nil while unwrapping an Optional value: file 可选链/main.swift, line 20

//john.residence = Residence()
// 可选链式调用 - 访问属性值,并解包
if let roomCount = john.residence?.numberOfRooms { // numberOfRooms为费可选 Int, 使用了可选链,变为返回 Int?
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
print("--------------------")

// 可选链式调用 - 设置属性值
let someAddress = Address()
someAddress.buildingNumber = "28"
someAddress.street = "Acacia Road"
// 通过 john.residence 来设定 address 属性也会失败，因为 john.residence 当前为 nil。意味着可选链式调用失败时，等号右侧的代码不会被执行
john.residence?.address = someAddress

// 验证可选链调用失败
func createAddress() -> Address {
    print("Function was called  ")
    print("--------------------")

    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}

// 没有任何打印消息，可以看出 createAddress() 函数并未被执行
john.residence?.address = createAddress()

// 通过可选链调用方法
if john.residence?.printNumberOfRooms() != nil { // 方法调用成功返回一个空元祖 () ?,Void? 类型
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}
print("--------------------")

// 设置属性失败,等号右边不执行,并返回 nil
if(john.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}
print("--------------------")

// 通过可选链访问下标
if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
print("--------------------")

// 可选链为下标设置新值
john.residence?[0] = Room(name: "Bathroom")// 这个下标设置的尝试同样失败了，因为 residence 目前还是 nil 。

// 有值的情况 - 调用下标
let johnHouse = Residence()
johnHouse.rooms.append(Room(name: "Living Room"))
johnHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnHouse

if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
print("--------------------")

// 可选链访问可选类型的下标
var testScore = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScore["Dave"]?[0] = 91
testScore["Bev"]?[0] += 1
testScore["Brian"]?[0] = 2
// the "Dave" array is now [91, 82, 84] and the "Bev" array is now [80, 94, 81]

// 多层可选链调用
let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john.residence?.address = johnsAddress

if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}
// 打印“John's street name is Laurel Street.”
print("--------------------")

// 可选返回值进行可选链调用
if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
}
// 打印“John's building identifier is The Larches.”
print("--------------------")

if let beginsWithThe = john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does not begin with \"The\".")
    }
}
// 打印“John's building identifier begins with "The".”
print("--------------------")

