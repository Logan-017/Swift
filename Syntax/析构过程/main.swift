//
//  main.swift
//  析构过程
//
//  Created by David on 2020/11/10.
//

import Foundation

// `Bank` 类管理虚拟币，确保流通币数不超 10,000。
class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsResquested: Int) -> Int {
        let numberOfcoinsToVend = min(numberOfCoinsResquested, coinsInBank)
        coinsInBank -= numberOfcoinsToVend
        return numberOfcoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}


class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)// 银行回收硬币
    }
}

var playerOne: Player? = Player(coins: 100)
print("playerOne = \(playerOne!.coinsInPurse)")
print("--------------------")

playerOne!.win(coins: 2_000)
print("win = \(playerOne!.coinsInPurse)")
print("--------------------")

print("coinsInBank = \(Bank.coinsInBank)")
print("--------------------")

// 离开游戏
playerOne = nil
print("coinsInBank = \(Bank.coinsInBank)")
print("--------------------")

