//
//  main.swift
//  枚举
//
//  Created by David on 2020/10/25.
//

import Foundation

//enum Types {
//    case type1
//    case type2
//    case type3
//}

// MARK:- 多个case写在同一行，逗号隔开
enum Type {
    case type1, type2, type3
}


//let type = Type.type3 // 写法1
let type: Type = .type3// 写法2

switch type {
case .type1:
    print("type = \(type)")
    print("--------------------")
case .type2:
    print("type = \(type)")
    print("--------------------")
case .type3:
    print("type = \(type)")
    print("--------------------")
}

// MARK:- 遍历枚举成员(需要遵守CaseIterable协议)
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
print("Beverage.allCases = \(Beverage.allCases)")
print("--------------------")

// 打印“3 beverages available”
for beverage in Beverage.allCases {
    print("beverage = \(beverage)")
    print("--------------------")

}

// MARK:- 关联值
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51225, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")// 只能存储一个,上面的被覆盖
print("productBarcode = \(productBarcode)")
print("--------------------")

// MARK:- 用常量或变量赋值提取关联值
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
// 打印“QR code: ABCDEFGHIJKLMNOP.”

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
//default:
//    break
}
// 打印“QR code: ABCDEFGHIJKLMNOP.”

// MARK:- 原始值
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// 整型原始值, 如果不手动设置,第一个默认为0, 后面一次递增1
enum Planet: Int, CaseIterable {
    case mercury = 1,  venus, earth, mars, jupiter, saturn, uranus, neptune
}

for planetNum in Planet.allCases {
    print("planetNum = \(planetNum.rawValue)")
    print("--------------------")
}

enum CompassPoint: String, CaseIterable {
    case north, south, east, west
}

for point in CompassPoint.allCases {
    print("point = \(point.rawValue)")
    print("--------------------")
}

// MARK:- 课失败初始化器
let positionToFind = 11
if let somePlanet = Planet(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("somePlanet = \(somePlanet.rawValue)")
        print("--------------------")
    default:
        print("somePlant = \(somePlanet.rawValue)")
        print("--------------------")
    }
} else {
    print("somePlant = nil")
    print("--------------------")
}

// MARK:- 递归枚举
//enum ArithmeticExpression {
//    case number(Int)
//    indirect case addition(ArithmeticExpression, ArithmeticExpression)
//    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
//}

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print("lastNum = \(evaluate(product))")
print("--------------------")

