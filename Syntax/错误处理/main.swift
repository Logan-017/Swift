//
//  main.swift
//  错误处理
//
//  Created by David on 2020/11/13.
//

import Foundation

enum VendingMachineError: Error {
    case invalidSelection //选择无效
    case insufficientFunds(coinsNeeded: Int) // 金额不足
    case outOfStock                             //缺货
}

// 抛出一个错误，提示贩卖机还需要 5 个硬币：
// throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var invertory = [
        "Candy Bar" : Item(price: 12, count: 7),
        "Chips" : Item(price: 10, count: 4),
        "Pretzels" : Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func vend(itemNamed name:String) throws {
        guard let item = invertory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        var newItem = item
        newItem.count -= 1
        invertory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

let favoriteSnacks = [
    "Alice" : "Chips",
    "Bob" : "Licorice",
    "Eve" : "Pretzels",
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded)")
} catch { // 如果错误没有被匹配，它会被最后一个 catch 语句捕获，并赋值给一个 error 常量。如果没有错误被抛出，do 子句中余下的语句就会被执行。
    print("Unexpected error: \(error).")
}
// 打印“Insufficient funds. Please insert an additional 2 coins.”

func nourish(with item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch is VendingMachineError {
        print("Couldn't buy that from the vending machine.")
    }
}

do {
    try nourish(with: "Beet-Flavored Chips")
} catch {
    print("Unexpected non-vending-machine-related error: \(error)")
}

func eat(item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch VendingMachineError.invalidSelection, VendingMachineError.insufficientFunds, VendingMachineError.outOfStock {
        print("Invalid selection, out of stock, or not enough money.")
    }
}

// 在下面的代码中，`x` 和 `y` 是等价的：
func someThrowingFunction() throws -> Int { 100 }

let x = try? someThrowingFunction()

let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}

// 指定清理操作
//func processFile(fileName: String) throws {
//    if exists(fileName) {
//        let file = open(fileName)
//        defer {
//            close(file)
//        }
//        while let line = try file.readline() {
//            // Work with the file.
//        }
//        // close(file) is called here, at the end of the scope.
//    }
//}
