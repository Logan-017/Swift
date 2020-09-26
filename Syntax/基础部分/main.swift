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

