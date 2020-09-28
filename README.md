

# 简介

- Swift 学习笔记 + 练习代码。

- 参考资料：
  - [Swift 官方文档](https://docs.swift.org/swift-book/)
  - [cnSwift 翻译组](https://www.cnswift.org)
  - [SwiftGG 翻译组](https://swiftgg.gitbook.io/swift/)


# 开始使用 Swift
## Swift 的一些特性
- 运行设备：手机，台式机，服务器

- 支持代码预览（playgrounds），不编译和运行 Swift 代码，实时查看结果
- 采用现代编程模式，避免编程错误：
  - 变量始终在使用前初始化。
  
  - 检查数组索引超出范围的错误。
  - 检查整数是否溢出。
  - 可选值确保明确处理 nil 值。
  - 内存被自动管理。
  - 错误处理允许从意外故障控制恢复。

## 版本兼容性
-  Xcode 12 默认 Swift 版本 Swift 5.3
-  可以使用 Xcode 12 来构建 Swift 5.3、Swift 4.2 或 Swift 4 写的项目

-  使用 Xcode 12 构建 Swift 4 和 Swift 4.2 代码时，Swift 5.3 的大多数功能都适用。但以下功能仅支持 Swift 5.3 或更高版本:
    - 返回值是不透明类型的函数依赖 Swift 5.1 运行时；
    - try? 表达式不会为已返回可选类型的代码引入额外的可选类型层级。
    - 大数字的整型字面量初始化代码的类型将会被正确推导，例如 UInt64(0xffff_ffff_ffff_ffff) 将会被推导为整型类型而非溢出。

## Swift 之旅
- 国际惯例

```swift
 print("Hello, world!")
```
- 无需在代码结尾写分号
- 无需为输入输出函数，或字符串处理导入一个库
- 无需写 main() 函数，全局作用域中的代码会被自动当做程序的入口点

### 简单值
- 使用 let 声明常量，使用 var 来声明变量

- 常量只能赋值一次，变量可多次赋值
- 常量或者变量的类型必须和赋给它的值一样
- 声明时，要么标注类型，要么赋值（编译器自动推断其类型）
- 值永远不会被隐式转换为其他类型（需要把一个值转换成其他类型，要显式转换）
```Swift
let label = "The width is"
let width = 94
let widthLabel = label + String(width)
```
- 把值转换成字符串的简便方法：在双引号里面，把值写到括号中，并且在括号之前写一个反斜杠（\）。
- 字符串拼接，直接用加号“+”（本质是运算符重载，@inlinable public static func + (lhs: String, rhs: String) -> String）
---
- 使用三个双引号（"""）来包含多行字符串
- 每行行首的缩进会被去除，直到和结尾引号的缩进相匹配

```Swift
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""
```
---
- 数组和字典，都用方括号[]创建
- 最后一个元素后面允许有个逗号
- var=可变数组,let=不可变数组,字典同理

```Swift
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
```
- 类型不确定, 创建空数组/空字典, \[type]()

```Swift
let emptyArray = [String]()
let emptyDictionary = [String: Float]()
```
- 类型确定, 给变量赋新值, 或者给函数传参数

```Swift
shoppingList = []
occupations = [:]
```
---

### 控制流
- 包裹条件和循环变量的括号可以省略,但语句体的大括号是必须的
- if 语句中，条件必须是一个【布尔表达式】（不会隐形地与 0 做对比）


### 函数和闭包
### 对象和类
### 枚举和结构体
### 协议和扩展
### 错误处理
### 泛型

## Swift 版本修订记录
[cnSwift](https://www.cnswift.org/document-revision-history)

[SwiftGG](https://swiftgg.gitbook.io/swift/huan-ying-shi-yong-swift/04_revision_history)

[Apple官方](https://docs.swift.org/swift-book/RevisionHistory/RevisionHistory.html)

# Swift 教程
## 基础部分
- Swift 增加了 Objective-C 中没有的高阶数据类型比如元组（Tuple），可用于多返回值的函数。

- Swift 还增加了可选（Optional）类型，用于处理值缺失的情况，它可以用在任何类型上，不仅仅是类。
- Swift 是【类型安全】的语言，可在开发阶段尽早发现并修正错误。

---
### 常量和变量

- 场景：无需多次改变赋值，使用常量；需要多次改变值，使用变量。

- 常量的值一旦设定就不能改变，而变量的值可以随意更改。
### 声明常量和变量
- 用 let 来声明常量，用 var 来声明变量

- 可以在一行中声明多个常量或者多个变量，用逗号隔开：

```Swift
var x = 0.0, y = 0.0, z = 0.0
```

### 类型注解（type annotation）

- 场景：初始值不确定，需要标明数据类型

- 可以在一行中定义多个同样类型的变量，用逗号分割，并在最后一个变量名之后添加类型注解：


```Swift
var red, green, blue: Double
```

> 一般很少写类型注解。在声明常量或者变量赋初始值，Swift 可以推断类型.

### 常量和变量的命名
- 常量和变量名可以包含任何字符，包括 Unicode 字符：

```Swift
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
```
- 不能包含数学符号，箭头，保留的（或者非法的）Unicode 码位，连线与制表符
- 不能以数字开头，但是可以在常量与变量名的其他地方包含数字。
> 可以使用反引号（`）将关键字包围的方式将其作为名字使用, 应当避免使用关键

### 输出常量和变量
- print(_:separator:terminator:) 函数
- 第一个参数：Any...（可变（数量）参数）
- 第二个参数：分隔符-String，默认值" "
- 第三个参数：终止符-String，默认值"\n" 

---
### 注释
- 单行注释（//）
- 多行注释，/**/
- 多行注释可以嵌套

```Swift
/* 这是第一个多行注释的开头
/* 这是第二个被嵌套的多行注释 */
这是第一个多行注释的结尾 */
```
---
### 分号
- 可用，也可不用
- 一种情况下必须要用分号，即你打算在同一行内写多条独立的语句

```
let cat = "🐱"; print(cat)
```

---
### 整数
- Swift 提供了8、16、32和64位的有符号（正、负、零）和无符号整数类型（正、零）
- 像 Swift 的其他类型一样，整数类型采用大写命名法(capitalized names)。

#### 整数范围
- min 和 max 属性来获取对应类型的最小值和最大值

```Swift
let minValue = UInt8.min  // minValue 为 0，是 UInt8 类型
let maxValue = UInt8.max  // maxValue 为 255，是 UInt8 类型
```

#### Int
- Int，长度与当前平台的原生字长相同：
    - 在32位平台上，Int 和 Int32 长度相同。
    - 在64位平台上，Int 和 Int64 长度相同。
> 这可以提高代码一致性和可复用性

#### UInt
- 在32位平台上，UInt 和 UInt32 长度相同。
- 在64位平台上，UInt 和 UInt64 长度相同。
> 尽量不要使用 UInt, 最好使用 Int, 避免不同类型数字之间的转换

---
### 浮点数

- `Double` 表示64位浮点数，精度至少15位数字。

- `Float` 表示32位浮点数，精度只有6位数字。
  
  > 优先选择 `Double`。

---
### 类型安全和类型推断

- 没有显式指定类型，Swift 会使用*类型推断（type inference）*来选择合适的类型

  ```swift
  let meaningOfLife = 42
  // meaningOfLife 会被推测为 Int 类型
  ```

  ```swift
  let pi = 3.14159
  // pi 会被推测为 Double 类型
  ```

  ```swift
  let anotherPi = 3 + 0.14159
  // anotherPi 会被推测为 Double 类型
  ```

---
### 数值型字面量

- 一个*十进制*数，没有前缀

- 一个*二进制*数，前缀是 `0b`

- 一个*八进制*数，前缀是 `0o`

- 一个*十六进制*数，前缀是 `0x`

  ```swift
  let decimalInteger = 17
  let binaryInteger = 0b10001       // 二进制的17
  let octalInteger = 0o21           // 八进制的17
  let hexadecimalInteger = 0x11     // 十六进制的17	
  ```

  
  
  十进制数的指数为 `exp`，那这个数相当于基数和10^exp 的乘积：
  
- `1.25e2` 表示 1.25 × 10^2，等于 `125.0`。

- `1.25e-2` 表示 1.25 × 10^-2，等于 `0.0125`。

  

十六进制数的指数为 `exp`，那这个数相当于基数和2^exp 的乘积

- `0xFp2` 表示 15 × 2^2，等于 `60.0`。
- `0xFp-2` 表示 15 × 2^-2，等于 `3.75`。



- 整数和浮点数, 都可添加额外的零、下划线

  ```swift
  let paddedDouble = 000123.456
  let oneMillion = 1_000_000
  let justOverOneMillion = 1_000_000.000_000_1
  ```

  

---
### 数值型类型转换

#### 整数转换

- `Int8`  存储数字范围-128`~`127

- `UInt8` 存储数字范围0`~`255

  ```swift
  let cannotBeNegative: UInt8 = -1
  // UInt8 类型不能存储负数，所以会报错
  let tooBig: Int8 = Int8.max + 1
  // Int8 类型不能存储超过最大值的数，所以会报错
  ```

  ```swift
  let twoThousand: UInt16 = 2_000
  let one: UInt8 = 1
  let twoThousandAndOne = twoThousand + UInt16(one)
  ```

  > - `SomeType(ofInitialValue)` 是调用 Swift 构造器并传入一个初始值的默认方法。
  >
  > - 不能传入任意类型的值，只能传入 `UInt16` 内部有对应构造器的值。可以扩展现有的类型, 让它可以接收其他类型的值（包括自定义类型）。请参考 [扩展](#扩展构造器)。

#### 整数和浮点数转换

```swift
let integerPi = Int(pi)
// integerPi 等于 3，所以被推测为 Int 类型
```

- 浮点值会被截断。也就是说 `4.75` 会变成 `4`，`-3.9` 会变成 `-3`。

  > 结合数字类常量和变量不同于结合数字类字面量, 字面量 `3` 可以直接和字面量 `0.14159` 相加，因为数字字面量本身没有明确的类型。它们的类型只在编译器需要求值的时候被推测。

---
### 类型别名

- 使用 `typealias` 关键字来定义类型别名。

  ```swift
  typealias AudioSample = UInt16
  ```

  

---
### 布尔值

- 区别于C和OC，Swift的布尔类型为一种单独类型，更加安全和更高的可读性

- Swift 有一个基本的*布尔（Boolean）类型*，叫做 `Bool`

- Swift 有两个布尔常量，`true` 和 `false`

  ```swift
  let orangesAreOrange = true
  let turnipsAreDelicious = false	
  ```

- 使用非布尔值，Swift 的类型安全机制会报错

```swift
let i = 1
if i {
    // 这个例子不会通过编译，会报错
}
```

- 合法的：

  ```swift
  let i = 1
  if i == 1 {
      // 这个例子会编译成功
  }
  ```

  

---
### 元组（tuples）

- 场景：可将不同数据类型，但同一个功能业务接口的数据，集合在一起

- 元组内的值可以是任意类型，并不要求是相同类型。

  ```swift
  let http404Error = (404, "Not Found")
  // http404Error 的类型是 (Int, String)，值是 (404, "Not Found")
  ```

- 将一个元组的内容分解（decompose）成单独的常量和变量

```swift
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// 输出“The status code is 404”
print("The status message is \(statusMessage)")
// 输出“The status message is Not Found”
```

- 用下划线（`_`）,忽略不需要的值

  ```swift
  let (justTheStatusCode, _) = http404Error
  print("The status code is \(justTheStatusCode)")
  // 输出“The status code is 404”
  ```

- 下标访问（下标从零开始）

  ```swift
  print("The status code is \(http404Error.0)")
  // 输出“The status code is 404”
  print("The status message is \(http404Error.1)")
  // 输出“The status message is Not Found”
  ```

- 定义元祖-给元素命名

```swift
let http200Status = (statusCode: 200, description: "OK")
```

- 命名后的访问

```swift
print("The status code is \(http200Status.statusCode)")
// 输出“The status code is 200”
print("The status message is \(http200Status.description)")
// 输出“The status message is OK”
```

- 使用场景：函数的 多个返回值。[ 函数参数与返回值]（#函数参数与返回值）

> 元组不适合创建复杂数据结构, 可用类或结构体去建模。

---
### 可选类型

- 场景：表示该变量/常量，可能有值，可能没值

- *可选类型（optionals）*处理值可能缺失

> - C 和 Objective-C 没有可选类型这个概念, OC对象用nil，基本数据类型用特殊值（比如 `NSNotFound`）
> - Swift 的可选类型，适用于任意类型

```swift
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"
```

- 因构造器可能会失败，所以返回*可选类型*（optional）`Int`，而不是 `Int`。
- 问号暗示表示值为可选类型，可能包含 `Int` 值，可能*不包含值*。（不能包含其他类型值，如 `Bool` 值或 `String` 值。只能是 `Int` ，或什么都没有。）

#### nil

- 场景：可选类型的一个值，表示没有值/值缺失

- 可以给可选变量赋值为 `nil` 来表示它没有值：

```swift
var serverResponseCode: Int? = 404
// serverResponseCode 包含一个可选的 Int 值 404
serverResponseCode = nil
// serverResponseCode 现在不包含值
```

> 非可选类型的常量和变量，不能赋值nil。

- 声明一个可选常量或者变量但是没有赋值，它们会自动被设置为 `nil`：

```swift
var surveyAnswer: String?
// surveyAnswer 被自动设置为 nil
```

> Swift和OC的nil的区别：
>
> - OC ，nil为指针, 指向不存在的对象（只能用于对象类型，不能基本数据类型）
> - Swift，nil是一个值（能用于任意类型）

#### if 语句 +  强制解析

- 场景：只判断可选项是否为空值，不解包

- `if` 语句和 `nil` 比较来判断一个可选值是否包含值

- 使用“相等”(`==`)或“不等”(`!=`)来执行比较

- 可选类型有值，它将不等于 `nil`：

- ```swift
  if convertedNumber != nil {
      print("convertedNumber contains some integer value.")
  }
  // 输出“convertedNumber contains some integer value.”
  ```

- 强制解析/解包（forced unwrapping）：确定有值，可在后面加一个感叹号（`!`）取值。

> 如果没有值，强制解包会报运行时错误.

```swift
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
// 输出“convertedNumber has an integer value of 123.”
```



#### 可选绑定（optional binding）

- 场景：判断可选类型是否有值，并解包使用

- 可选绑定：判断是否有值 --> 有值 --> 解包 + 赋值到常量/变量
- if 和 while 都可以

```swift
// MARK:- 可选绑定 - if
if let atualNumber = Int(possibleNumber) {
    print("if - Int()转换成功, \(atualNumber)")
} else {
    print("if - Int()转换失败")
}

// MARK:- 可选绑定 - while
while let atualNumber = Int(possibleNumber1) {
    print("while - Int()转换成功, \(atualNumber)")
}
```

- 一个 `if` 语句，可包含多个可选绑定或多个布尔条件，用逗号隔开
- 任一可选绑定的值为 `nil`，或任一布尔条件为 `false`，整个 `if` 条件判断为 `false`

```swift
// MARK:- 可选绑定和布尔条件混用
if let firstNumber = Int("4"),
   let secondNumber = Int("42"),
   firstNumber < secondNumber && secondNumber < 100  {
    
    print("--------------------")
    print("\(firstNumber) < \(secondNumber) < 100")
    print("--------------------")
}

// MARK:- 等价于上面
if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            
            print("--------------------")
            print("\(firstNumber) < \(secondNumber) < 100")
            print("--------------------")
        }
    }
}
```

> - if 条件语句创建可选绑定，if 语句中（`body`）中才能获取到值
> - `guard` 语句中创建一个可选绑定，在 `guard` 语句外且在语句后才能获取到值

#### 隐式解析可选类型/隐式解包（implicitly unwrapped optionals）

- 场景：变量/常量明确有值时，减少判断，自动强制解包/解析，提高效率
- 声明方式：可选的类型的后面的问号（`String?`）改成感叹号（`String!`）（相当于把强制解包操作，提前使用）
- 隐式解析可选类型，主要被用在 Swift 中类的构造过程中，请参考 [无主引用以及隐式解析可选属性](#无主引用和隐式解包可选值属性)。

```swift
// MARK:- 可选类型 String 和隐式解析可选类型 String 之间的区别
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要感叹号来获取值

let possibleString1: String! = "An optional string."
// possibleString1 = nil  // 保留可选类型,可以为nil的特性
let forcedString1: String = possibleString1 // 不需要感叹号
```

```swift
// MARK:- 隐式可选项 -  判断是否有值(跟普通可选类型一样)
if possibleString1  !=  nil {
    print(possibleString1!)
}

// MARK:- 隐式可选项 -  可选项绑定 (跟普通可选类型一样)
if let definiteString =  possibleString1 {
    print(definiteString)
}
```



---
### 错误处理（error handling）



---
### 断言和先决条件
#### 使用断言进行调试
#### 强制执行先决条件

# 基本运算符（Basic Operators）

- 赋值符（`=`）不再有返回值。(避免了手误将（`==`）写成（`=`）不报错的问题)
- 算术运算符（`+`，`-`，`*`，`/`，`%` 等）的结果，会被检查是否值溢出（[实现允许溢出](#溢出运算符)）
- Swift 提供 C 没有的区间运算符，如 `a..<b` 或 `a...b`，表达一个区间内的数值
- 本章节只讲基本运算符，自定义运算符、运算符重载请看[高级运算符](#高级运算符)

## 术语（Terminology）

- *一元*运算符（操作一个目标）
  - 前置运算符：如 `!b`
  - 后置运算符：如 `c!`
- *二元*运算符（操作两个目标）
  - 如 `2 + 3`
- *三元*运算符（操作三个目标）
  - 和 C 语言一样，Swift 只有一个三元运算符，就是三目运算符（`a ? b : c`）

---
## 赋值运算符(Assignment Operator)

- 赋值元祖

```swift
let (x, y) = (1, 2)
// 现在 x 等于 1，y 等于 2
```

- 与 C 语言和 Objective-C 不同，Swift 的赋值操作并不返回任何值
- 避免把 （`==`）错写成（`=`）这类错误的出现

```swift
if x = y {
    // 此句错误，因为 x = y 并不返回任何值
}
```



---
## 算术运算符(Arithmetic Operators)

- （所有数值类型）都支持了四则*算术运算符*
  - 加法（`+`）
  - 减法（`-`）
  - 乘法（`*`）
  - 除法（`/`）
- 加法运算符也可用于 `String` 的拼接：

```swift
"hello, " + "world"  // 等于 "hello, world"
```



### 求余运算符

- 求余(remainder)运算符（`%`）在其他语言也叫*取模(*modulo*)运算符*

```swift
9 % 4    // 等于 1
```

```swift
-9 % 4   // 等于 -1
```

- 对负数 `b` 求余时，`b` 的符号会被忽略。这意味着 `a % b` 和 `a % -b` 的结果是相同的

### 一元负号运算符

```swift
let three = 3
let minusThree = -three       // minusThree 等于 -3
let plusThree = -minusThree   // plusThree 等于 3, 或 "负负3" = 3
```

### 一元正号运算符

```swift
let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix 等于 -6
```

---
## 组合赋值运算符

- 组合加运算（`+=`）

```swift
var a = 1
a += 2
// a 现在是 3
```

> 复合赋值运算没有返回值，`let b = a += 2` 这类代码是错误

更多 Swift 标准库运算符的信息，请看 [运算符声明](https://developer.apple.com/documentation/swift/operator_declarations)。 ‌

---
## 比较运算符（Comparison Operators）

支持以下的比较运算符：

- 等于（`a == b`）
- 不等于（`a != b`）
- 大于（`a > b`）
- 小于（`a < b`）
- 大于等于（`a >= b`）
- 小于等于（`a <= b`）

```swift
let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}
// 输出“hello, world", 因为 `name` 就是等于 "world”
```

- 字符串相等判断使用 ==（OC中==，表示两个对象的指针变量指向的地址相同）

---
## 三元运算符（Ternary Conditional Operator）

- 问题 ? 答案 1 : 答案 2
- 缩写形式：

```swift
if question {
    answer1
} else {
    answer2
}
```

- 滥用三元运算符会降低代码可读性，避免在一个复合语句中使用多个三元运算符。

---
## 空合并运算符（Nil Coalescing Operator）

- 场景：设置/返回 可选类型数据没有值/nil时的默认值

- *空合运算符*（`a ?? b`）, a有值就解包，否则返回默认值b。
- a必须是Optional类型，b跟a的存储类型一样（a有值解包后的类型）
- 等价于以下三元运算符的代码：

```swift
a != nil ? a! : b
```

> 如果 `a` 为非空值（`non-nil`），那么值 `b` 将不会被计算。这也就是所谓的*短路求值*。

---
## 区间运算符（Range Operators）

- 几种方便表达一个区间的值的*区间运算符*。

### 闭区间运算符(Closed Range Operator)

- 场景：索引不算0/不是从0开始的情况

- *闭区间运算符*（`a...b`）定义一个包含从 `a` 到 `b`（包括 `a` 和 `b`）的所有值的区间。`a` 的值不能超过 `b`。
- 遍历/迭代

```swift
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}
// 1 * 5 = 5
// 2 * 5 = 10
// 3 * 5 = 15
// 4 * 5 = 20
// 5 * 5 = 25
```



### 半开区间运算符(Half-Open Range Operator)

- 场景：算0的情况

- *半开区间运算符*（`a..<b`）定义一个从 `a` 到 `b` 但不包括 `b` 的区间

```swift
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第 \(i + 1) 个人叫 \(names[i])")
}
// 第 1 个人叫 Anna
// 第 2 个人叫 Alex
// 第 3 个人叫 Brian
// 第 4 个人叫 Jack
```



### 单侧区间(One-Sided Ranges)

- 场景：某个元素开始，到最后一个元素结束

- 一侧无限延伸

```swift
for name in names[2...] {
    print(name)
}
// Brian
// Jack

for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian
```

- 半开区间操作符也有单侧表达形式

```swift
for name in names[..<2] {
    print(name)
}
// Anna
// Alex
```

- 单侧区间可以在下标里使用
- 查看一个单侧区间是否包含某个特定的值

```swift
let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true
```



---
## 逻辑运算符（Logical Operators）

- 逻辑运算符操作(修改或合并) 布尔逻辑值 true 和 false
- 与C语言一致
  - 逻辑非（`!a`）
  - 逻辑与（`a && b`）
  - 逻辑或（`a || b`）

### 逻辑非运算符（Logical NOT Operator）

- 直接写在要进行运算的值前边，不加空格，读作 `非 a`

```swift
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
// 输出“ACCESS DENIED”
```

- 避免使用双重逻辑非运算，或混乱的逻辑语句。

### 逻辑与运算符（Logical AND Operator）

- （`a && b`）表达了只有 `a` 和 `b` 的值都为 `true`

- 如果第一个值为 `false`，那么是不去计算第二个值的，因为它已经不可能影响整个表达式的结果了。这被称做*短路计算（short-circuit evaluation）*。

### 逻辑或运算符（Logical OR Operator）

- 逻辑或运算符（`a || b`）是一个由两个连续的 `|` 组成的中置运算符
- 逻辑或也是「短路计算」的，当左端的表达式为 `true` 时，将不计算右边的表达式了，因为它不可能改变整个表达式的值了。

### 逻辑运算符组合计算（Combining Logical Operators）

```swift
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// 输出“Welcome!”
```

- 如果我们输入了正确的密码并通过了视网膜扫描，或者我们有一把有效的钥匙，又或者我们知道紧急情况下重置的密码，我们就能把门打开进入。

> Swift 逻辑操作符 `&&` 和 `||` 是左结合的，这意味着拥有多元逻辑操作符的复合表达式，优先计算最左边的子表达式。

> 译注
>
> [1]：优先级问题： ~~在 Swift 编程语言全文当中并没有提到逻辑运算符的优先级问题（即默认相等）~~，总之，它们是有优先级的，在[标准库引用文档](https://developer.apple.com/library/mac/documentation/Swift/Reference/Swift_StandardLibrary_Operators/index.html#//apple_ref/doc/uid/TP40016054)中提及。

### 使用括号来明确优先级(Explicit Parentheses)

- 使用括号来明确优先级，增加代码可读性

```swift
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// 输出“Welcome!”
```



---

# 字符串和字符
## 字符串字面量
### 多行字符串字面量
### 字符串字面量的特殊字符
### 扩展字符串分隔符
--
## 初始化空字符串
## 字符串可变性
## 字符串是值类型
## 使用字符
## 连接字符串和字符
## 字符串插值
## Unicode
### Unicode 标量
### 可扩展的字形群集
## 计算字符数量
## 访问和修改字符串
### 字符串索引
### 插入和删除
### 子字符串
## 比较字符串
### 字符串/字符相等
### 前缀/后缀相等
## 字符串的 Unicode 表示形式
### UTF-8 表示
### UTF-16 表示
### Unicode 标量表示

# 集合类型
## 集合的可变性
## 数组（Arrays）
### 数组的简单语法
### 创建一个空数组
### 创建一个带有默认值的数组
### 通过两个数组相加创建一个数组
### 用数组字面量构造数组
### 访问和修改数组
### 数组的遍历
## 集合（Sets）
### 集合类型的哈希值
### 集合类型语法
### 创建和构造一个空的集合
### 访问和修改一个集合
### 遍历一个集合
## 集合操作
### 基本集合操作
### 集合成员关系和相等
## 字典
### 字典类型简化语法
### 创建一个空字典
### 用字典字面量创建字典
### 访问和修改字典
### 字典遍历

# 控制流
## For-In 循环
## While 循环
### While
### Repeat-While

## 条件语句
### Switch
#### 不存在隐式的贯穿
#### 区间匹配
#### 元组
##### 值绑定（Value Bindings）
#### Where
#### 复合型 Cases

### 控制转移语句
#### Continue
##### Break
###### 循环语句中的 break
###### Switch 语句中的 break

##### 贯穿（Fallthrough）
####### 带标签的语句

## 提前退出

## 检测 API 可用性

# 函数
## 函数的定义与调用
## 函数参数与返回值
### 无参数函数
### 多参数函数
### 无返回值函数
### 多重返回值函数
### 可选元组返回类型
### 隐式返回的函数
## 函数参数标签和参数名称
### 指定参数标签
### 忽略参数标签
### 默认参数值
### 可变参数
### 输入输出参数

## 函数类型
### 使用函数类型
### 函数类型作为参数类型
### 函数类型作为返回类型

## 嵌套函数

# 闭包
## 闭包表达式
### 排序方法
### 闭包表达式语法
### 根据上下文推断类型
### 单表达式闭包的隐式返回
### 参数名称缩写
### 运算符方法

## 尾随闭包

## 值捕获

## 闭包是引用类型

## 逃逸闭包

## 自动闭包

# 枚举
## 枚举语法
## 使用 Switch 语句匹配枚举值
## 枚举成员的遍历
## 关联值
## 原始值
### 原始值的隐式赋值
### 使用原始值初始化枚举实例

## 递归枚举

# 类和结构体
## 结构体和类对比
### 类型定义的语法
### 结构体和类的实例
### 属性访问
### 结构体类型的成员逐一构造器

## 结构体和枚举是值类型
## 类是引用类型
### 恒等运算符
### 指针

# 属性
## 存储属性
### 常量结构体实例的存储属性
### 延时加载存储属性
### 存储属性和实例变量

## 计算属性
### 简化 Setter 声明
### 简化 Getter 声明
### 只读计算属性

## 属性观察器

## 属性包装器
### 设置被包装属性的初始值
### 从属性包装器中呈现一个值

## 全局变量和局部变量

## 类型属性
### 类型属性语法
### 获取和设置类型属性的值


# 方法

## 实例方法（Instance Methods）
### self 属性
### 在实例方法中修改值类型
### 在可变方法中给 self 赋值

## 类型方法


# 下标

## 下标语法

## 下标用法

## 下标选项

## 类型下标

# 继承
## 定义一个基类
## 子类生成
## 重写
### 访问超类的方法，属性及下标
### 重写方法
### 重写属
#### 重写属性的 Getters 和 Setters
#### 重写属性观察器
## 防止重写

# 构造过程
## 存储属性的初始赋值
### 构造器
### 默认属性值
## 自定义构造过程
### 形参的构造过程
### 形参命名和实参标签
### 不带实参标签的构造器形参
### 可选属性类型
### 构造过程中常量属性的赋值
## 默认构造器
### 结构体的逐一成员构造器
## 值类型的构造器代理
## 类的继承和构造过程
### 指定构造器和便利构造器
### 指定构造器和便利构造器的语法
### 类类型的构造器代理
### 两段式构造过程
### 构造器的继承和重写
### 构造器的自动继承
### 指定构造器和便利构造器实践
## 可失败构造器
### 枚举类型的可失败构造器
### 带原始值的枚举类型的可失败构造器
### 构造失败的传递
### 重写一个可失败构造器
### init! 可失败构造器
## 必要构造器
## 通过闭包或函数设置属性的默认值

# 析构过程
## 析构过程原理
## 析构器实践

# 可选链
## 使用可选链式调用代替强制解包
## 为可选链式调用定义模型类
## 通过可选链式调用访问属性
## 通过可选链式调用来调用方法
## 通过可选链式调用访问下标
### 访问可选类型的下标
## 连接多层可选链式调用
## 在方法的可选返回值上进行可选链式调用

# 错误处理
## 表示与抛出错误
## 处理错误
### 用 throwing 函数传递错误
### 用 Do-Catch 处理错误
### 将错误转换成可选值
### 禁用错误传递
## 指定清理操作

# 类型转换
## 为类型转换定义类层次
## 检查类型
## 向下转型
## Any 和 AnyObject 的类型转换

# 嵌套类型
## 嵌套类型实践
## 引用嵌套类型

# 扩展
## 扩展的语法
## 计算型属性
## 扩展构造器
## 方法
### 可变实例方法
## 下标
## 嵌套类型

# 协议
## 协议语法
## 属性要求
## 方法要求
## 异变方法要求
## 构造器要求
### 协议构造器要求的类实现
### 可失败构造器要求
## 协议作为类型
## 委托
## 在扩展里添加协议遵循
## 有条件地遵循协议
## 在扩展里声明采纳协议
## 使用合成实现来采纳协议
## 协议类型的集合
## 协议的继承
## 类专属的协议
## 协议合成
## 检查协议一致性
## 可选的协议要求
## 协议扩展
### 提供默认实现
### 为协议扩展添加限制条件

# 泛型
## 泛型解决的问题
## 泛型函数
## 类型参数
## 命名类型参数
## 泛型类型
## 泛型扩展
## 类型约束
### 类型约束语法
### 类型约束实践
## 关联类型
### 关联类型实践
### 扩展现有类型来指定关联类型
### 给关联类型添加约束
### 在关联类型约束里使用协议
## 泛型 Where 语句
## 具有泛型 Where 子句的扩展
## 包含上下文关系的 where 分句
## 具有泛型 Where 子句的关联类型
## 泛型下标

# 不透明类型
## 不透明类型解决的问题
## 返回不透明类型
## 不透明类型和协议类型的区别

# 自动引用计数
## 自动引用计数的工作机制
## 自动引用计数实践
## 类实例之间的循环强引用
## 解决实例之间的循环强引用
### 弱引用
### 无主引用
### 无主引用和隐式解包可选值属性
## 闭包的循环强引用
## 解决闭包的循环强引用
### 定义捕获列表
### 弱引用和无主引用

# 内存安全
## 理解内存访问冲突
### 内存访问性质
## In-Out 参数的访问冲突
## 方法里 self 的访问冲突
## 属性的访问冲突

# 访问控制
## 模块和源文件
## 访问级别
### 访问级别基本原则
### 默认访问级别
### 单 target 应用程序的访问级别
### 框架的访问级别
### 单元测试 target 的访问级别
## 访问控制语法
## 自定义类型
### 元组类型
### 函数类型
### 枚举类型
#### 原始值和关联值
### 嵌套类型
## 子类
## 常量、变量、属性、下标
### Getter 和 Setter
## 构造器
### 默认构造器
### 结构体默认的成员逐一构造器

## 协议
### 协议继承
### 协议遵循

## Extension
### Extension 的私有成员
## 泛型
## 类型别名

# 高级运算符
## 位运算符
### Bitwise NOT Operator（按位取反运算符）
### Bitwise AND Operator（按位与运算符）
### Bitwise OR Operator（按位或运算符）
### Bitwise XOR Operator（按位异或运算符）
### Bitwise Left and Right Shift Operators（按位左移、右移运算符）
#### 无符号整数的移位运算
#### 有符号整数的移位运算
## 溢出运算符
### 数值溢出
## 优先级和结合性
## 运算符函数
### 前缀和后缀运算符
### 复合赋值运算符
### 等价运算符
## 自定义运算符
### 自定义中缀运算符的优先级

# 语言参考

