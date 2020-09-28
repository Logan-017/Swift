//
//  main.swift
//  随机函数
//
//  Created by David on 2020/9/29.
//

import Foundation

// MARK:- 生成0~n之间的随机整数 (arc4random() % n + 1)
func arc4random(from m: Int, to n: Int) -> Int {
    return m + Int(arc4random()) % (n - m + 1)
}
print("arc4random() = \(arc4random(from: 0, to: 1))")

// MARK:- 生成0~n之间的随机整数 (arc4random_uniform() % n + 1)  
func arc4random_uniform(from m: Int, to n: Int) -> Int {
    return m + Int(arc4random_uniform(UInt32(n + 1)))
}
print("arc4random_uniform() = \(arc4random_uniform(from: 0, to: 1))")

