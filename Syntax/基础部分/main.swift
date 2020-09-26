//
//  main.swift
//  基础部分
//
//  Created by David on 2020/9/26.
//

import Foundation

// MARK:- 多行注释嵌套
/* 开头
 /*
 嵌
 套
 */
 
 结尾 **/

// MARK:- 必须使用分号的场景
let cat = "🐈"; print(cat)

// MARK:- 存储范围
//let cannotBeNegative: UInt8 = -1// Negative integer '-1' overflows when stored into unsigned type 'UInt8'
//let tooBig: Int8 = Int8.max + 1// Arithmetic operation '127 + 1' (on type 'Int8') results in an overflow

// MARK:- 添加0和下划线
let zero = 007_000
print("--------------------")
print(zero)
print("--------------------")

// MARK:- 字面量直接计算,自动推导计算结果类型
let floatA = 3 + 0.1415926
print("--------------------")
print(floatA)
print("--------------------")
print("--------------------")
print(Int(floatA))
print("--------------------")

// MARK:- 给类型起别名
typealias XString = String
let XS: XString = "XString--"
print("--------------------")
print(XS)
print("--------------------")
        
typealias XInt = Int
print("--------------------")
print(XInt.max)
print("--------------------")

// MARK:- 元祖
let http404Error = (404, "Not Fount")

// MARK:- 元祖分解
let (statusCode, statusMessage) = http404Error
print("--------------------")
print("code is \(statusCode), message is \(statusMessage)")
print("--------------------")

// MARK:- 元祖分解-下划线忽略元祖的元素
let (statusCode1, _) = http404Error
print("--------------------")
print(statusCode1)
print("--------------------")

// MARK:- 下标访问,从0开始
print("--------------------")
print(http404Error.0, http404Error.1)
print("--------------------")


// MARK:- 定义元祖-给元素命名
let http200Status = (statusCode: 200, description: "OK")

// 通过名字来获取元素的值
print("--------------------")
print(http200Status.statusCode, http200Status.description)
print("--------------------")

// MARK:- 构造器返回可选类型 Optional(123)
let possibleNumber = "123"
let possibleNumber1 = "Hellow"
let convertedNumber = Int(possibleNumber)
let convertedNumber1 = Int(possibleNumber1)
print("--------------------")
//print(convertedNumber)// Expression implicitly coerced from 'Int?' to 'Any'
print("--------------------")
print("--------------------")
//print(convertedNumber1)// Expression implicitly coerced from 'Int?' to 'Any'
print("--------------------")

// MARK:- 可选类型不赋值 ,自动设置为nil
var cc: Int?
//print(cc)// Expression implicitly coerced from 'Int?' to 'Any'

// MARK:- if判断可选类型是否有值(只判断,不解包)
if convertedNumber != nil {
    print("--------------------")
    print("convertedNumber != nil")
    print("--------------------")
}

if convertedNumber1 == nil {
    print("--------------------")
    print("convertedNumber == nil")
    print("--------------------")
}

// MARK:- 可选绑定 - if
if let atualNumber = Int(possibleNumber), let atualNumber1 = Int(possibleNumber1) {
    print("--------------------")
    print("if - Int()转换成功, \(atualNumber), \(atualNumber1)")
    print("--------------------")
} else {
    print("--------------------")
    print("if - Int()转换失败")
    print("--------------------")
}

// MARK:- 可选绑定 - while
while let atualNumber = Int(possibleNumber1), let atualNumber1 = Int(possibleNumber1) {
    print("--------------------")
    print("while - Int()转换成功, \(atualNumber), \(atualNumber1)")
    print("--------------------")
}

// MARK:- 可选绑定和布尔条件混用
if let firstNumber = Int("4"),
   let secondNumber = Int("42"),
   firstNumber < secondNumber && secondNumber < 100  {
    
    print("--------------------")
    print("\(firstNumber) < \(secondNumber) < 100")
    print("--------------------")
}

// MARK:- 等价于上面
if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            
            print("--------------------")
            print("\(firstNumber) < \(secondNumber) < 100")
            print("--------------------")
        }
    }
}

// MARK:- 可选类型 String 和隐式解析可选类型 String 之间的区别
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要感叹号来获取值

var possibleString1: String! = "--- An optional string.-----"
// possibleString1 = nil  // 保留可选类型,可以为nil的特性

// MARK:- 类型确定/显式的数据类型: 自动解包
let forcedString1: String = possibleString1 // 不需要感叹号
print("--------------------")
print(forcedString1)// 打印:--- An optional string.-----
print("--------------------")

// MARK:- 类型不确定: 不解包, 获取的是可选类型
let forcedString2 = possibleString1 // 不需要感叹号
print("--------------------")
//print(forcedString2)// // Optional("--- An optional string.-----")
print("--------------------")

// MARK:- 隐式可选项 -  判断是否有值(跟普通可选类型一样)
if possibleString1  !=  nil {
    print(possibleString1!)
}

// MARK:- 隐式可选项 -  可选项绑定 (跟普通可选类型一样)
if let definiteString =  possibleString1 {
    print(definiteString)
}
