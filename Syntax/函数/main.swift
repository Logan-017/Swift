//
//  main.swift
//  函数
//
//  Created by David on 2020/10/16.
//

import Foundation

// MARK:- 多返回值函数
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 77])
print("min = \(bounds.min)")
print("--------------------")
print("max = \(bounds.max)")
print("--------------------")



