import UIKit

let π = 3.14159
let 你好 = "你好世界"
let 🌹 = "rose"


var str = "Hello, playground"
print("123",terminator:"")// 如果不想换行，可以传递一个空字符串给 terminator 参数
print("456\(9)")
print("456\("9")")

let cat = "🐱"; print(cat)
// 输出“🐱”


let minValue = UInt8.min // minValue 为 0，是 UInt8 类型
print(minValue)
let maxValue = UInt8.max // maxValue 为 255，是 UInt8 类型
print(maxValue)


let meaningOfLife = 42// meaningOfLife 会被推测为 Int 类型

let pi = 3.14159// pi 会被推测为 Double 类型，当推断浮点数的类型时，Swift 总是会选择 Double 而不是 Float。

let anotherPi = 3 + 0.14159 // 如果表达式中同时出现了整数和浮点数，会被推断为 Double 类型


/*--------------------------------------下面的所有整数字面量的十进制值都是 17:---------------------------*/
let decimalInteger = 17
let binaryInteger = 0b10001       // 二进制的17
let octalInteger = 0o21           // 八进制的17
let hexadecimalInteger = 0x11     // 十六进制的17


// 数值类字面量可以包括额外的格式来增强可读性。整数和浮点数都可以添加额外的零并且包含下划线，并不会影响字面量：
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1


//let cannotBeNegative: UInt8 = -1
//// UInt8 类型不能存储负数，所以会报错
//let tooBig: Int8 = Int8.max + 1
//// Int8 类型不能存储超过最大值的数，所以会报错

// 整数转换
let twoThousand : UInt16 = 2_000
let one : UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)


// 整数和浮点数转换
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pii = Double(three) + pointOneFourOneFiveNine

let integerPii = Int(pii)

let aa = 1 + 0.1


// 类型别名
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.max


// 布尔值
let orangesAreOrange = true
let turnipsAreDelicious = false
if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}

//let i = 1
//if i {
//    // 这个例子不会通过编译，会报错  error: 'Int' is not convertible to 'Bool'
//
//}

let i = 1
if i == 1 {
    // 这个例子会编译成功
}


// 元组
let  http404Error = (404, "Not Found")
// http404Error 的类型是 (Int, String)，值是 (404, "Not Found")


// 你可以将一个元组的内容分解（decompose）成单独的常量和变量，然后你就可以正常使用它们了：
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

// 如果你只需要一部分元组值，分解的时候可以把要忽略的部分用下划线（_）标记：
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")


// 你还可以通过下标来访问元组中的单个元素，下标从零开始：
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

// 你可以在定义元组的时候给单个元素命名：
let http200Status = (statusCode:200, description:"OK")
// 给元组中的元素命名后，你可以通过名字来获取这些元素的值：
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")


// 可选类型
// let abc : String = nil // note: add '?' to form the optional type 'String?'
//let possibleNumber = "123"
 let possibleNumber = "hello, world"
let convertedNumber = Int(possibleNumber)
// convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"


var serverResponseCode : Int? = 404
// serverResponseCode 包含一个可选的 Int 值 404
serverResponseCode = nil
// serverResponseCode 现在不包含值

var surveyAnswer : String?
// surveyAnswer 被自动设置为 nil

func canThrowAnError() throws {
    // 这个函数有可能抛出错误
}

do {
    try canThrowAnError()
    // 没有错误消息抛出
} catch {
    // 有一个错误消息抛出
}


func makeASandwich() throws {
    // ...
}

//do {
//    try makeASandwich()
//    eatASandwich()
//} catch SandwichError.outOfCleanDishes {
//    washDishes()
//} catch SandwichError.missingIngredients(let ingredients) {
//    buyGroceries(ingredients)
//}
