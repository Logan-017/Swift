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



