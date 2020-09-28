//
//  main.swift
//  基本运算符
//
//  Created by David on 2020/9/27.
//

import Foundation

// MARK:- 字符串拼接,使用加法运算符
print("--------------------")
print("Hello," + "world")
print("--------------------")

// MARK:- 求余/取模 - 只与[被除数]符号有关
print("9 % 4 = \(9 % 4)")
print("-9 % 4 = \(-9 % 4)")
print("--------------------")

// MARK:- 求余/取模 - 与[除数]符号无关
print("9 % 4 = \(9 % 4)")
print("9 % -4 = \(9 % -4)")

// MARK:- 恒等（===）和不恒等（!==）,  判断两个对象是否引用同一个对象实例
let obj1 = NSObject()
let obj11 = obj1

let obj2 = NSObject()

if obj1 == obj11 {
    print("obj1 === obj11")
}else {
    print("obj1 !== obj11")
}

if obj1 !== obj2 {
    print("obj1 !== obj2")
}else {
    print("obj1 === obj2")
}

// MARK:- 字符串相等判断(==)
let str1 = "hellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohello"
let str2 = "hellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohello"

if str1 == str2  {
    print("str1 == str2")
}



