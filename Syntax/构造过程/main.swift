//
//  main.swift
//  构造过程
//
//  Created by David on 2020/11/1.
//

import Foundation
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("f = \(f.temperature)")
print("--------------------")

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)

// 形参命名和实参标签
struct Color {
    let red, green, blue: Double
    init(red:Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 1.0, blue: 1.0)
let halfGray = Color(white: 0.5)

//let veryGreen = Color(0.0, 1.0, 0.0) // Missing argument labels 'red:green:blue:' in call

// 忽略标签名
struct Celsius1 {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(frmoKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

let bodyTempertureInCelsius = Celsius1(37.0)

// 可选属性类型
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print("text = \(text)")
        print("--------------------")
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like chese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like you"

// 常量属性赋值
class SurveyQuestion1 {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print("text = \(text)")
        print("--------------------")
    }
}
let beetQuestion = SurveyQuestion1(text: "How about beets?")
beetQuestion.ask()
// beetQuestion.text = "1"// Cannot assign to property: 'text' is a 'let' constant

// class - 默认构造器
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

// 结构体-默认属性-不需要属性默认值
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

let zeroByTwo = Size(height: 2.0)
print("zeroByTwo = \(zeroByTwo)")
print("--------------------")

let zeroByZero = Size()
print("zeroByZero = \(zeroByZero)")
print("--------------------")

// 值类型
struct Size1 {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()
print("basicRect = \(basicRect)")
print("--------------------")

let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
print("originRect = \(originRect)")
print("--------------------")

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

// 重写继承的构造器
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        "\(numberOfWheels) wheel(s)"
    }
}

let vehicle = Vehicle()
print("vehicle = \(vehicle.description)")
print("--------------------")

class Bicyle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicyle = Bicyle()
print("bicyle = \(bicyle.description)")
print("--------------------")

class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
        // 隐式调用了 super.init()
    }
    override var description: String {
        "\(super.description) in a beautiful \(color)"
    }
}

// 指定和便利构造器 实践
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Becon")

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}
let oneMysteryItem = RecipeIngredient()
let oneBecon = RecipeIngredient(name: "Becon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem_1: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? "√" : "×"
        return output
    }
}

var breakfastList = [
    ShoppingListItem_1(),
    ShoppingListItem_1(name: "Bacon"),
    ShoppingListItem_1(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print("item = \(item.description)")
    print("--------------------")
}

// 可失败构造器
let wholeNumber: Double = 12345.0
let pi = 3.14159

if let valueMaintained = Int(exactly: wholeNumber) { // 取整
    print("valueMaintained = \(valueMaintained)")
    print("--------------------")
}

let valueChanged = Int(exactly: pi)
if valueChanged == nil {
    print("valueChanged = nil")
    print("--------------------")
}

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}

let someCreature = Animal(species: "Gireffe")

if let giraffe = someCreature {
    print("giraffe = \(giraffe)")
    print("--------------------")
}

let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
    print("anonymousCreature = nil")
    print("--------------------")
}

// 枚举类型可失败构造器
enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
    print("--------------------")
}

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
    print("--------------------")
}

// MARK:- 原始值枚举可失败构造器
enum TemperatureUnit_1: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}

let fahrenheitUnit_1 = TemperatureUnit_1(rawValue: "F")
if fahrenheitUnit_1 != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
    print("--------------------")
}
    
let unknownUnit_1 = TemperatureUnit_1(rawValue: "X")
if unknownUnit_1 == nil {
    print("This is not a defined temperature unit, so initialization failed.")
    print("--------------------")
}

// MARK:- 构造失败传递
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
            self.name = name
    }
}

class CarItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CarItem(name: "sock", quantity: 2) {
    print("twoSocks.name = \(twoSocks.name)")
    print("--------------------")
    print("twoSocks.quantity = \(twoSocks.quantity)")
    print("--------------------")
}

// 创建失败例子
if let zeroShirts = CarItem(name: "shirt", quantity: 0) {
    print("zeroShirts.name = \(zeroShirts.name)")
    print("--------------------")
    print("zeroShirts.quantity = \(zeroShirts.quantity)")
    print("--------------------")
} else {
    print("初始化失败")
    print("--------------------")
}

// 重写可失败构造器
class Document {
    var name: String?
    init() { }
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNameDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init?(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

// 强制解包
class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}

struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

let board = Chessboard()
print(board.squareIsBlackAt(row: 0, column: 1))
print("--------------------")
print(board.squareIsBlackAt(row: 7, column: 7))
print("--------------------")


