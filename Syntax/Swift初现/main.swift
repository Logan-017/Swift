//
//  main.swift
//  Swift初现
//
//  Created by David on 2020/9/26.
//

// MARK:- 你好,世界
print("--------------------")
print("Hello, World!")
print("--------------------")

// MARK:- 类型推断: 若不明确类型,需要赋值(编译器自动推断其类型)
let a : Int?
a = nil
//a = 1// Immutable value 'a' may only be initialized once
let a1 = 10

var b : Int?
var b1 = 20

// MARK:- 值安全: 使用前,必须初始化值/有值,哪怕是空值
//print(a) // Constant 'a' used before being initialized
//print(b)// Variable 'b' used before being initialized

// MARK:- 无隐式转换:编译器不会进行隐式转换, 需手动转换
let label = "The width is"
let width = 90
let widthLabel = label + String(90)

// MARK:- 格式化字符串
let sum = "there are \(a1 + b1) apples"
print("--------------------")
print(sum)
print("--------------------")


// MARK:- 多行字符串
let quotation = """
   你好
世界
       我有 \(a1)个苹果
                     你有多少个
"""
print("--------------------")
print(quotation)
print("--------------------")

// MARK:- 中括号创建数组和字典,最后元素后面可加逗号(var=可变数组,let=不可变数组,字典同理)
var shoppingList = ["1", "2", "3",]
var numbDict = [
    "1" : "一",
    "2" : "二",
]

// MARK:- 类型不确定, 创建空数组/空字典, [type]()
let emptyArray = [String]()
let emptyDict = [String : Float]()

// MARK:- 类型确定, 给变量赋新值, 或者给函数传参数
shoppingList = []
numbDict = [:]



