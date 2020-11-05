//
//  main.swift
//  继承
//
//  Created by David on 2020/11/1.
//

import Foundation

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // 什么也不做——因为车辆不一定会有噪音
    }
}

let someVehicle = Vehicle()
print("someVehicle = \(someVehicle.description)")
print("--------------------")

class Bicyle: Vehicle {
    var hasBasket = false
}

let bicyle = Bicyle()
bicyle.hasBasket = true

bicyle.currentSpeed = 15.0
print("bicyle = \(bicyle.description)")
print("--------------------")

// 双人自行车
class Tandem: Bicyle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("tandem = \(tandem.description)")
print("--------------------")

// 重写方法
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
        print("--------------------")
    }
}


let train = Train()
train.makeNoise()

// 重写 属性
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car = \(car.description)")
print("--------------------")

// 重写属性观察器
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
print("--------------------")

// 防止重写
class Person {
    final var age: Int = 11
    final func desccription() {
        print("age = \(age)")
        print("--------------------")
    }
    final class func sayHi() {
    print("你好)")
    print("--------------------")
    }
    final subscript(name: String) -> String {
        name
    }
}

var person = Person()
print("age = \(person.age)")
print("--------------------")
person.desccription()
Person.sayHi()
print("name = \(person["Sunday"])")
print("--------------------")


