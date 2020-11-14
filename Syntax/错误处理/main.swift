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
throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
