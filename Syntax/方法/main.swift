//
//  main.swift
//  方法
//
//  Created by David on 2020/10/30.
//

import Foundation

// MARK:- 实例方法
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int)  {
        count += amount
    }
    // self 属性 版本
    func increment1() {
        self.count += 1
    }
    func reset() {
        count = 0
    }
}

// 点语法访问
let counter = Counter()
counter.increment()
counter.increment(by: 5)
counter.reset()

// 属性名 和 方法参数名 混淆, 方法参数名优先
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
    print("--------------------")
}

// 修改值类型的属性 - 可变方法
//struct Point1 {
struct Point1 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint1 = Point1(x: 1.0, y: 1.0)
somePoint1.moveBy(x: 2.0, y: 2.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
print("--------------------")

// 结构体类型-常量的属性无法修改(引用类型的可以修改)
let fixedPoint = Point1(x: 3.0, y: 3.0)
// fixedPoint.moveBy(x: 2.0, y: 2.0) // Cannot use mutating member on immutable value: 'fixedPoint' is a 'let' constant

// MARK:- 可变方法中给 self 赋值
struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x dealtaX: Double, y deltaY: Double) {
        self = Point2(x: x + deltaY, y: y + deltaY) // 重新创建一个self实例属性
    }
}

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()
print("ovenLight = \(ovenLight)")
print("--------------------")
ovenLight.next()
print("ovenLight = \(ovenLight)")
print("--------------------")

// MARK:- 类型方法
struct LevelTracker {
    static var highestUnlockLevel = 1
    var currentLevel = 1 // 监测每个玩家当前的等级
    
    static func unlock(_ level: Int) {
        if level > highestUnlockLevel { highestUnlockLevel = level }
    }
    
    static func isUnlocked(_ level: Int) -> Bool { level <= highestUnlockLevel }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

// 调用
class Player {
    var tracker = LevelTracker()
    let playName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playName = name
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockLevel)")

// 创建了第二个玩家，开始一个没有被任何玩家解锁的等级，设置玩家当前等级将会失败：
player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
    print("--------------------")
} else {
    print("level 6 has not yet been unlocked")
    print("--------------------")
}
