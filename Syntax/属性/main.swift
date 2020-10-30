//
//  main.swift
//  属性
//
//  Created by David on 2020/10/27.
//

import Foundation

// MARK:- 结构体使用 存储属性
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)// 该区间表示整数 0，1，2
rangeOfThreeItems.firstValue = 6 // // 该区间现在表示整数 6，7，8
//rangeOfThreeItems.length = 4 // Cannot assign to property: 'length' is a 'let' constant


// MARK:- 常量结构体实例的存储属性
let rangeOfThreeItems_let = FixedLengthRange(firstValue: 0, length: 3)// 该区间表示整数 0，1，2
//rangeOfThreeItems_let.firstValue = 7 // Cannot assign to property: 'rangeOfThreeItems_let' is a 'let' constant

// MARK:- lazy属性
class DataImporter {
    /*
     DataImporter 是一个负责将外部文件中的数据导入的类。
     这个类的初始化会消耗不少时间。
     */
    var fileName = "data.txt"// 这里会提供数据导入功能
}

struct DataManager {
    lazy var importer = DataImporter()
    //    lazy let importer = DataImporter()// 'lazy' cannot be used on a let
    var data = [String]()
}

//let manager = DataManager()
var manager = DataManager()
manager.data.append("some data")
manager.data.append("Some more data")// DataImporter 实例的 importer 属性还没有被创建
print("data = \(manager.importer.fileName)")// DataImporter 实例的 importer 属性现在被创建了
print("--------------------")

// MARK:- 计算属性
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x),\(square.origin.y))")
print("--------------------")

// MARK:- 只读计算属性
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
// fourByFiveByTwo.volume = 10 // Cannot assign to property: 'volume' is a get-only property
print("the volume of fourByFiveTwo is \(fourByFiveByTwo)")
print("--------------------")


// MARK:- 属性观察器
// 统计一个人步行时的总步数
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("将 totalSteps 的值设置为 \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                //                totalSteps = 0 // 在 didSet 观察器，给属性赋新值，新值会覆盖旧值
                print("增加了 \(totalSteps - oldValue) 步")
            }
            
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// 将 totalSteps 的值设置为 200
// 增加了 200 步
stepCounter.totalSteps = 360
// 将 totalSteps 的值设置为 360
// 增加了 160 步
stepCounter.totalSteps = 896
// 将 totalSteps 的值设置为 896
// 增加了 536 步

// MARK:- 属性观察器 - 调用时机
class Person {
    var age: Int = 0 {
        willSet {
            print("Person - age - willSet")
        }
        didSet {
            print("Person - age - willSet")
        }
    }
}

class Student: Person {
    override init() {
        super.init()
//        age = 1
//        name = "1"
    }
    var name: String = "" {
        willSet {
            print("Student - name - willSet")
        }
        didSet {
            print("Student - name - willSet")
        }
    }
}

//let p = Person()
//print("age = \(p.age)")
print("--------------------")
//p.age = 10
let s = Student()
//s.age = 10
//s.name = "hi"

func test(age:inout Int, name:inout String) -> Void {
    age = 111;
    name = "111"
}

test(age: &s.age, name: &s.name)
print("--------------------")

// MARK:- 属性包裹
// 使用结构体,封装一个Int类型属性的 setter 和 getter 方法
@propertyWrapper
struct TwelveOrLess {
    private var number: Int // number 只能在 TwelveOrLess内部使用
    init() { self.number = 0 }
    var wrappedValue:Int {
        get { number }
        set { number = min(newValue, 12)} // setter 确保新值小于 12
    }
}

var t =  TwelveOrLess()

// 使用
struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print("rectangle = \(rectangle.height)")
print("--------------------")

rectangle.height = 10
print("rectangle = \(rectangle.height)")
print("--------------------")

rectangle.height = 24
print("rectangle = \(rectangle.height)")
print("--------------------")

// 不使用 包装属性 语法, 是下面的代码
struct SmallRectangle1 {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get { _height.wrappedValue }
        set { _height.wrappedValue = newValue}
    }
    var width: Int {
        get { return _width.wrappedValue }
        set { _width.wrappedValue = newValue }
    }
}

@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }

    init() {
        maximum = 12
        number = 0
    }
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

// 使用 `init()` 构造器来设置包装器
struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle()
print("\(zeroRectangle.height), \(zeroRectangle.width)")
print("--------------------")

// 使用 `init(wrappedValue:)` 构造器来设置包装器
struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}

var unitRectangle = UnitRectangle()
print("\(unitRectangle.height), \(unitRectangle.width)")
print("--------------------")

struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}

var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)
print("--------------------")

narrowRectangle.height = 100
narrowRectangle.width = 100
print(narrowRectangle.height, narrowRectangle.width)
print("--------------------")

struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 2
}

var mixedRectangle = MixedRectangle()
print(mixedRectangle.height)
print("--------------------")

mixedRectangle.height = 20
print(mixedRectangle.height)
print("--------------------")

// MARK:- 通过属性包装映射值
@propertyWrapper
struct SmallNumber1 {
    private var number: Int
    var projectedValue: Bool
    init() {
        self.number = 0
        self.projectedValue = false
    }
    var wrappedValue: Int {
        get { number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
}

struct SomeStructTure {
    @SmallNumber1 var someNumber: Int
}
var someStructure = SomeStructTure()

someStructure.someNumber = 4
print(someStructure.$someNumber)
print("--------------------")

someStructure.someNumber = 55
print(someStructure.$someNumber)
print("--------------------")

// MARK:- 类型属性
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int { 1 }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int { 6 }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int { 27 }
    class var overrideableComputedTypeProperty: Int { 107 }
}

print(SomeStructure.storedTypeProperty)
print("--------------------")

print(SomeEnumeration.computedTypeProperty)
print("--------------------")

print(SomeClass.computedTypeProperty)
print("--------------------")

// MARK:- 声道模型
struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // 将当前音量限制在阈值之内
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print("--------------------")

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print("--------------------")
print(AudioChannel.maxInputLevelForAllChannels)


