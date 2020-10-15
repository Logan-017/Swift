//
//  main.swift
//  集合类型
//
//  Created by David on 2020/10/14.
//

import Foundation

// MARK:- 创建空数组
var someInts =  [Int]()
var someInts2 = Array<Int>()

// 重新置空. 若根据上下文，数组数据类型确定，可直接：`[]`（一对空方括号）
someInts.append(3)
someInts = []

// MARK:- 创建特定大小+所有数据都被默认
var threeDoubles = Array(repeating: 0.0, count: 3)
threeDoubles.append(1)
print(threeDoubles)
print("--------------------")

// MARK:- 加法操作符（`+`）组合相同类型数组
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles 被推断为 [Double]，等价于 [2.5, 2.5, 2.5]
print(anotherThreeDoubles)
print("--------------------")


var sixDoubles = threeDoubles + anotherThreeDoubles + threeDoubles
// sixDoubles 被推断为 [Double]，等价于 [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
print(sixDoubles)
print("--------------------")

// MARK:- 下标替换多个值
var list = [0, 1, 2, 3, 4, 5]
list[0...3] = [8]
print("list = \(list)")
print("--------------------")

// MARK:- enumerated()返回index + value
for (idx, value) in list.enumerated() {
    print("idx = \(idx)")
    print("value = \(value)")
    print("--------------------")
}

// MARK:- 集合Set的交集操作
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

let union = oddDigits.union(evenDigits).sorted()
print("union = \(union)")
print("--------------------")
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
let intersection = oddDigits.intersection(evenDigits).sorted()
print("intersection = \(intersection)")
print("--------------------")
// []
let subtracting = oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
print("subtracting = \(subtracting)")
print("--------------------")
// [1, 9]
let symmetricDifference = oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
print("symmetricDifference = \(symmetricDifference)")
print("--------------------")
// [1, 2, 9]

// MARK:- 字典updateValue(_:forKey:)
var dic = ["1" : "1", "2" : "2"]
if let oldValue = dic.updateValue("3", forKey: "1") {
    print("oldValue = \(oldValue)")
    print("--------------------")
}

