//
//  main.swift
//  扩展
//
//  Created by David on 2020/11/18.
//

import Foundation

// MARK:- 计算型属性
extension Double {
    var km: Double { self * 1_000.0 }
    var m: Double { self }
    var cm: Double { self / 100.0 }
    var mm: Double { self / 1_000.0 }
    var ft: Double { self / 3.28084 }
}

let oneInch = 25.4.mm
print("oneInch = \(oneInch)")
print("--------------------")
let threeFeet = 3.ft
print("threeFeet = \(threeFeet)")
print("--------------------")
let aMarathon = 42.km + 195.m
print("aMarathon = \(aMarathon)")
print("--------------------")

struct Size {
    var with = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(with: 5.0, height: 5.0))

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.with / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(with: 3.0, height: 3.0))

extension Int {
    func repetions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetions {
    print("重复打印")
    print("--------------------")
}

extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0 ..< digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

746381295[0]
746381295[1]
746381295[2]
746381295[8]

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
print("")
