//
//  main.swift
//  类和结构体
//
//  Created by David on 2020/10/26.
//

import Foundation

// MARK:- 结构体 - 自动生成,成员初始化器
struct Resolution {
    var width = 0
    var height = 0
}

let resolution = Resolution(width: 1, height: 2)
print("width = \(resolution.width)")
print("--------------------")

class VideoMode {
    var resolution = Resolution(width: 3, height: 3)
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someVideoMode = VideoMode()
print("someVideoMode = \(someVideoMode.resolution.height)")
print("--------------------")

// MARK:- Copy On Write技术
let array = [1, 2, 3, 4]
var arrayCopy = array
print("arrayCopy地址 = \(String(format: "%p", arrayCopy))")
//arrayCopy.removeLast()
print("arrayCopy地址 = \(String(format: "%p", arrayCopy))")
print("--------------------")




