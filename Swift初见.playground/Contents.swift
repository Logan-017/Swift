//import UIKit
//
//var str = "Hello, playground"


/*
 Swift 5.1
 */

print("Hello, world!")
/*
 1、无需导入输入、输出、字符串处理的库
 2、无需main（）函数，全局作用域中的代码已被用来作为程序的入口
 3、不需要写分号
 */



var myVariable = 42
myVariable = 50
let myConstant = 42
/*
 let abc
 abc = 123
 报错原因：下面第2点
 */
// myConstant = 110
// 编译失败: change 'let' to 'var' to make it mutable（可变的）

/*
     1、let 声明常量，var 声明变量
     2、声明常量必须初始化，而且只能被赋值一次
 */




let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble : Double = 70.0

let num1 : Float = 4
print(num1)
// let num2 : Int = 4.0
/*
 能赋值给float类型的num1，为啥4.0赋值给Int类型的num2则报错
 error: cannot convert value of type 'Double' to specified type 'Int'
 
 原因：高精度兼容低精度，双精度兼容int，double > float > int
 
 */




// let num3 : Int = 70.0
// error: cannot convert value of type 'Double' to specified type 'Int' - 无法将类型“Double”的值转换为指定类型“Int”

//let num : Int
// let num
// error: type annotation missing in pattern - 模式中缺少类型注释



let label = "The width is"
let width = 94
//let widthLabel = label + width
// error: binary operator '+' cannot be applied to operands of type 'String' and 'Int' - 错误:二进制操作符“+”不能应用于“String”和“Int”类型的操作数

let widthLabel = label + " " + String(width)
print(widthLabel)

//    1、Swift变量/常量 值的数据类型永远不会自动转换（隐式转换）
//    2、如需转换数据类型，请使用显式转换(强转)

let apples = 3
let oranges = 5
//let testString = "\(apples)"
//print(testString)
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

let age = 26.1

let greeting = "Hello, I am \(age) years old"

let quotation = """I said "I have \(apples) apples."

       And then I said "I have \(apples + oranges) pices of fruit."
"""
print("quotation:\n \(quotation)")
/*
 multi-line string literal content must begin on a new line
 错误:多行字符串文字内容必须从新行开始
 
 error: multi-line string literal closing delimiter must begin on a new line
 错误: 多行字符串文字结束分隔符必须从新行开始
 
 */
