//import UIKit
//
//var str = "Hello, playground"

/*----------------------------------------------Swift 5.1-----------------------------------------------*/


/*----------------------------------------------控制台打印-----------------------------------------------*/
print("Hello, world!")
/*
 1、无需导入输入、输出、字符串处理的库
 2、无需main（）函数，全局作用域中的代码已被用来作为程序的入口
 3、不需要写分号
 */
/*----------------------------------------------常量、变量の声明-----------------------------------------------*/
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
/*--------------------------------------------类型推断、类型标注-------------------------------------------------*/
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
/*---------------------------------------------类型转换------------------------------------------------*/
let label = "The width is"
let width = 94
//let widthLabel = label + width
// error: binary operator '+' cannot be applied to operands of type 'String' and 'Int' - 错误:二进制操作符“+”不能应用于“String”和“Int”类型的操作数

let widthLabel = label + " " + String(width)
print(widthLabel)
/*------------------------------------------------快速转成字符串类型----------------------------------*/
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
/*---------------------------------------------------多行字符串------------------------------------------*/

let quotation = """

       I said "I have \(apples) apples."

       And then I said "I have \(apples + oranges) pices of fruit."
"""
print("quotation:\n \(quotation)")
/*
 multi-line string literal content must begin on a new line
 错误:多行字符串文字内容必须从新行开始
 
 error: multi-line string literal closing delimiter must begin on a new line
 错误: 多行字符串文字结束分隔符必须从新行开始
 */
/*----------------------------------------------创建 数组、字典--------------------------------------------*/
var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "bottle of water"
var occupations = [
    "Malcolm" : "Captain",
    "Kaylee" : "Mechanic",
]
occupations["Jayan"] = "Public Relations"
occupations
/*
 1、使用中括号创建数组或字典
 2、最后一个元素后面可以加逗号
 3、直接使用 数组索引/脚标，字典key/键，去访问元素值
 */


let emptyArray = [String]()
let emptyDictionary = [String : Float]()
// 初始化器语法(initializer syntax)来创建一个空的数组或者字典。


shoppingList = []
occupations = [:]

/*
 如果存在类型推断，可以使用[ ]创建空数组、[ : ]创建空字典，例如你给已声明数组、字典变量赋新值，给函数传参数（形参已声明数组、字典类型的情况）
 */

/*-------------------------------------- if、 while - in --------------------------------------------*/
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
//        if (score > 50) {
        if (score > 50) {
            teamScore += 3
        } else {
            teamScore += 1
        }
}
print("团队分数：\(teamScore)")



/*-------------------------------------- 可选项 --------------------------------------------*/

// var optionalString = nil
// error: 'nil' requires a contextual type - 错误:'nil'需要上下文类型


// var optionalString : String = nil
// error: 'nil' cannot initialize specified type 'String' 错误: 指定类型'String' 不能初始化为'nil'
// note: add '?' to form the optional type 'String?' - 注意:添加”?来形成可选类型“String?”

var string1 : String?
print(string1)
var string2 : String? = nil
print(string2)


var optionalString : String? = "Hello"
print(optionalString == nil)

// var optionalName : String? = "John Appleseed"
var optionalName : String? = nil //
var greeting1 = "Hello!"
if let name = optionalName {
    greeting1 = "Hello, \(name)"
} else{
    print("optionalName的值为nil")
}

let nickName : String? = nil  // 打印结果：Hi Steve Jobs
//let nickName : String? = "Apple"  // 打印结果：Hi Apple
let fullName : String = "Steve Jobs"
let informalGreeting = "Hi \(nickName ?? fullName)"


let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some rasins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)")
default:
    print("Everything tastes good in soup.")
}

