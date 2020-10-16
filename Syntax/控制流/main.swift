//
//  main.swift
//  控制流
//
//  Created by David on 2020/10/16.
//

import Foundation

// MARK:- 【半开区间】使用 `stride(from:to:by:)` 函数跳过不需要的标记
let intreval = 5
for tickMark in stride(from: 0, to: 60, by: intreval) {
    print("tickMark = \(tickMark)")
    print("--------------------")
}

print("--------------------")

// MARK:- 【闭区间】使用 `stride(from:through:by:)` 起到同样作用
for tickMark in stride(from: 0, through: 60, by: intreval) {
    print("tickMark = \(tickMark)")
    print("--------------------")
}

// MARK:- 复合匹配-值绑定-每个条件都需要绑定
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
//case (let distance, 0), (0, distance):// 'distance' must be bound in every pattern
case (let distance, 0), (0, let distance):// 'distance' must be bound in every pattern
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}
// 输出“On an axis, 9 from the origin”

// MARK:- 检测 API 可用性
if #available(iOS 10, macOS 10.12, *) {
    print("#available")
}
