//
//  main.swift
//  下标
//
//  Created by David on 2020/10/31.
//

import Foundation

// MARK:- 整数 3 的乘法表
struct TimesTable {
    let multiplier: Int
    subscript(idx: Int) -> Int {
        return multiplier * idx
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print(" 3 x 6 = \(threeTimesTable[6])")
print("--------------------")

// 给字典添加一个元素
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2
print("numberOfLegs = \(numberOfLegs)")
print("--------------------")

// MARK:- 下标选项
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
print("matrix = \(matrix.grid)")
print("--------------------")
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
print("matrix = \(matrix.grid)")
print("--------------------")

// 越界
//let someValue = matrix[2, 2]
// Assertion failed: Index out of range: file 下标/main.swift, line 41

// MARK:- 类型下标
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}

let mars = Planet[4]
print("mars = \(mars)")
print("--------------------")



