//
//  main.swift
//  闭包
//
//  Created by David on 2020/10/17.
//

import Foundation

// MARK:- 排序-闭包表达式[隐式返回一个布尔值]
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

var reveredNames = names.sorted { (s1: String, s2: String) -> Bool in
    s1 > s2
}

print("reveredNames = \(reveredNames)")
print("--------------------")

// MARK:- 传函数类型
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 < s2
}

var reveredNames1 = names.sorted(by: backward)
print("reveredNames1 = \(reveredNames1)")
print("--------------------")

// MARK:- 尾随闭包 - map
let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    
    return output
}
print("strings = \(strings)")
print("--------------------")

// MARK:- 闭包 - 值捕获
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

print("incrementByTen = \(incrementByTen())")
print("--------------------")
print("incrementByTen = \(incrementByTen())")
print("--------------------")
print("incrementByTen = \(incrementByTen())")
print("--------------------")

let incrementBySeven = makeIncrementer(forIncrement: 7)
print("incrementBySeven = \(incrementBySeven())")
print("--------------------")
