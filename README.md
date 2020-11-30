

# 简介

- Swift 学习笔记 + 练习代码

- 参考资料：
  - [Swift 官方文档](https://docs.swift.org/swift-book/)
  - [SwiftGG 翻译组](https://swiftgg.gitbook.io/swift/)
  - [cnSwift 翻译组](https://www.cnswift.org)


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

- *字符串* String是字符Character的集合
- 通过 `+` 符号就可拼接两个字符串
- 能否更改字符串的值，取决于其被定义为常量还是变量

> Swift 的 `String` 类型与 Foundation `NSString` 类进行了无缝桥接。调用 `NSString` 的方法，无需进行类型转换。
>
> 
>
> 更多关于在 Foundation 和 Cocoa 中使用 `String` 的信息请查看 [*Bridging Between String and NSString*](https://developer.apple.com/documentation/swift/string#2919514)。

## 字符串字面量

- 字符串字面量作为常量或者变量的初始值：

```swift
let someString = "Some string literal value"
```

### 多行字符串字面量

- 用三个双引号引起来的一系列字符

```swift
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.
 
"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
```

- 为代码可读性，可在代码里加反斜杠（`\`），对字符串换行（输出的字符串不换行, 且没有反斜杠）

```swift
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
```

- 可以在代码中，使用缩进，让代码工整对齐，但字符串里不会有影响

![](https://docs.swift.org/swift-book/_images/multilineStringWhitespace_2x.png)

- 如果你在某行的空格超过了结束的双引号（ """ ），那么这些空格*会*被包含。

### 字符串字面量的特殊字符

- 转义特殊字符  \0 (空字符)， \\ (反斜杠)， \t (水平制表符)， \n (换行符)， \r(回车符)， \" (双引号) 以及 \' (单引号)

- Unicode 标量，写成 `\u{n}`(u 为小写)，其中 `n` 为任意一到八位十六进制数且可用的 Unicode 位码

```swift
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imageination is more important than knowledge" - Enistein
let dollarSign = "\u{24}"             // $，Unicode 标量 U+0024
let blackHeart = "\u{2665}"           // ♥，Unicode 标量 U+2665
let sparklingHeart = "\u{1F496}"      // 💖，Unicode 标量 U+1F496
```

- 多行字符串, 直接使用双引号（`"`）而不必加上转义符（`\`）
- 多行字符串字面量中使用 `"""`, 使用至少一个转义符（`\`）

```swift
let threeDoubleQuotes = """
Escaping the first quote \"""
Escaping all three quotes \"\"\"
"""
```

### 扩展字符串分隔符
- 井号（ # ）包裹，可以使特殊字符不生效

```swift
#"Line 1\nLine 2"#
```

- 使某个特殊字符生效，使用#号标记

```swift
#"Line 1\#nLine 2"#
```

```swift
###"Line1\###nLine2"###
```

- 多行字符串，包含"""

```swift
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#
```

## 初始化空字符串

```swift
var emptyString = ""               // 空字符串字面量
var anotherEmptyString = String()  // 初始化方法
// 两个字符串均为空并等价。
```

- 通过检查 `Bool` 类型的 `isEmpty` 属性来判断该字符串是否为空

```swift
if emptyString.isEmpty {
    print("Nothing to see here")
}
// 打印输出：“Nothing to see here”
```

## 字符串可变性

```swift
var variableString = "Horse"
variableString += " and carriage"
// variableString 现在为 "Horse and carriage"

let constantString = "Highlander"
constantString += " and another Highlander"
// 这会报告一个编译错误（compile-time error） - 常量字符串不可以被修改。
```

## 字符串是值类型

- Swift 中 `String` 类型是*值类型*

- 如果你创建了一个新的字符串，那么当其进行常量、变量赋值操作，或在函数/方法中传递时，会进行值拷贝。

## 使用字符

- `for-in` 循环来遍历, 获取字符串中每一个字符的值

```swift
for character in "Dog!🐶" {
    print(character)
}
// D
// o
// g
// !
// 🐶
```

- `Character` 类型

```swift
let exclamationMark: Character = "!"
```

- 字符串可通过值类型为 `Character` 的数组来初始化

```swift
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// 打印输出：“Cat!🐱”
```



## 连接字符串和字符

- 通过加法运算符（`+`）相加在一起（或称“连接”）创建一个新的字符串：

```swift
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
// welcome 现在等于 "hello there"
```

- 通过加法赋值运算符（`+=`）将一个字符串, 添加到另一个字符串变量上：

```swift
var instruction = "look over"
instruction += string2
// instruction 现在等于 "look over there"
```

> 你不能把 String或者 Character追加到已经存在的 Character变量当中，因为 Character值能且只能包含一个字符。

## 字符串插值

- *字符串插值*：在字符串中插入 常量、变量、字面量、表达式

```swift
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message 是 "3 times 2.5 is 7.5"
```

- 扩展字符串分隔符 使插值符号失效/不生效

```swift
print(#"Write an interpolated string in Swift using \(multiplier)."#)
// 打印 "Write an interpolated string in Swift using \(multiplier)."
```

- 部分生效

```swift
print(#"\(6 * 7)  times  is \#(6 * 7)."#)
// 打印 \(6 * 7)  times  is 42.
```

## Unicode

- Swift 的 `String` 和 `Character` 类型是完全兼容 Unicode 标准的。

### Unicode 标量

- `String` 类型是基于 *Unicode 标量* 建立

- Unicode 标量: 是对应字符或者修饰符的唯一的 21 位数字
- `U+0061` 表示小写的拉丁字母（`LATIN SMALL LETTER A`）（"`a`"）
- `U+1F425` 表示小鸡表情（`FRONT-FACING BABY CHICK`）（"`🐥`"）

```swift
print("\u{0061}")// a
print("--------------------")
print("\u{1F425}")// 🐥
print("--------------------")
```

> Unicode 标量码位位于 U+0000到 U+D7FF或者 U+E000到 U+10FFFF之间。Unicode 标量码位不包括从 U+D800到 U+DFFF的16位码元码位。

- 不是所有的 21 位 Unicode 标量都指定了字符——有些标量是为将来所保留或用于 UTF-16 编码。
- 有了字符的标量通常来说也会有个名字，比如上边例子中的 ` LATIN SMALL LETTER A` 和` FRONT-FACING BABY CHICK `。

### 可扩展的字形群集

- `Character` 类型代表一个*可扩展的字形集*
- 一个可扩展的字形群构成了人类可读的单个字符，它由一个或多个 Unicode 标量的序列组成。

---

- 字母 `é` 代表了一个单一的 Swift 的 `Character` 值, 同时代表了一个可扩展的字形群
- 第一种情况，这个字形群包含一个单一标量
- 第二种情况，它是包含两个标量的字形群

```swift
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e 后面加上  ́
// eAcute 是 é, combinedEAcute 是 é
```

---

- 可扩展的字形集:  是一个将许多复杂的脚本字符, 表示为单个字符值的灵活方式

- 朝鲜语字母表的韩语音节能表示为组合或分解的有序排列

```swift
let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed 是 한, decomposed 是 한
```

---

- 扩展字形集群允许封闭标记的标量 (比如 COMBINING ENCLOSING CIRCLE, 或者说 U+20DD) 作为单一 Character值来圈住其他 Unicode 标量：

```swift
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
// enclosedEAcute 是 é⃝
```

---

- 区域指示符号的 Unicode 标量可以成对组合来成为单一的 Character值，比如说这个 REGIONAL INDICATOR SYMBOL LETTER U ( U+1F1FA)和 REGIONAL INDICATOR SYMBOL LETTER S (U+1F1F8)：

```swift
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
// regionalIndicatorForUS 是 🇺🇸
```



## 计算字符数量/字符统计

- Character值的总数，使用字符串的 count属性

```swift
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
// 打印输出“unusualMenagerie has 40 characters”
```

> 注意: 使用可拓展的字符群集作为 `Character` 值来连接或改变字符串时，并不一定会更改字符串的字符数量。

```swift
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
// 打印输出“the number of characters in cafe is 4”

word += "\u{301}"    // 拼接一个重音，U+0301

print("the number of characters in \(word) is \(word.count)")
// 打印输出“the number of characters in café is 4”			
```

> - 扩展字形集群能够组合一个或者多个 Unicode 标量。这意味着不同的字符——以及相同字符的不同表示——能够获得不同大小的内存来储存. 特殊的长字符串值，要注意 count属性为了确定字符串中的字符要遍历整个字符串的 Unicode 标量。
> - `count` 属性返回的字符数量并不总是与包含相同字符的 `NSString` 的 `length` 属性相同
> - `NSString` 的 `length` 属性是利用 UTF-16 表示的十六位代码单元数字，而不是 Unicode 可扩展的字符群集

## 访问和修改字符串

- 通过字符串的属性和方法来访问和修改它，当然也可以用下标语法完成

### 字符串索引

- 每一个 `String` 值都有一个关联的索引（*index*）类型，`String.Index`，它对应着字符串中的每一个 `Character` 的位置
- 使用 startIndex属性来访问 String中第一个 Character的位置
- endIndex属性就是 String中最后一个字符后的位置
- endIndex属性并不是字符串下标脚本的合法实际参数。如果String为空，则 startIndex与 endIndex相等。
- 用 index(before:) 和 index(after:) 方法来访问给定索引的前后
- 给定索引更远的索引，你可以使用 index(_:offsetBy:) 方法

```swift
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a
```

- 获取越界索引对应的 `Character`，将引发一个运行时错误。

```swift
greeting[greeting.endIndex] // error
greeting.index(after: greeting.endIndex) // error
```

- 用 `indices` 属性会创建一个包含全部索引的范围（`Range`）

```swift
for index in greeting.indices {
   print("\(greeting[index]) ", terminator: "")
}
// 打印输出“G u t e n   T a g ! ”
```

> 可以在任何遵循了 Collection 协议的类型中使用 startIndex 和 endIndex 属性以及 index(before:) ，index(after:) 和 index(_:offsetBy:) 方法。这包括这里使用的 String ，还有集合类型比如 Array ，Dictionary 和 Set

### 插入和删除

- 特定位置插入字符，使用 insert(_:at:)方法
- 插入一个段字符串, 调用 `insert(contentsOf:at:)` 方法

```swift
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome 变量现在等于 "hello!"

welcome.insert(contentsOf:" there", at: welcome.index(before: welcome.endIndex))
// welcome 变量现在等于 "hello there!"
```

- 移除字符，使用 remove(at:)方法
- 移除一小段字符串，removeSubrange(_:) 

```swift
welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome 现在等于 "hello there"

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
// welcome 现在等于 "hello"	
```

> 任意一个确认的并遵循 `RangeReplaceableCollection` 协议的类型里面，可使用 `insert(_:at:)`、`insert(contentsOf:at:)`、`remove(at:)` 和 `removeSubrange(_:)` 方法, 在如上文用在 `String` 中，也用在 `Array`、`Dictionary` 和 `Set` 

### 子字符串

- 使用下标或者 `prefix(_:)` 之类的方法 —— 就可以得到一个 `Substring` 的实例，而非另外一个 `String`
- `Substring` 绝大部分函数都跟 `String` 一样
- 与字符串不同，在字符串上执行动作的话你应该使用子字符串执行短期处理。当你想要把结果保存得长久一点时，你需要把子字符串转换为 String 实例

```swift
let greeting = "Hello, world!"
let index = greeting.index(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index]
// beginning is "Hello"
 
// Convert the result to a String for long-term storage.
let newString = String(beginning)
```

- `Substring` 可以重用原 `String` 的内存空间，或者另一个 `Substring` 的内存空间
- `newString` 是一个 `String` —— 它是使用 `Substring` 创建的，拥有一片自己的内存空间。

![img](https://docs.swift.org/swift-book/_images/stringSubstring_2x.png)

> `String` 和 `Substring` 都遵循 [`StringProtocol`](https://developer.apple.com/documentation/swift/stringprotocol) 协议，这意味着操作字符串的函数使用 `StringProtocol` 会更加方便。你可以传入 `String` 或 `Substring` 去调用函数

## 比较字符串

三种方式比较文本值：字符串字符相等、前缀相等和后缀相等。

### 字符串/字符相等

```swift
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}
// 打印输出“These two strings are considered equal”
```

- 两个字符串（或者两个字符）的可扩展的字形群集是标准相等，那它们是相等的, 
- 只要可扩展的字形群集有同样的语言意义和外观, 即使它们是由不同的 Unicode 标量构成

---

- 如，`LATIN SMALL LETTER E WITH ACUTE`(`U+00E9`)就是标准相等于 `LATIN SMALL LETTER E`(`U+0065`)后面加上 `COMBINING ACUTE ACCENT`(`U+0301`)

```swift
// "Voulez-vous un café?" 使用 LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" 使用 LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}
// 打印输出“These two strings are considered equal”
```

- 相反，英语中的 `LATIN CAPITAL LETTER A`(`U+0041`，或者 `A`)不等于俄语中的 `CYRILLIC CAPITAL LETTER A`(`U+0410`，或者 `A`)。两个字符看着是一样的，但却有不同的语言意义：

```swift
let latinCapitalLetterA: Character = "\u{41}"

let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent")
}
// 打印“These two characters are not equivalent”
```

> 在 Swift 中，字符串和字符并不区分地域（not locale-sensitive）。

### 前缀/后缀相等

- `hasPrefix(_:)`/`hasSuffix(_:)` 方法检查字符串是否有特定前缀/后缀，两个方法均接收一个 `String` 类型的参数，并返回一个布尔值

```swift
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
```

- 用 `hasPrefix(_:)` 方法来计算话剧中第一幕的场景数：

```swift
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
// 打印输出“There are 5 scenes in Act 1”
```

- 用 `hasSuffix(_:)` 方法来计算发生在不同地方的场景数：

```swift
var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// 打印输出“6 mansion scenes; 2 cell scenes”
```

## 字符串的 Unicode 表示形式

- 一个 Unicode 字符串被写进文本文件或者其他储存时，字符串中的 Unicode 标量会用 Unicode 定义的几种 `编码格式`（encoding forms）编码
- 每一个字符串中的小块编码都被称 `代码单元`（code units）, 包括 UTF-8 编码格式（编码字符串为 8 位的代码单元）， UTF-16 编码格式（编码字符串位 16 位的代码单元），以及 UTF-32 编码格式（编码字符串32位的代码单元）

- 访问字符串的 Unicode 表示形式, 利用 `for-in` 来对字符串进行遍历
- 其他三种 Unicode 兼容的方式访问字符串的值
  - UTF-8 代码单元集合（利用字符串的 `utf8` 属性进行访问）
  - UTF-16 代码单元集合（利用字符串的 `utf16` 属性进行访问）
  - 21 位的 Unicode 标量值集合，也就是字符串的 UTF-32 编码格式（利用字符串的 `unicodeScalars` 属性进行访问）
- `D`,`o`,`g`,`‼`(`DOUBLE EXCLAMATION MARK`, Unicode 标量 `U+203C`)和 `🐶`(`DOG FACE`，Unicode 标量为 `U+1F436`)组成的字符串中的每一个字符代表着一种不同的表示

```swift
let dogString = "Dog‼🐶"
```

### UTF-8 表示

- `String` 的 `utf8` 属性可访问它的 `UTF-8` 表示
- 为 `String.UTF8View` 类型的属性，`UTF8View` 是无符号 8 位（`UInt8`）值的集合，每一个 `UInt8` 值都是一个字符的 UTF-8 表示

### UTF-16 表示

- `String` 的 `utf16` 属性来访问它的 `UTF-16` 表示

### Unicode 标量表示

- 你可以通过遍历 `String` 值的 `unicodeScalars` 属性来访问它的 Unicode 标量表示

# 集合类型

- 数组（Array）：有序

- 集合（Set）：无序无重复

- 字典（Dictionary）：无序的键值对

> Swift 的数组、集合和字典类型被实现为*泛型集合*

## 集合的可变性

- let：不可变
- var：增删改查

> 建议-在不需要改变集合的时候创建不可变集合

## 数组（Arrays）

- 有序储存+相同类型的值（相同类型的值可以重复出现。）

> Swift 的 `Array` 类型被桥接到 Foundation 中的 `NSArray` 类。参见 [Bridging Between Array and NSArray](https://developer.apple.com/documentation/swift/array#2846730)。

### 数组的简单语法

- 完整写法为 `Array<Element>`， `Element` 是数组唯一允许存在的数据类型
- 简单写法`[Element]` （推荐）

### 创建一个空数组

```swift
// MARK:- 创建空数组
var someInts =  [Int]()
var someInts2 = Array<Int>()		
```

- 若根据上下文，数组数据类型确定，可直接：`[]`（一对空方括号）

### 创建一个带有默认值的数组

- 创建特定大小+所有数据都被默认

```swift
var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles 是一种 [Double] 数组，等价于 [0.0, 0.0, 0.0]		
```

### 通过两个数组相加创建一个数组

- 加法操作符（`+`）组合相同类型数组（新数组类型从两个数组的数据类型中推断出来）

```swift
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles 被推断为 [Double]，等价于 [2.5, 2.5, 2.5]

var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles 被推断为 [Double]，等价于 [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
```

### 用数组字面量构造数组

```swift
var shoppingList: [String] = ["Eggs", "Milk"]
// shoppingList 已经被构造并且拥有两个初始项。
```

-  当你用字面量构造-拥有相同类型值数组的时候

```swift
var shoppingList = ["Eggs", "Milk"]
```

### 访问和修改数组

- 数组的方法和属性来访问和修改数组，或者使用下标语法
- 用数组的只读属性 `count`

```swift
print("The shopping list contains \(shoppingList.count) items.")
// 输出“The shopping list contains 2 items.”（这个数组有2个项）
```

- 用布尔属性 `isEmpty` 作为一个缩写形式去检查 `count` 属性是否为 `0`

```swift
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}
// 打印“The shopping list is not empty.”（shoppinglist 不是空的）
```

- 用 `append(_:)` 在数组后面添加新数据：

```swift
shoppingList.append("Flour")
// shoppingList 现在有3个数据项，似乎有人在摊煎饼
```

- 用加法赋值运算符（`+=`）直接将另一个相同类型数组中的数据添加到该数组后面

```swift
shoppingList += ["Baking Powder"]
// shoppingList 现在有四项了
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
```

- 用*下标语法*来获取数组中的数据项

```swift
var firstItem = shoppingList[0]
// 第一项是“Eggs”
```

> 注意
>
> 第一项在数组中的索引值是 `0` 而不是 `1`。 Swift 中的数组索引总是从零开始。

- 用下标来改变某个有效索引值对应的数据值：

```swift
shoppingList[0] = "Six eggs"
// 其中的第一项现在是“Six eggs”而不是“Eggs”
```

- 用下标改变多个值，即使新数据和原有数据的数量是不一样的。

- 下面的例子把 `"Chocolate Spread"`、`"Cheese"` 和 `"Butter"` 替换为 `"Bananas"` 和 `"Apples"`

```swift
shoppingList[4...6] = ["Bananas", "Apples"]
// shoppingList 现在有6项
```

- `insert(_:at:)` 方法-在指定索引值之前添加数据

```swift
shoppingList.insert("Maple Syrup", at: 0)
// shoppingList 现在有7项
// 现在是这个列表中的第一项是“Maple Syrup”
```

- 用 `remove(at:)` 方法来移除数组某一项，并且返回这个被移除的数据项（不需要的时候就可以无视它）

```swift
let mapleSyrup = shoppingList.remove(at: 0)
// 索引值为0的数据项被移除
// shoppingList 现在只有6项，而且不包括 Maple Syrup
// mapleSyrup 常量的值等于被移除数据项“Maple Syrup”
```

> 注意索引越界：当 `count` 等于 0 时（说明这是个空数组），最大索引值一直是 `count - 1`，因为数组都是零起索引

- 数据项被移除后数组中的空出项会被自动填补
- 最后一项移除，可以使用 `removeLast()` 方法而不是 `remove(at:)` 方法来避免需要获取数组的 `count` 属性（也会返回被移除的数据项）

```swift
let apples = shoppingList.removeLast()
// 数组的最后一项被移除了
// shoppingList 现在只有5项，不包括 Apples
// apples 常量的值现在等于字符串“Apples”
```

### 数组的遍历

- 用 `for-in` 循环来遍历数组中所有的数据项

```swift
for item in shoppingList {
    print(item)
}
```

- 需要值和索引值，可以使用 `enumerated()` 方法来进行数组遍历
- `enumerated()` 返回一个由索引值和数据值组成的【元组数组】

```swift
for (index, value) in shoppingList.enumerated() {
    print("Item \(String(index + 1)): \(value)")
}
// Item 1: Six eggs
// Item 2: Milk
// Item 3: Flour
// Item 4: Baking Powder
// Item 5: Bananas
```

## 集合（Sets）

- 存储相同类型+没有顺序要求的数据

> 注意 Swift 的 `Set` 类型被桥接到 Foundation 中的 `NSSet` 类。
>
> 关于使用 Foundation 和 Cocoa 中 `Set` 的知识，参见 [Bridging Between Set and NSSet](https://developer.apple.com/documentation/swift/set#2845530)

### 集合类型的哈希值

- 一个类型为了存储在集合中，该类型必须是*可哈希化*的
- 一个哈希值是 `Int` 类型的，相等的对象哈希值必须相同，比如 `a == b`,因此必须 `a.hashValue == b.hashValue`
- Swift 的所有基本类型（比如 `String`、`Int`、`Double` 和 `Bool`）默认都是可哈希化的

### 集合类型语法

- Set<Element>
- 跟数组不同，没有简化形式

### 创建和构造一个空的集合

```swift
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
// 打印“letters is of type Set<Character> with 0 items.”
```

- 如果上下文提供了类型信息，比如作为函数的参数或者已知类型的变量或常量，你可以通过一个空的数组字面量创建一个空的集合：

```swift
letters.insert("a")
// letters 现在含有1个 Character 类型的值
letters = []
// letters 现在是一个空的 Set，但是它依然是 Set<Character> 类型
```

### 

```swift
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// favoriteGenres 被构造成含有三个初始值的集合
```

> `favoriteGenres` 被声明为一个变量（拥有 `var` 标示符）而不是一个常量（拥有 `let` 标示符）,因为它里面的元素将会在之后的例子中被增加或者移除。

- 一个集合类型不能从数组字面量中被直接推断出来，因此 `Set` 类型必须显式声明

### 访问和修改一个集合

- 取一个集合中元素的数量，可以使用其只读属性 `count`
- 布尔属性 `isEmpty` 作为一个缩写形式去检查 `count` 属性是否为 `0`
- `insert(_:)` 方法来添加一个新元素
- `remove(_:)` 删除一个元素（删除它并且返回它的值）若该集合不包含它，则返回 `nil`
- 通过 `removeAll()` 方法删除所有元素

```swift
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
// 打印“Rock? I'm over it.”
```

- `contains(_:)` 方法去检查是否包含一个特定的值

```swift
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}
// 打印“It's too funky in here.”
```

### 遍历一个集合

- `for-in` 循环中遍历

```swift
for genre in favoriteGenres {
    print("\(genre)")
}
// Classical
// Jazz
// Hip hop
```

- 特定顺序来遍历一个集合中的值可以使用 `sorted()` 方法，它将返回一个有序数组，这个数组的元素排列顺序由操作符 `<` 对元素进行比较的结果来确定

```swift
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}
// Classical
// Hip hop
// Jazz
```

## 集合操作

- 把两个集合组合到一起
- 判断两个集合共有元素
- 判断两个集合是否全包含，部分包含或者不相交

### 基本集合操作

- 以及通过阴影部分的区域显示两个集合 `a` 和 `b`各种操作的结果：

![集合图解](https://docs.swift.org/swift-book/_images/setVennDiagram_2x.png)

- 使用 `intersection(_:)` 方法根据两个集合的交集创建一个新的集合。// 交集
- 使用 `symmetricDifference(_:)` 方法根据两个集合不相交的值创建一个新的集合。// 并集 - 交集
- 使用 `union(_:)` 方法根据两个集合的所有值创建一个新的集合。// 并集
- 使用 `subtracting(_:)` 方法根据不在另一个集合中的值创建一个新的集合。

```swift
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]
```

### 集合成员关系和相等

![img](https://docs.swift.org/swift-book/_images/setEulerDiagram_2x.png)

- 运算符（`==`）来判断两个集合包含的值是否全部相同
- `isSubset(of:)` 方法来判断一个集合中的所有值是否也被包含在另外一个集合中
- 使用 `isSuperset(of:)` 方法来判断一个集合是否包含另一个集合中所有的值。
- 使用 `isStrictSubset(of:)` 或者 `isStrictSuperset(of:)` 方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。

- 使用 `isDisjoint(with:)` 方法来判断两个集合是否不含有相同的值（是否没有交集）

```swift
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true
```

## 字典

- 无序的集合
- 所有键的值需要是相同的类型
- 所有值的类型也需要相同

>  Swift 的 `Dictionary` 类型被桥接到 Foundation 的 `NSDictionary` 类。

>  更多关于在 Foundation 和 Cocoa 中使用 `Dictionary` 类型的信息，参见 [Bridging Between Dictionary and NSDictionary](https://developer.apple.com/documentation/swift/dictionary#2846239)。

### 字典类型简化语法

- 用 `Dictionary<Key, Value>` 定义
- 简化可用 `[Key: Value]`

> 字典的 `Key` 类型必须遵循 `Hashable` 协议，就像 `Set` 的值类型。

### 创建一个空字典

```swift
var namesOfIntegers = [Int: String]()
// namesOfIntegers 是一个空的 [Int: String] 字典
```

- 如果上下文已经提供了类型信息，可以使用空字典字面量来创建一个空字典，记作 `[:]` （一对方括号中放一个冒号）

```swift
namesOfIntegers[16] = "sixteen"
// namesOfIntegers 现在包含一个键值对
namesOfIntegers = [:]
// namesOfIntegers 又成为了一个 [Int: String] 类型的空字典
```

### 用字典字面量创建字典

```swift
[key 1: value 1, key 2: value 2, key 3: value 3]
```

```swift
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
```

- 键和值都有各自一致的类型，那么就不必写出字典的类型

```swift
var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
```

- Swift 可以推断出 `[String: String]` 是 `airports` 字典的正确类型

### 访问和修改字典

- 只读属性 `count`

```swift
print("The dictionary of airports contains \(airports.count) items.")
// 打印“The dictionary of airports contains 2 items.”（这个字典有两个数据项）
```

- 布尔属性 `isEmpty` 作为一个缩写形式去检查 `count` 属性是否为 `0`

```swift
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}
// 打印“The airports dictionary is not empty.”
```

- 下标语法访问

```swift
airports["LHR"] = "London"
// airports 字典现在有三个数据项
```

- 下标语法来改变特定键对应的值

```swift
airports["LHR"] = "London Heathrow"
// “LHR”对应的值被改为“London Heathrow”
```

- `updateValue(_:forKey:)` 方法可以设置或者更新特定键对应的值（不存在对应值的时候会设置新值或者在存在时更新已存在的值）
- 该方法返回更新值之前的*原值* 的可选类型。这样使得你可以检查更新是否成功。

```swift
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
// 输出“The old value for DUB was Dublin.”
```

- 也可以使用下标语法
- 如果这个字典包含请求键所对应的值，下标会返回一个包含这个存在值的可选类型，否则将返回 `nil`

```swift
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}
// 打印“The name of the airport is Dublin Airport.”
```

- 可以使用下标语法通过将某个键的对应值赋值为 `nil` 来从字典里移除一个键值

```
airports["APL"] = "Apple Internation"
// “Apple Internation”不是真的 APL 机场，删除它
airports["APL"] = nil
// APL 现在被移除了
```

- `removeValue(forKey:)` 方法也可以用来在字典中移除键值对
- 在键值对存在的情况下会移除该键值对并且返回被移除的值
- 在没有对应值的情况下返回 `nil`

```swift
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
// 打印“The removed airport's name is Dublin Airport.”
```

### 字典遍历

- 用 `for-in` 循环来遍历某个字典中的键值对

```swift
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
// YYZ: Toronto Pearson
// LHR: London Heathrow
```

- 访问 `keys` 或者 `values` 属性，你也可以遍历字典的键或者值

```swift
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
// Airport code: YYZ
// Airport code: LHR


for airportName in airports.values {
    print("Airport name: \(airportName)")
}
// Airport name: Toronto Pearson
// Airport name: London Heathrow
```

- 用某个字典的键集合或者值集合来作为某个接受 `Array` 实例的 API 的参数

- 可以直接使用 `keys` 或者 `values` 属性构造一个新数组

  ```swift
  let airportCodes = [String](airports.keys)
  // airportCodes 是 ["YYZ", "LHR"]
  
  
  let airportNames = [String](airports.values)
  // airportNames 是 ["Toronto Pearson", "London Heathrow"]
  ```

- 可以对字典的 `keys` 或 `values` 属性使用 `sorted()` 方法

# 控制流-Control Flow

- 多次执行任务的 `while` 循环
- 基于特定条件选择执行不同代码分支的 `if`、`guard` 和 `switch` 语句
- 控制流程跳转到其他代码位置的 `break` 和 `continue` 语句
- `for-in` 循环，用来更简单地遍历数组（Array），字典（Dictionary），区间（Range），字符串（String）和其他序列类型

- `switch` 语句比许多类 C 语言要更加强大，case 还可以匹配很多不同的模式，包括范围匹配，元组（tuple）和特定类型匹配
- `switch` 语句的 case 中匹配的值可以声明为临时常量或变量，在 case 作用域内使用，也可以配合 `where` 来描述更复杂的匹配条件

## For-In 循环

- 遍历数组

```swift
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
// Hello, Anna!
// Hello, Alex!
// Hello, Brian!
// Hello, Jack!
```

- 遍历字典

```swift
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
// cats have 4 legs
// ants have 6 legs
// spiders have 8 legs
```

- `for-in` 循环还可以使用数字范围。下面的例子用来输出乘法表的一部分内容

```swift
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25
```

- `index` 是一个每次循环遍历开始时被自动赋值的常量
- 只需要将它包含在循环的声明中，就可以对其进行隐式声明，而无需使用 `let` 关键字声明
- 如不需要区间每一项的值，使用下划线（`_`）替代变量名来忽略这个值

```swift
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
// 输出“3 to the power of 10 is 59049”
```

- 场景：绘制分钟的刻度线。总共 `60` 个刻度，从 `0` 分开始
- 半开区间运算符（`..<`）来表示一个左闭右开的区间

```
let minutes = 60
for tickMark in 0..<minutes {
    // 每一分钟都渲染一个刻度线（60次）
}
```

- 场景：用户可能在其 UI 中可能需要较少的刻度。他们可以每 5 分钟作为一个刻度
- 【半开区间】使用 `stride(from:to:by:)` 函数跳过不需要的标记

```swift
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    // 每5分钟渲染一个刻度线（0, 5, 10, 15 ... 45, 50, 55）
}
```

- 【闭区间】使用 `stride(from:through:by:)` 起到同样作用

```swift
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    // 每3小时渲染一个刻度线（3, 6, 9, 12）
}
```

## While 循环

- `repeat-while` 循环，每次在循环结束时计算条件是否符合
  - `while` 循环，每次在循环开始时计算条件是否符合
  - `repeat-while` 循环，每次在循环结束时计算条件是否符合

### While

```swift
while condition {
    statements
}
```

### Repeat-While

- 和 `while` 的区别是在判断循环条件之前，先执行一次循环的代码块

```swift
repeat {
    statements
} while condition
```

## 条件语句

- 条件较为简单且可能的情况很少时，使用 `if` 语句
- `switch` 语句更适用于条件较复杂、有更多排列组合的时候
- `switch` 在需要用到模式匹配（pattern-matching）的情况下会更有用

### if

- 单个条件

```swift
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}
// 输出“It's very cold. Consider wearing a scarf.”
```

- 二选一执行， `else` 从句

```swift
temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
// 输出“It's not that cold. Wear a t-shirt.”
```

- 多个条件

```swift
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
// 输出“It's really warm. Don't forget to wear sunscreen.”
```

- 当不需要完整判断情况的时候，最后的 `else` 语句是可选的

```swift
temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}
```

- 既不冷也不热，所以不会触发 `if` 或 `else if` 分支，也就不会打印任何消息

### Switch

- `switch` 语句会决定哪一条分支应该被执行，这个流程被称作根据给定的值*切换（switching）*
- `switch` 语句必须是完备的
  - 每一个可能的值都必须至少有一个 case 分支与之对
  - 使用默认（`default`）分支来涵盖其它所有没有对应的值，这个默认分支必须在 `switch` 语句的最后面

```swift
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
// 输出“The last letter of the alphabet”
```

#### 没有隐式的贯穿

- C 和 Objective-C 中：没有break语句可能会导致switch穿透-多个case语句被执行
- 当匹配的 case 分支中的代码执行完毕后，程序会终止 `switch` 语句，而不会继续执行下一个 case 分支
- 不需要在 case 分支中显式地使用 `break` 语句
- 更安全、更易用，也避免了漏写 `break` 语句导致多个语言被执行的错误

> 虽然在 Swift 中 `break` 不是必须的，但你依然可以在 case 分支中的代码执行完毕前使用 `break` 跳出，详情请参见 [Switch 语句中的 break]()。



- 每一个 case 分支都*必须*包含至少一条语句
- 下面这样书写代码是无效的，因为第一个 case 分支是空的（在C和OC，会贯穿/穿透。Swift更加安全）

```swift
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a": // 无效，这个分支下面没有语句
case "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// 这段代码会报编译错误
```

- 可将两个值组成一个复合匹配，并且用逗号分开。单个 case 同时匹配 `a` 和 `A`

```swift
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// 输出“The letter A”
```

- 为了可读性，复合匹配可以写成多行形式

```swift
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", 
     "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// 输出“The letter A”
```

> 想显式贯穿 case 分支，请用 `fallthrough` 语句

#### 区间匹配

- case 分支的模式也可以是一个值的区间
- 例子-用区间匹配来输出任意数字对应的自然语言格式：

```swift
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// 输出“There are dozens of moons orbiting Saturn.”
```

#### 元组

- 元组中的元素可以是值，也可以是区间
- 用下划线（`_`）来匹配所有可能的值

- 例子：用一个 `(Int, Int)` 类型的元组来分类下图中的点 (x, y)

```swift
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}
// 输出“(1, 1) is inside the box”
```

![img](https://docs.swift.org/swift-book/_images/coordinateGraphSimple_2x.png)

##### 值绑定（Value Bindings）

- 先匹配，后赋值

- 匹配值声明为临时常量或变量 ，在 case 分支体内使用 —— 这种行为被称为*值绑定*（value binding）
- 将下图中的点 (x, y)，使用 `(Int, Int)` 类型的元组表示，然后分类表示

```swift
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):// 相当于（_，0）
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
// 输出“on the x-axis with an x value of 2”
```

- 这个 `switch` 语句不包含默认分支。
- 因为最后一个 case ——`case let(x, y)` 声明了一个可以匹配余下所有值的元组。这使得 `switch` 语句已经完备了，因此不需要再书写默认分支。

#### Where

- 用 `where` 语句增加额外判断条件

```swift
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// 输出“(1, -1) is on the line x == -y”
```

- `where` 语句的条件为 `true` 时，匹配到的 case 分支才会被执行

#### 复合型 Cases

- 若多个条件都执行一个方法，可将多条件值放在同一个 `case` 后面，并且用逗号隔开
-  case 后面的任意一种模式匹配的时候，这条分支就会被匹配
- 如果匹配列表过长，还可以分行书写

```swift
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}
// 输出“e is a vowel”
```

- 第一个 case，匹配五个小写元音字母
- 第二个 case 匹配所有的小写辅音字母
- `default` 分支匹配了其它所有字符



- 复合匹配同样可以包含值绑定
- 复合匹配里所有的匹配模式的条件，都必须包含相同的值绑定。并且每一个绑定都必须获取到相同类型的值。
- 这保证了，无论复合匹配中的哪个模式发生了匹配，分支体内的代码，都能获取到绑定的值，并且绑定的值都有一样的类型

```swift
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}
// 输出“On an axis, 9 from the origin”
```

### 控制转移语句

- 改变代码的执行顺序，实现代码的跳转
- Swift 有五种控制转移语句
  - `continue`
  - `break`
  - `fallthrough`
  - `return`
  - `throw`
- `return` 语句将会在 [函数]() 章节讨论，`throw` 语句会在 [错误抛出]() 章节讨论
- 下面讨论 `continue`、`break` 和 `fallthrough` 语句

#### Continue

- 只用在循环体内部

- 告诉一个循环体立刻停止本次循环，重新开始下次循环
- “本次循环我已经执行完了”，但是并不会离开整个循环体

```
// 匹配到元音字母或者空格字符，就调用 continue 语句，使本次循环结束，重新开始下次循环
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)
    // 输出“grtmndsthnklk”
```

##### Break

- `break` 语句立刻结束整个控制流的执行
- `break` 可以在 `switch` 或循环语句中使用，用来提前结束 `switch` 或循环语句

###### 循环语句中的 break

- `break` 时，会立刻中断该循环体的执行，跳转到循环体结束的大括号（`}`）后的第一行代码
- 不会再有本次循环的代码被执行，也不会再有下次的循环产生

###### Switch 语句中的 break

- `switch` 代码块中使用 `break` 时，会立即中断该 `switch` 代码块的执行，并且跳转到表示 `switch` 代码块结束的大括号（`}`）后的第一行代码
- 一个使用场景：忽略某个分支，那个分支被匹配到时，分支内的 `break` 语句立即结束 `switch` 代码块

> 当一个 `switch` 分支仅仅包含注释时，会被报编译时错误。注释不是代码语句而且也不能让 `switch` 分支达到被忽略的效果。你应该使用 `break` 来忽略某个分支

- 例子：通过 `switch` 来判断一个 `Character` 值是否代表下面四种语言之一

```swift
let numberSymbol: Character = "三"  // 简体中文里的数字 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}
// 输出“The integer value of 三 is 3.”
```

- `default` 分支不需要执行任何动作，所以它只写了一条 `break` 语句

##### 贯穿（Fallthrough）

- 从上一个 case 分支跳转到下一个 case 分支中，只要第一个匹配到的 case 分支完成了它需要执行的语句，整个 `switch` 代码块完成了它的执行

- 需要 C 风格的贯穿的特性，可在需要该特性的 case 分支中使用 `fallthrough` 关键字

```swift
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)
// 输出“The number 5 is a prime number, and also an integer.”
```

> `fallthrough` 关键字不会检查它下一个将会落入执行的 case 中的匹配条件

##### 带标签的语句  - statement label

- 显式地指明 `break` 语句想要终止的是哪个循环体或者条件语句
- 类似地，有许多嵌套的循环体，显式指明 `continue` 语句想要影响哪一个循环体也会非常有用
- 用 `break` 或者 `continue` 加标签，来结束或者继续这条被标记语句的执行



- 在该语句的关键词的同一行前面放置一个标签，作为这个语句的前导关键字（introducor keyword），并且该标签后面跟随一个冒号

```swift
 label name: while condition {
     statements
 }
```

```swift
gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        // 骰子数刚好使玩家移动到最终的方格里，游戏结束。
        break gameLoop// 结束标签标记的循环体
    case let newSquare where newSquare > finalSquare:
        // 骰子数将会使玩家的移动超出最后的方格，那么这种移动是不合法的，玩家需要重新掷骰子
        continue gameLoop// 结束【本次】标签标记的循环，开始下一次循环
    default:
        // 合法移动，做正常的处理
        square += diceRoll
        square += board[square]
    }
}
print("Game over!")
```

- `break gameLoop` 语句跳转控制去执行 `while` 循环体后的第一行代码，意味着游戏结束
- `continue gameLoop` 语句结束本次 `while` 循环，开始下一次循环

> - 如果上述的 `break` 语句没有使用 `gameLoop` 标签，那么它将会中断 `switch` 语句而不是 `while` 循环
> - 因为在这个游戏中，只有一个循环体，所以 `continue` 语句会影响到哪个循环体是没有歧义的，不是必须的

## 提前退出

- `guard` 语句来要求条件必须为真时，以执行 `guard` 语句后的代码
- 不同于 `if` 语句，一个 `guard` 语句总是有一个 `else` 从句，如果条件不为真则执行 `else` 从句中的代码

```swift
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }


    print("Hello \(name)!")


    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }


    print("I hope the weather is nice in \(location).")
}


greet(person: ["name": "John"])
// 输出“Hello John!”
// 输出“I hope the weather is nice near you.”
greet(person: ["name": "Jane", "location": "Cupertino"])
// 输出“Hello Jane!”
// 输出“I hope the weather is nice in Cupertino.”
```

- `guard` 语句的条件被满足，则继续执行 `guard` 语句大括号后的代码
- 将变量或者常量的可选绑定作为 `guard` 语句的条件，都可以保护 `guard` 语句后面的代码



- 条件不被满足，在 `else` 分支上的代码就会被执行
- 这个分支必须转移控制以退出 `guard` 语句出现的代码段。它可以用控制转移语句如 `return`、`break`、`continue` 或者 `throw` 做这件事，或者调用一个不返回的方法或函数，例如 `fatalError()`



- 相比 `if` 语句， `guard` 语句会提升代码可读性，使代码连贯被执行而不将它包在 `else` 块中，它可以使你在紧邻条件判断的地方，处理违规的情况

## 检测 API 可用性

- 当前部署机器上，避免使用了不可用的 API
- 使用一个不可用的 API，Swift 会在编译时报错

```swift
if #available(iOS 10, macOS 10.12, *) {
    // 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
} else {
    // 使用先前版本的 iOS 和 macOS 的 API
}
```

- `*`，是必须的，用于指定在所有其它平台中，如果版本号高于你的设备指定的最低版本，if 语句的代码块将会运行。



- 平台名字可以是 `iOS`，`macOS`，`watchOS` 和 `tvOS`——请访问 [声明属性]() 来获取完整列表
- 除了指定像 iOS 8 或 macOS 10.10 的大版本号，也可以指定像 iOS 11.2.6 以及 macOS 10.13.3 的小版本号

```swift
if #available(平台名称 版本号, ..., *) {
    APIs 可用，语句将执行
} else {
    APIs 不可用，语句将不执行
}
```

# 函数

- *函数*是一段完成特定任务的独立**代码片段**
- Swift 函数语法非常的灵活
- 没有参数名字的 C 风格函数，到复杂的带局部和外部参数名的 Objective-C 风格函数
- 参数可以提供默认值，以简化函数调用
- 参数也可以既当做传入参数，也当做传出参数，一旦函数执行结束，传入的参数值将被修改。
- 函数类型=参数类型 + 返回值类型
- 函数类型当做任何其他普通变量类型一样处理，把函数当做别的函数的参数，也可以从其他函数中返回函数
- 函数的定义可以写在其他函数定义中，这样可以在嵌套函数内实现功能封装

## 函数的定义与调用

```swift
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Anna"))
// 打印“Hello, Anna!”
print(greet(person: "Brian"))
// 打印“Hello, Brian!”
```

> `print(_:separator:terminator:)` 函数的第一个参数并没有设置一个标签，而其他的参数因为已经有了默认值，因此是可选的

- 简化这个函数的定义，可以将问候消息的创建和返回写成一句

```swift
func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))
// 打印“Hello again, Anna!”
```

## 函数参数与返回值

### 无参数函数

```swift
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())
// 打印“hello, world”
```

- 无参数，但圆括号必须写
- 调用时，函数名 + 圆括号

### 多参数函数

- 参数被包含在函数的括号之中，以逗号分隔

```swift
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))
// 打印“Hello again, Tim!”
```

- 虽然它们都有着同样的名字 `greet`，但是 `greet(person:alreadyGreeted:)` 函数需要两个参数，而 `greet(person:)` 只需要一个参数

### 无返回值函数

- 中没有返回箭头（->）和返回类型

```swift
func greet(person: String) {
    print("Hello, \(person)!")
}
greet(person: "Dave")
// 打印“Hello, Dave!”
```

> 严格地说，即使没有明确定义返回值，该 `greet(Person：)` 函数仍然返回一个值。没有明确定义返回类型的函数的返回一个 `Void` 类型特殊值，该值为一个空元组，写成 ()

- 调用函数时，可以忽略该函数的返回值：

```swift
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
// 打印“hello, world”，并且返回值 12
printWithoutCounting(string: "hello, world")
// 打印“hello, world”，但是没有返回任何值
```

### 多重返回值函数

- 用元组（tuple）类型让多个值作为一个复合值从函数中返回

- 在一个 `Int` 类型的数组中找出最小值与最大值

```swift
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
```

- 因元组的成员值已被命名，可通过 `.` 语法来检索

```swift
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
// 打印“min is -6 and max is 109”
```

### 可选元组返回类型

- 在元组类型的右括号后放置一个问号来定义一个可选元组
- 如 `(Int, Int)?` 或 `(String, Int, Bool)?`

> 可选元组类型如 `(Int, Int)?` 与元组包含可选类型如 `(Int?, Int?)` 是不同的。可选的元组类型，整个元组是可选的，而不只是元组中的每个元素值

- 函数不会对传入的数组执行任何安全检查，如果 `array` 参数是一个空数组，如上定义的 `minMax(array:)` 在试图访问 `array[0]` 时会触发一个运行时错误
- 为了安全地处理这个“空数组”问题，将 `minMax(array:)` 函数改写为使用可选元组返回类型，并且当数组为空时返回 `nil`

```swift
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }// 
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
```

### 隐式返回的函数

- 整个函数体 = 单行表达式 = （隐式）返回表达式

  ```swift
  func greeting(for person: String) -> String {
      "Hello, " + person + "!"
  }
  print(greeting(for: "Dave"))
  // 打印 "Hello, Dave!"
  
  
  func anotherGreeting(for person: String) -> String {
      return "Hello, " + person + "!"
  }
  print(anotherGreeting(for: "Dave"))
  // 打印 "Hello, Dave!"
  ```

- 正如你将会在 [简略的 Getter 声明]() 里看到的， 一个属性的 getter 也可以使用隐式返回的形式。

## 函数参数标签和参数名称

- 每个函数参数都有一个*参数标签（argument label）*以及一个*参数名称（parameter name）*
- 参数标签--在调用函数的时候使用(针对外部)
- 参数名称--在函数的实现中使用（针对内部）

- 默认情况：参数标签 = 参数名称

```swift
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
}
someFunction(firstParameterName: 1, secondParameterName: 2)
```

- 参数标签名称可相同，但建议保持唯一性，保证代码可读性

### 指定参数标签

- 在参数名称前指定它的参数标签，中间以空格分隔

```swift
func someFunction(argumentLabel parameterName: Int) {
    // 在函数体内，parameterName 代表参数值
}
```

- 参数标签增加代码可读性

### 忽略参数标签

- 想调用的时候没标签，可用下划线（`_`）代替参数标签

```swift
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
     // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
}
someFunction(1, secondParameterName: 2)
```

- 若参数有标签，调用的时必须用标签

### 默认参数值

- 定义*默认值（Deafult Value）*：通过给参数赋值
- 调用函数时，可忽略该参数

```swift
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // 如果你在调用时候不传第二个参数，parameterWithDefault 会值为 12 传入到函数体中。
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault = 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault = 12
```

- 官方建议：没默认值的参数放最前（保证代码清晰可读，如同名函数重载）

### 可变（个数）参数

- 一个*可变参数（variadic parameter）*可以接受零个或多个值
- 在变量类型名后面加入（`...`）
- 函数体内，当作该类型的一个数组使用

- 计算一组任意长度数字的 *算术平均数（arithmetic mean)*：

```swift
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// 返回 3.0, 是这 5 个数的平均数。
arithmeticMean(3, 8.25, 18.75)
// 返回 10.0, 是这 3 个数的平均数。
```

> 一个函数最多只能拥有一个可变参数。

### 输入输出参数

- 函数参数默认是常量**let**，函数体中更改参数值会编译错误
- 想要在函数体修改参数的值，并想在修改在函数调用结束后仍然存在，把这个参数定义为*输入输出参数（In-Out Parameters）*（一个 `输入输出参数`有传入函数的值，这个值被函数修改，然后被传出函数，替换原来的值）
- 参数定义前加 `inout` 关键字
- 只能传递变量，不能传入常量或者字面量
- 在参数名前加 `&` 符，表示这个值可以被函数修改

> 输入输出参数不能有默认值，而且可变参数不能用 `inout` 标记



- `swapTwoInts(_:_:)` 函数有两个分别叫做 `a` 和 `b` 的输入输出参数

```swift
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
```

```swift
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// 打印“someInt is now 107, and anotherInt is now 3”
```

## 函数类型

- 函数类型 = 参数类型 + 返回值类型

```swift
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
```

- 两个函数的类型是 `(Int, Int) -> Int`
- 解读为: “这个函数类型有两个 `Int` 型的参数并返回一个 `Int` 型的值”

```swift
func printHelloWorld() {
    print("hello, world")
}
```

- 类型是：`() -> Void`，或者叫“没有参数，并返回 `Void` 类型的函数”。

### 使用函数类型

- 定义一个类型为函数的常量或变量，并将适当的函数赋值给它

```swift
var mathFunction: (Int, Int) -> Int = addTwoInts
```

- 解读为：

  ”定义一个叫做 `mathFunction` 的变量，类型是‘一个有两个 `Int` 型的参数并返回一个 `Int` 型的值的函数’，并让这个新变量指向 `addTwoInts` 函数”

- `addTwoInts` 和 `mathFunction` 有同样的类型， Swift 类型检查（type-check）通过

- 变量调用

```swift
print("Result: \(mathFunction(2, 3))")
// Prints "Result: 5"
```

- 同类型函数可赋值给同一个变量

```swift
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")
// Prints "Result: 6"
```

- 可以让 Swift 来推断其函数类型

```swift
let anotherMathFunction = addTwoInts
// anotherMathFunction 被推断为 (Int, Int) -> Int 类型
```

### 函数类型作为参数类型

- 用 `(Int, Int) -> Int` 这样的函数类型作为另一个函数的参数类型

- 使用场景：将函数的一部分实现留给函数的调用者来提供

- 同样是输出某种数学运算结果

```swift
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
// 打印“Result: 8”
```

### 函数类型作为返回类型

```swift
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
```

```swift
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}
```

```swift
var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero 现在指向 stepBackward() 函数。
```

```swift
print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// 3...
// 2...
// 1...
// zero!
```

## 嵌套函数

- 目前为止所有函数都叫*全局函数（global functions）*
- 把函数定义在别的函数体中，称作 *嵌套函数（nested functions）*
  - 默认情况下，嵌套函数是对外界不可见的
  - 但可被它的外围函数（enclosing function）调用
  - 一个外围函数也可返回它的某一个嵌套函数，使得这个函数可以在其他域中被使用

- 用返回嵌套函数的方式重写 `chooseStepFunction(backward:)` 函数

```swift
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!
```

# 闭包-Closures

- 自包含的函数代码块
- 与 C 和 Objective-C 中的代码块（blocks））以及其他语言的匿名函数（Lambdas）比较相似
- 闭包会 捕获 + 存储常量和变量的引用（称为包裹常量和变量）
- Swift会管理捕获过程的内存操作
- 全局和嵌套函数是特殊的闭包



- 闭包的三种形式

  - 全局函数是一个有名字但不会捕获任何值的闭包；
  - 内嵌函数是一个有名字且能从其上层函数捕获值的闭包；
  - 闭包表达式是一个轻量级语法所写的可以捕获其上下文中常量或变量值的没有名字的闭包。

  

- 闭包语法简洁，鼓励特定场景优化写法
  - 利用上下文推断形式参数和返回值的类型；
  - 单表达式的闭包可以隐式返回；
  - 简写实际参数名；
  - 尾随闭包语法。

## 闭包表达式

- 函数嵌套，代码块式的定义和命名形式，十分方便
- 闭包表达式是一种内联闭包

### 排序方法

- `sorted(by:)` 的方法/函数：接受一个包含排序表达式的闭包参数，返回排好序的新数组
- 原数组不会被 `sorted(by:)` 方法修改

```swift
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
```

- 排序闭包函数类型需为 `(String, String) -> Bool`

```swift
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

// 将函数当作闭包传参
var reversedNames = names.sorted(by: backward)
// reversedNames 为 ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
```

### 闭包表达式语法

- 闭包表达式语法

```swift
{ (parameters) -> return type in
    statements
}
```

- *参数* 可以是 in-out 参数
- 参数不能设定默认值
- 命名了可变参数，也可以使用此可变参数
- 元组也可以作为参数和返回值

- `backward(_:_:)` 函数对应的闭包表达式版本的代码

```swift
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
```

- 内联闭包类型与 `backward(_:_:)` 函数类型声明相同



- 关键字 `in`：参数 + 返回值类型  in（分界线） 函数体
- 函数体短的，可简写成一行代码

```swift
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )
```

- 参数现在变成了内联闭包

### 根据上下文推断类型

- 省略不写：参数类型 + 返回值类型
  - 字符串数组调用`sorted(by:)` 方法 -> 参数是字符串类型
  - 排序 -> 返回值是布尔类型

- 省略后的写法

```swift
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
```

- 当把闭包作为行内闭包表达式传递给函数或方法时，形式参数类型和返回类型都可以被推断出来

### 单表达式闭包的隐式返回

- 省略不写： return 返回值
  - 单表达式 -> 隐式返回

### 参数名称缩写

- 省略不写：参数名称
  - Swift会自动把闭包的参数名称命名为：$0 , $1 , $2······
  - `in` 关键字也省略不写
- 省略后写法

```swift
reversedNames = names.sorted(by: { $0 > $1 } )
```

### 运算符方法/函数 - Operator Methods

- 省略不写：参数

  - Swift已经为String类型实现了大于号（ >）的运算符方法/函数

  ```swift
  @inlinable public static func > (lhs: String, rhs: String) -> Bool	
  ```

- 更多关于运算符方法的内容请查看 [运算符方法]()

## 尾随闭包

- 尾随闭包场景：防止闭包太长，无法一行书写，不再需要将整个闭包包裹在 `funName(_:)` 方法的括号内
- 函数的最后一个参数为：闭包表达式
- 尾随闭包，不用写参数标签

```swift
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // 函数体部分
}


// 以下是不使用尾随闭包进行函数调用
someFunctionThatTakesAClosure(closure: {
    // 闭包主体部分
})


// 以下是使用尾随闭包进行函数调用
someFunctionThatTakesAClosure() {
    // 闭包主体部分
}
```

- 函数的参数只有一个闭包表达式时，可把圆括号 `()` 省略掉

```swift
reversedNames = names.sorted { $0 > $1 }	
```

- 例子：`Array` 类型的 `map(_:)` 方法，
  - 该闭包函数会为数组中的每一个元素调用一次，并返回该元素所映射的值的新数组
  - 映射方式和返回值类型由闭包来推断
- 创建一个整型和英文字符串的映射关系字典

```swift
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
```

```swift
let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
// strings 常量被推断为字符串类型数组，即 [String]
// 其值为 ["OneSix", "FiveEight", "FiveOneZero"]
```

- 根据数组类型，可确定number的类型

> digitNames 的下标紧跟着一个感叹号( ! )，因为字典下标返回一个可选值，表明即使该 key 不存在也不会查找失败

## 值捕获

- 场景：*捕获*常量或变量，延长生命周期。
- 定义常量或变量的作用域消失，闭包内部依然可引用和修改这些值

```swift
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
```

> 值在闭包内不被修改，捕获一份副本/拷贝即可
>
> Swift会自动处理值捕获的管理内存

```swift
let incrementByTen = makeIncrementer(forIncrement: 10)
```

```swift
incrementByTen()
// 返回的值为10
incrementByTen()
// 返回的值为20
incrementByTen()
// 返回的值为30
```

```swift
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
// 返回的值为7
```

```swift
incrementByTen()
// 返回的值为40
```



## 闭包是引用类型

- 函数和闭包都是*引用类型*
- 将闭包赋值给了两个不同的常量或变量，两个值都会指向同一个闭包

```swift
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
// 返回的值为50
```

## 逃逸闭包 - Escaping Closures

- 闭包作为实参传给函数的时候
- 非逃逸闭包：闭包在函数中（返回前）运行（闭包的引用计数在进入函数和退出函数时保持不变）
- 逃逸闭包：闭包在函数返回/结束后运行（称该闭包从函数中逃逸，逃逸闭包生命周期长于相关函数函数退出时，逃逸闭包的引用仍然被其他对象持有）
- 闭包参数默认是非逃逸类型。如果需要其逃逸类型的闭包，可以使用关键字@escaping
- 场景：
  - 异步调用：如果需要调度队列中异步调用闭包，这个队列会持有闭包的引用，至于什么时候调用闭包，或者闭包什么时候运行结束都是不可预知的
  - 存储：需要存储闭包作为属性，全局变量或者其他类型做稍后使用。
- 闭包逃逸条件：闭包被函数外部的变量引用/保存

```swift
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
```

- `someFunctionWithEscapingClosure(_:)` 函数接受一个闭包作为参数，该闭包被添加到一个函数外定义的数组中（不将这个参数标记为 `@escaping`，就会得到一个编译错误）

  

- 为了提醒处理循环引用：

  - 逃逸闭包要显式调用self
  - 非逃逸闭包可隐式调用self

```swift
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}


class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}


let instance = SomeClass()
instance.doSomething()
print(instance.x)
// 打印出“200”


completionHandlers.first?()
print(instance.x)
// 打印出“100”
```

```swift
class SomeOtherClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { [self] in x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}
```

- 如果 self 是结构体或者枚举的实例，可隐式地引用 self
- 总之，当 self 的类型是结构体或者枚举时，逃逸闭包不能捕获mutable的 self 引用
- 如同 *结构体和枚举是值类型* 中描述的那样，结构体和枚举不允许共享可修改性。

```
struct SomeStruct {
    var x = 10
    mutating func doSomething() {
        someFunctionWithNonescapingClosure { x = 200 }  // Ok
        someFunctionWithEscapingClosure { x = 100 }     // Error
    }
}
```

- someFunctionWithEscapingClosure会报错，违反了逃逸闭包不能捕获mutable结构体类型的self

## 自动闭包

- 使用场景：延时执行,  只传一个表达式，不传显式闭包，省略闭包的花括号
- 下面的代码展示了闭包如何延迟求值

```swift
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]// 客户名称-数组
print(customersInLine.count)
// 打印出“5”


let customerProvider = { customersInLine.remove(at: 0) }// 类型不是 `String`，而是 `() -> String`
print(customersInLine.count)
// 打印出“5”


print("Now serving \(customerProvider())!")// 返回被移除的元素
// 打印出“Now serving Chris!”
print(customersInLine.count)
// 打印出“4”
```

- 如果闭包不调用，第一个元素永远不会被移除
- `customerProvider` 的类型不是 `String`，而是 `() -> String`，一个没有参数且返回值为 `String` 的函数



- 把闭包作参数传给函数，实现延迟处理

```swift
// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
// 打印出“Now serving Alex!”
```

- 不接受显式闭包，将函数的闭包形参标记为 `@autoclosure`来接收一个自动闭包

```swift
// customersInLine is ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
// 打印“Now serving Ewa!”
```

> 为了代码可读性，避免过度使用autoclosure。

- 自动闭包 + 逃逸闭包。同时使用 `@autoclosure` 和 `@escaping` 属性

```swift
// customersInLine i= ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))


print("Collected \(customerProviders.count) closures.")
// 打印“Collected 2 closures.”
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
// 打印“Now serving Barry!”
// 打印“Now serving Daniella!”
```

- @autoclosure 只支持 () -> T 格式的参数
- @autoclosure 并非只支持最后1个参数
- 空合并运算符 ?? 使用了 @autoclosure 技术
- 有@autoclosure、无@autoclosure，构成了函数重载

# 枚举 - Enumerations

## 枚举语法

- 使用 `enum` 关键词来创建枚举

```swift
enum SomeEnumeration {
    // 枚举定义放在这里
}
```

- 指南针四个方向

```swift
enum CompassPoint {
    case north
    case south
    case east
    case west
}
```

> 与 C 和 Objective-C 不同，`north`，`south`，`east` 和 `west` 不会被隐式地赋值为 `0`，`1`，`2` 和 `3`。
>
> 每个成员都被定义为的 `CompassPoint` 类型

- 省空间写法：多个 case 写在同一行，逗号隔开

```swift
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
```

- 定义一个新枚举 = 定义一个新类型，建议命名为单数，而不是复数（例如 `CompassPoint` 和 `Planet`），并以答谢字母开头



- 类型不确定时，要写枚举类型名：

```swift
var directionToHead = CompassPoint.west
```

- 类型确定时 / 可以被推断出来时，可用点语法（省略枚举类型名）：

```swift
directionToHead = .east
```

## 使用 Switch 语句匹配枚举值

- 匹配每个 case

```swift
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
// 打印“Watch out for penguins”
```

- `switch` 语句，要么覆盖所有 case ，要么使用default:

```swift
let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}
// 打印“Mostly harmless”
```

## 枚举成员的遍历

- 必须遵循 `CaseIterable` 协议，枚举类型，会生成一个 `allCases` 属性（一个包含枚举所有成员的集合，元素类型为枚举类型）：

  ```swift
  enum Beverage: CaseIterable {
      case coffee, tea, juice
  }
  let numberOfChoices = Beverage.allCases.count
  print("\(numberOfChoices) beverages available")
  // 打印“3 beverages available”
  ```

- 用 `for` 循环来遍历所有枚举成员

```swift
for beverage in Beverage.allCases {
    print(beverage)
}
// coffee
// tea
// juice
```

## 关联值 - （外部赋值）

- 关联值枚举成员，存储额外信息（可以是任意类型）

> 关联值 跟其他语言中的可识别联合（discriminated unions），标签联合（tagged unions），或者变体（variants）相似

- 条形码种类
  - UPC 格：`0` 到 `9` 的数字
  - QR 码格式的二维码：任何 ISO 8859-1 字符，并且编码最长有 2953 个字符的字符串

![img](https://docs.swift.org/swift-book/_images/barcode_UPC_2x.png)

![img](https://docs.swift.org/swift-book/_images/barcode_QR_2x.png)

```swift
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
```

- 创建条形码

```swift
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
// 关联的元组值为 (8, 85909, 51226, 3)
```

- 同一个商品，可以被分配一个不同类型的条形码，例如：

```swift
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
```

- 只能存储一个，旧值会被新值覆盖



- 用常量或变量赋值提取关联值

```swift
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
// 打印“QR code: ABCDEFGHIJKLMNOP.”
```

- 提取所有关联值，简洁写法

```swift
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}
// 打印“QR code: ABCDEFGHIJKLMNOP.”
```

## 原始值 - Raw Values - (内部赋值)

- 相当于 C 和 OC 的默认值
- 作为关联值的另一种选择，可以使用原始值
- 每个枚举成员的默认值，类型必须相同（定义时，必须继承某一种数据类型）



- 枚举成员一起存储的原始 ASCII 码

```swift
// 原始值被定义为类型 Character
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
```

> 与关联值的区别：
>
> 原始值内部赋值一次，不会改变。关联值，外部随时赋值，随时改变

### 原始值的隐式赋值 - 自动默认值

- 原始值为整型 / 字符串类型 ，Swift自动分配默认的原始值



- 【整型】原始值：隐式赋值为依次递增 `1`。（第一个枚举成员没有被手动赋值，原始值将为 `0`。）

- 利用整型的原始值来表示每个行星在太阳系中的顺序

```swift
// 整型原始值, 如果不手动设置,第一个默认为0, 后面一次递增1
enum Planet: Int, CaseIterable {
    case mercury = 1,  venus, earth, mars, jupiter, saturn, uranus, neptune
}

for planetNum in Planet.allCases {
    print("planetNum = \(planetNum.rawValue)")
    print("--------------------")
}
```



- 【字符串类型】原始值：隐式原始值 = 枚举成员名称

```swift
enum CompassPoint: String, CaseIterable {
    case north, south, east, west
}

for point in CompassPoint.allCases {
    print("point = \(point.rawValue)")
    print("--------------------")
}
```

- 访问原始值：使用枚举成员的 `rawValue` 属性

### 使用原始值初始化枚举实例 - 外部赋值

- 用原始值类型来定义一个枚举，枚举自动获得一个初始化方法
- 原始值初始化器：接收一个 `rawValue` 的参数，类型即为原始值类型，返回值为枚举成员或 `nil`。



- 用原始值 `7` 创建了枚举成员 `Uranus`

```swift
let possiblePlanet = Planet(rawValue: 7)
// possiblePlanet 类型为 Planet? 值为 Planet.uranus
```

- 不一定创建成功，上面的例子中，`possiblePlanet` 是 `Planet?` 类型，或者说“可选的 `Planet`”。

> 原始值构造器是一个可失败构造器，因为并不是每一个原始值都有与之对应的枚举成员。更多信息请参见 [可失败构造器]()。

- 试图寻找一个位置为 `11` 的行星，通过原始值构造器返回的可选 `Planet` 值将是 `nil`：

```swift
let positionToFind = 11
if let somePlanet = Planet(rawValue: positionToFind) { // 可选绑定（optional binding）
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}
// 打印“There isn't a planet at position 11”
```

## 递归枚举 

- 关联值类型为自身
- 例子：定义枚举类型，可以存储三种算术表达式，纯数字、两个表达式相加、两个表达式相乘
- 编译器操作递归枚举时，必须插入间接寻址层
  - 部分需要使用递归的枚举成员：前面加上 `indirect`关键字
  - 所有成员使用递归：在枚举类型开头加上 `indirect` 关键字

```swift
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
```

- 枚举类型开头加上关键字 `indirect` = 所有成员可递归

```swift
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
```

- 创建表达式 `(5 + 4) * 2`

```swift
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
```

- 对算术表达式求值的函数：

```swift
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
print(evaluate(product))
// 打印“18”
```

# 类和结构体

- Swift创建类和结构体时，不需要将声明文件和实现文件分开

> 一个*类*的实例通常被称为*对象。*

## 结构体和类对比

- 共同点
  - 都有 存储属性
  - 都有函数 / 方法
  - 都有 下标语法
  - 都有 构造器 / 初始化器
  - 都有 拓展 
  - 都有 协议
- 不同点-类多出的功能：
  - 类允许继承，结构体不可继承
  - 类创建的实例，可以在运行时检查、推断类型，结构体只在编译时检查
  - 类有析构器 / 反初始化器，结构体没有
  - 类有引用计数，结构体没有

- 类比结构体的功能多，也更复杂，建议优先使用结构体
- 意味着你的大多数自定义数据类型都会是结构体和枚举。更多详细的比较参见 [在结构和类之间进行选择](https://developer.apple.com/documentation/swift/choosing_between_structures_and_classes)。

### 类型定义的语法

- 类与结构体有相似定义语法
  - 使用关键词 class来定义类
  - 使用struct来定义结构体

```swift
struct SomeStructure {
    // 在这里定义结构体
}
class SomeClass {
    // 在这里定义类
}
```

> 定义了一个新的类或者结构体：用UpperCamelCase 命名法命名 (比如这里我们说到的 SomeClass和 SomeStructure)以符合 Swift 的字母大写风格（比如说 String ， Int 以及 Bool）
>
> 属性和方法使用lowerCamelCase命名法[[1\]](https://www.cnswift.org/classes-and-structures#spl-12) (比如 frameRate 和 incrementCount)，以此来区别于类型名称

> CamelCase names ：在给储存器或者函数命名时我们习惯上把多个有意义的单词以开头大写的形式拼接在一起组成一个单一的长单词。这种方法被称为“*驼峰式命名法*”，又分为开头大写和开头小写两种。比如说 SomeClass 、 frameRate `等。`

- 例子

```swift
struct Resolution {
    var width = 0
    var height = 0
  // 两个属性被初始化为整数 0 的时候，它们会被推断为 Int 类型
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
  //  name 是一个可选类型，它会被自动赋予一个默认值 nil，意为“没有 name 值”
}
```

### 结构体和类的实例

- 创建结构体和类实例，语法相似

```swift
let someResolution = Resolution()
let someVideoMode = VideoMode()
```

- 构造器语法
  - 类型名称后跟随一对空括号
  - 属性均会被初始化为默认值

### 属性访问

- 点语法：实例名后面紧跟属性名，两者以点号（`.`）分隔，不带空格

```swift
print("The width of someResolution is \(someResolution.width)")
// 打印 "The width of someResolution is 0"
```

- 访问子属性，如 `VideoMode` 中 `resolution` 属性的 `width` 属性

```swift
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
// 打印 "The width of someVideoMode is 0"
```

- 使用点语法为可变属性赋值：

```swift
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// 打印 "The width of someVideoMode is now 1280"
```

### 结构体类型的成员 初始化器 / 构造器

- Swift的结构体，会自动生成一个成员初始化器
- 新创建实例的初始化值，通过属性名称传递到成员初始化器中

```swift
let vga = Resolution(width: 640, height: 480)
```

## 结构体和枚举是值类型

- 值类型：赋值给变量、常量、传递给函数时，值只会被拷贝
- 所有的基本类型（底层也是使用结构体实现的）：
  - 整数（integer）
  - 浮点数（floating-point number）
  - 布尔值（boolean）
  - 字符串（string)
  - 数组（array）
  - 字典（dictionary）
- 枚举也是值类型
- 实例中值类型的属性，代码传递时，都会被复制

> - Copy On Write技术
>   - Swift对系统自带的集合类型，进行了优化，新集合不会立即复制，跟原集合共享同一份内存。
>
>   - 只有集合的副本要被修改时，才会复制原集合的元素



- 例子

```swift
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
```

- 因为 `Resolution` 是结构体，所以会创建一个现有实例的副本，然后将副本赋值给 `cinema` 。
- 修改为稍微宽一点的 2K 标准：

```swift
cinema.width = 2048
print("cinema is now  \(cinema.width) pixels wide")
// 打印 "cinema is now 2048 pixels wide"
```

- 初始的 `hd` 实例中 `width` 属性还是 `1920`：

```swift
print("hd is still \(hd.width) pixels wide")
// 打印 "hd is still 1920 pixels wide"
```

![img](https://docs.swift.org/swift-book/_images/sharedStateStruct_2x.png)



- 枚举也遵循相同的行为准则

## 类是引用类型

- 引用类型：赋值到一个常量，变量或者本身被传递到一个函数时，只引用，不拷贝

- 使用了之前定义的 `VideoMode` 类：

```swift
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
```

- 将 `tenEighty` 赋值给一个名为 `alsoTenEighty` 的新常量，并修改 `alsoTenEighty` 的帧率：

```swift
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
```

- 类是引用类型，所以 `tenEight` 和 `alsoTenEight` 实际上引用的是同一个 `VideoMode` 实例。换句话说，它们是同一个实例的两种叫法

![img](https://docs.swift.org/swift-book/_images/sharedStateClass_2x.png)

- 两个实例虽然都是常量，但不存储 `VideoMode` 实例，只存储它的引用 / 指针，改变的是实例的属性，属性是变量

### 恒等运算符

- 恒等预算符：判断两 **类创建的实例** 是否是引用同一个
  - 相同（`===`）// Identical to
  - 不相同（`!==`）// Not identical to

```swift
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// 打印 "tenEighty and alsoTenEighty refer to the same VideoMode instance."
```

- 判断引用类型：指针地址是否相等，用 **===**
- 判断值类型：数值是否相等，用 **==**



- 在章节 **等价操作符** 中将会详细介绍实现自定义 == 和 != 运算符的流程

### 指针

- 和 C，C++ 或者 Objective-C 语言不同，Swift指针不使用星号（`*`），跟普通常量、变量一样即可
- 需要操作指针，用标准库提供的指针和缓冲区类型 —— 参见章节 **手动管理内存**

## 类和结构体之间的选择

- 结构体-使用场景：
  - 只封装简单数据
  - 传递数据时，只需要数据值，而不是引用
  - 数据的属性也是值类型，值需要拷贝，不需要引用
  - 不需要继承
- 结构体-使用例子：
  - 几何形状大小，width属性和 height属性，两者都为 double类
  - 路径，封装了一个 start属性和 length属性，两者为 Int类型
  - 三维坐标系，封装了 x , y 和 z属性，他们都是 double类型

## 字符串，数组和字典的赋值与拷贝行为

- 基础库中的 NSString, NSArray和 NSDictionary，实例引用
- Swift 的 String , Array 和 Dictionary类型是作为结构体来实现，传递拷贝

# 属性 - Properties



## 存储属性 - Stored Properties

- 相当于 OC 的下划线成员变量

- 适用于：结构体 、 类
- 类型：常量 、变量
- 可以有 默认值（参考 默认构造器 一节）
- 构造 / 初始化 时，修改 存储属性，可修改常量存储属性（参考 构造过程中常量属性的修改 一节）



- 存储属性必须初始化：
  - 初始化器赋初值
  - 直接赋默认值

- 结构体使用 存储属性

```swift
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// 该区间表示整数 0，1，2
rangeOfThreeItems.firstValue = 6
// 该区间现在表示整数 6，7，8
```

- `length` 在创建实例的时候被初始化，且之后无法修改它的值，因为它是一个常量存储属性

### 常量结构体实例的存储属性

- 因结构体为值类型，声明为常量的结构体实例，无法修改属性（即使声明的是变量属性）(引用类型，可以修改)

```swift
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// 该区间表示整数 0，1，2
rangeOfThreeItems.firstValue = 6
// 该区间现在表示整数 6，7，8
```

### 延时加载/延迟/懒加载 存储属性

- 场景：将耗时加载的数据，延时加载

- 使用时，才会调用初始化方法 init()
- 声明前标注lazy 修饰语来表示一个延迟存储属性

> lazy修饰的属性，必须为变量。
>
> 
>
> 因为常量属性，必须在实例初始化完成之前有初始值。

```swift
class DataImporter {
    /*
    DataImporter 是一个负责将外部文件中的数据导入的类。
    这个类的初始化会消耗不少时间。
    */
    var fileName = "data.txt"
    // 这里会提供数据导入功能
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // 这里会提供数据管理功能
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// DataImporter 实例的 importer 属性还没有被创建
```

> lazy 属性没初始化，被多个线程访问，可能会初始化多次

### 存储属性和实例变量

- OC
  - 读写：setter + getter 方法
  - 实例变量：备份存储
- Swift
  - 计算属性

## 计算属性 - Computed Properties

- 场景：不能直接赋值，要计算得出
- 定义时：不写 = ，直接写大括号
- 相当于 OC 的 property 属性
- 适用：类、结构体、枚举（枚举的 rawValue 本质：只读计算属性）
- 不存储值，只提供一个 getter 和一个可选的 setter

```swift
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
    size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// 打印“square.origin is now at (10.0, 10.0)”	
```

![img](https://docs.swift.org/swift-book/_images/computedProperties_2x.png)

### 简化 Setter 声明

- 默认参数名：newValue (getter 方法没有参数，只返回)
- 上面代码的 setter 简化写法

```swift
set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
```

### 简化 Getter 声明

- 单一表达式，可隐式返回

```swift
get {
            Point(x: origin.x + (size.width / 2), y: origin.y + (size.height / 2))
        }
```

### 只读计算属性

- 只有 getter 没有 setter 的计算属性
- 总是返回一个值，可以通过点运算符访问，不能设置新的值

> 必须使用 `var` 关键字定义计算属性，包括只读计算属性，因为它们的值不是固定的。
>
> `let` 关键字只用来声明常量属性，表示初始化后再也无法修改的值。

- 写法：
  - 去掉 set
  - 去掉get，return 即可（可隐式返回）

- 结构体，表示三维空间的立方体，包含 `width`、`height` 和 `depth` 属性。结构体还有一个名为 `volume` 的只读计算属性用来返回立方体的体积。

  ```swift
  struct Cuboid {
      var width = 0.0, height = 0.0, depth = 0.0
      var volume: Double {
          return width * height * depth
      }
  }
  let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
  // fourByFiveByTwo.volume = 10 
  // Cannot assign to property: 'volume' is a get-only property
  print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
  // 打印“the volume of fourByFiveByTwo is 40.0”
  ```

## 属性观察器 / 观察者

- 给属性赋值时，都会调用属性观察器（新值和当前值相同的时候也不例外）
- 适用：
  - 存储属性（自定义 + 继承）（子类重写父类属性，添加属性观察器）
  - 计算属性（继承）（自定义建议适用 setter，不建议使用属性观察器）
- 两种观察器：
  - willSet 设置新值之前调用
  - didSet 设置新值之后调用
- 方法的 **形式参数**默认值（常量，可重新命名）
  - willSet - newValue
  - didSet - oldValue
  - 在 didSet 观察器，给属性赋新值，新值会覆盖刚赋的值

> - 属性定义（设置默认值）时，也不会触发属性观察器
> - 初始化器赋值，不会触发（自己）属性观察器（可以触发父类的）
>   - 父类属性的 willSet 和 didSet ，会**在子类初始化器**中设置父类属性时被调用
>   - 父类初始化方法调用之前，给子类的属性赋值时不会调用子类属性的观察器

```swift
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("将 totalSteps 的值设置为 \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("增加了 \(totalSteps - oldValue) 步")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// 将 totalSteps 的值设置为 200
// 增加了 200 步
stepCounter.totalSteps = 360
// 将 totalSteps 的值设置为 360
// 增加了 160 步
stepCounter.totalSteps = 896
// 将 totalSteps 的值设置为 896
// 增加了 536 步
```

> 给函数inout参数传参时，会触发属性观察器
>
> - 普通实参：没有设置属性观察器 、非计算属性
>   - 直接将 实参内存地址传入函数（引用传递）
>
> - 设置了属性观察器 / 计算属性 （采用了copy in copy out - 拷入拷出的内存模式）
>   - 传参时，复制实参的值，产生副本【get】
>   - 将副本内存地址传入函数（副本进行引用传递），函数内部修改副本的值
>   - 函数结束 / 返回，将副本的值覆盖实参的值【set】
>
> ```swift
> func test(age:inout Int, name:inout String) -> Void {
>     age = 111;
>     name = "111"
> }
> 
> test(age: &s.age, name: &s.name)
> ```

## 属性包装 / 包裹 器

- 场景：利用结构体 + @propertyWrapper + wrapperValue（var wrapper: Int）+ @structName（@TwelveOrLess var height：Int），**封装**属性的 setter + getter 方法

- 通过使用 `wrappedValue` 的 getter 和 setter 来获取这个值，但不能直接使用 `number`

```swift
struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)
// 打印 "0"

rectangle.height = 10
print(rectangle.height)
// 打印 "10"

rectangle.height = 24
print(rectangle.height)
// 打印 "12"	
```

- `height` 和 `width` 属性从 `TwelveOrLess` 的定义中获取它们的初始值。该定义把 `TwelveOrLess.number` 设置为 0
- 存储 24 的操作实际上存储的值为 12，这是因为对于这个属性的 setter 的规则来说，24 太大了。

- 不使用 包装属性 语法, 是下面的代码

```swift
struct SmallRectangle {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get { return _height.wrappedValue }
        set { _height.wrappedValue = newValue }
    }
    var width: Int {
        get { return _width.wrappedValue }
        set { _width.wrappedValue = newValue }
    }
}
```

### 设置被包装属性的初始值

- 上述方法弊端：无法在定义时，给属性赋初值 + 其他自定义操作
- 增加构造器

```swift
@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }

    init() {
        maximum = 12
        number = 0
    }
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}
```

- `SmallNumber` 的定义包括三个构造器——`init()`、`init(wrappedValue:)` 和 `init(wrappedValue:maximum:)`——下面的示例使用这三个构造器来设置被包装值和最大值。

- 使用 `init()` 构造器来设置包装器。

```swift
struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width)
// 打印 "0 0"
```

- 构造器内部的代码使用默认值 0 和 12 设置初始的被包装值和初始的最大值



- 使用 `init(wrappedValue:)` 构造器来设置包装器

```swift
struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}

var unitRectangle = UnitRectangle()
print(unitRectangle.height, unitRectangle.width)
// 打印 "1 1"
```



- Swift 使用 `init(wrappedValue:maximum:)` 构造器

```swift
struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}

var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)
// 打印 "2 3"

narrowRectangle.height = 100
narrowRectangle.width = 100
print(narrowRectangle.height, narrowRectangle.width)
// 打印 "5 4"
```



- 使用赋值来指定初始值

```swift
struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 2
}

var mixedRectangle = MixedRectangle()
print(mixedRectangle.height)
// 打印 "1"

mixedRectangle.height = 20
print(mixedRectangle.height)
// 打印 "12"
```

### 从属性包装器中呈现一个值 / 通过属性包装映射值

- 给 SmallNumber 结构体添加了 projectedValue 属性，以追踪属性包装是否在保存新值之前调整了新值的大小

```swift
@propertyWrapper
struct SmallNumber {
    private var number: Int
    var projectedValue: Bool
    init() {
        self.number = 0
        self.projectedValue = false
    }
    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
}
struct SomeStructure {
    @SmallNumber var someNumber: Int
}
var someStructure = SomeStructure()

someStructure.someNumber = 4
print(someStructure.$someNumber)
// 打印 "false"

someStructure.someNumber = 55
print(someStructure.$someNumber)
// 打印 "true"
```

- 使用 s.$someNumber 来访问包装的映射值。在保存一个小数字比如四之后，s.$someNumber 的值是 false 。总之，在尝试保存一个过大的数字时映射的值就是true 了，比如 55.

```swift
enum Size {
    case small, large
}

struct SizedRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int

    mutating func resize(to size: Size) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width
    }
}	
```

- 在 resize(to:) 结尾，返回语句检查$height 和 $width 来决定属性包装是否调整了 height 或 width 。

## 全局变量和局部变量

- 计算属性 + 观察属性 适用 *全局变量*和*局部变量*

- 全局变量： 定义在任何函数、方法、闭包或者类型环境 外包的变量
- 局部变量：定义在函数、方法或者闭包环境 内部的变量

- 存储型变量：跟存储属性类似（前面章节提到的全局变量 + 局部变量 都是存储变量）
- 计算型变量：跟计算属性类似，与计算属性的写法一致，返回变量计算，而不是存储值

> 全局的常量或变量都是延迟计算的，跟 延时加载存储属性 相似，不同的地方在于，全局的常量或变量不需要标记 lazy 修饰符。
>
> 局部范围的常量和变量从不延迟计算。

## 类型属性

- 属性分类
  - 实例属性：实例之间的属性相互独立
  - 类型属性：只有唯一一份（静态常量 / 静态变量）
    - 存储型类型属性：可以是变量或常量
    - 计算型类型属性：只能是变量

> - 跟实例的存储型属性不同，必须给存储型类型属性一个默认值
>   - 类型本身没有构造器
>   - 也无法初始化过程中使用构造器给类型属性赋值
> - 存储型类型属性会延迟初始化
>   - 只有在第一次被访问的时候才会被初始化
>   - 被多个线程同时访问，系统也保证只会对其进行一次初始化
>   - 不需要使用 `lazy` 修饰符

### 类型属性语法

- 在 C 或 Objective-C 中
  - 静态常量和静态变量，是作为 *global*（全局）静态变量定义的

- 在 Swift 中
  - 写在类型最外层的花括号内
  - 作用范围也就在类型支持的范围内
- 使用关键字 `static` 来定义类型属性
  - 定义计算型类型属性时，可以改用关键字 `class` 来支持子类对父类的实现进行重写

```swift
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
```

> - 例子中的计算型类型属性是只读的
>
> - 也可以定义可读可写的计算型类型属性，跟计算型实例属性的语法相同。

### 获取和设置类型属性的值

- 跟实例属性一样，类型属性也是通过点运算 / 点语法 符来访问
- 类型属性是通过*类型*本身来访问，而不是通过实例

```swift
print(SomeStructure.storedTypeProperty)
// 打印“Some value.”
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
// 打印“Another value.”
print(SomeEnumeration.computedTypeProperty)
// 打印“6”
print(SomeClass.computedTypeProperty)
// 打印“27”
```

- 下图展示了如何把两个声道结合来模拟立体声的音量。当声道的音量是 `0`，没有一个灯会亮；当声道的音量是 `10`，所有灯点亮。本图中，左声道的音量是 `9`，右声道的音量是 `7`

![img](https://docs.swift.org/swift-book/_images/staticPropertiesVUMeter_2x.png)

- 上面所描述的声道模型使用 `AudioChannel` 结构体的实例来表示：

```swift
struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // 将当前音量限制在阈值之内
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // 存储当前音量作为新的最大输入音量
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}
```

- 最大上限阈值，它是一个值为 `10` 的常量，对所有实例都可见
- 变量存储型属性 `maxInputLevelForAllChannels`，它用来表示所有 `AudioChannel` 实例的最大输入音量，初始值是 `0`。
- 定义了一个名为 `currentLevel` 的存储型实例属性
  - 包含 `didSet` 属性观察器来检查每次设置后的属性值

> 在第一个检查过程中，`didSet` 属性观察器将 `currentLevel` 设置成了不同的值，但这不会造成属性观察器被再次调用

- 使用

```swift
var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
```

- 将左声道的 `currentLevel` 设置成 `7`，类型属性 `maxInputLevelForAllChannels` 也会更新成 `7`：

```swift
leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
// 输出“7”
print(AudioChannel.maxInputLevelForAllChannels)
// 输出“7”
```

- 右声道的 `currentLevel` 设置成 `11`，它会被修正到最大值 `10`，同时 `maxInputLevelForAllChannels` 的值也会更新到 `10`

```swift
rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
// 输出“10”
print(AudioChannel.maxInputLevelForAllChannels)
// 输出“10”
```

# 方法 - Methods

- 方法 = 函数 + 类型
- OC 能定义方法的类型：类

- Swift 能定义方法的类型：类、结构体、枚举
- 方法的种类
  - 实例方法：
  - 类型方法：

## 实例方法（Instance Methods）

- 调用者：类实例、结构体实例、枚举实例
- 实例方法内部，可隐式调用 该类下其他属性 + 实例方法

```swift
 class Counter {
    var count = 0 // 保持对当前计数器值的追踪
    func increment() { // 让计数器按一递增；
        count += 1
    }
    func increment(by amount: Int) { // 让计数器按一个指定的整数值递增；
        count += amount
    }
    func reset() { // 将计数器重置为0。
        count = 0
    }
}	
```

- 用点语法（dot syntax）调用实例方法

```swift
let counter = Counter()
// 初始计数值是0
counter.increment()
// 计数值现在是1
counter.increment(by: 5)
// 计数值现在是6
counter.reset()
// 计数值现在是0
```

### self 属性

- 隐性属性 self，本质：self = （外部调用方法的）实例本身
- 上述方法，非隐式写法

```swift
func increment() {
    self.count += 1
}
```

- 一般建议不写 self



- （实例方法的）参数名 = （实例的）属性名
  - 优先级：参数名 > 属性名
  - 建议：使用 self 属性来区分

```swift
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}
// 打印“This point is to the right of the line where x == 1.0”
```

- 若不用 self， 默认是实例方法的参数 x 

### 在实例方法中修改值类型

- 值类型（结构体、枚举）的属性，无法在实例方法中被修改
- mutating 关键字
  - 修改值类型
  - 也可修改 self

```swift
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
// 打印“The point is now at (3.0, 4.0)”
```

- 注意，不能在结构体类型的常量（a constant of structure type）上调用可变方法，因为其属性不能被改变，即使属性是变量属性

```swift
let fixedPoint = Point(x: 3.0, y: 3.0)
fixedPoint.moveBy(x: 2.0, y: 3.0)
// 这里将会报告一个错误
```

### 在可变方法中给 self 赋值

```swift
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}
```

-  `moveBy(x:y:)` 创建了一个新的结构体实例，它的 x 和 y 的值都被设定为目标值。



- 枚举的可变方法可以把 `self` 设置为同一枚举类型中不同的成员：

```swift
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
// ovenLight 现在等于 .high
ovenLight.next()
// ovenLight 现在等于 .off
```

- 调用 `next()` 方法时，开关在不同的电源状态（`off`, `low`, `high`）之间循环切换

## 类型方法

- 在方法的 `func` 关键字前加上关键字 `static`，指定类型方法
- 用关键字 `class` 来指定，允许子类重写父类方法的实现

> OC 只能为 Objective-C 的类类型（classes）定义类型方法（type-level methods）。
>
> 
>
> 在 Swift 中，你可以为所有的类、结构体和枚举定义类型方法。

- 和实例方法一样用点语法调用

```swift
class SomeClass {
    class func someTypeMethod() {
        // 在这里实现类型方法
    }
}
SomeClass.someTypeMethod()
```

- 在类型方法中，`self` 属性 = 类型本身，而非实例
- 可用 self，处理类型属性和类型方法参数同名的问题

- 内部调用

  - 方法和属性，可被本类中其他的类型方法和类型属性引用。
  - 通过类型方法的名称调用本类中的其它类型方法（结构体和枚举亦然）

  

- 例子：每次有玩家完成一个等级，这个等级就对这个设备上的所有玩家解锁。`LevelTracker` 结构体用类型属性和方法监测游戏的哪个等级已经被解锁。它还监测每个玩家的当前等级

```swift
struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1 // 监测每个玩家当前的等级

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }

    static func isUnlocked(_ level: Int) -> Bool {// 给定的等级是否已经被解锁
        return level <= highestUnlockedLevel
    }

    @discardableResult // 可忽略该函数的返回值
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}
```

- 调用

```swift
class Player {
    var tracker = LevelTracker() 
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}
```

- 创建一个 `Player` 的实例

```swift
var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
// 打印“highest unlocked level is now 2”
```

- 创建了第二个玩家，开始一个没有被任何玩家解锁的等级，设置玩家当前等级将会失败：

```swift
player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}
// 打印“level 6 has not yet been unlocked”
```

# 下标

- 适用：类、结构体、枚举
- 场景：读写 集合、列表、序列 中的元素（比调用方法便捷）
- someArray[index]、someDictionary[key]
- 不同数据类型的索引，构成重载
- 不限于一维，可以是多维

## 下标语法

- 似于实例方法语法和计算型属性语法
- 定义：
  - 使用 `subscript` 关键字，与定义实例方法类似
  - 一个或多个参数 + 一个返回类型
  - 与实例方法不同，可读写、或只读
  - 由 getter 和 setter 实现，类似计算型属性：

```swift
subscript(index: Int) -> Int {
    get {
      // 返回一个适当的 Int 类型的值
    }
    set(newValue) {
      // 执行适当的赋值操作
    }
}
```

- 不指定  setter 的参数，setter 提供 newValue 的默认参数

- 只读下标简写：类似于只读计算型属性，可省略 get 关键字

```swift
subscript(index: Int) -> Int {
    // 返回一个适当的 Int 类型的值
}
```

- eg.只读下标，定义一个整数 3 乘法表的结构体

```swift
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int { // 只读下标
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")
// 打印“six times three is 18”
```

## 下标用法

- 通过下标将 `String` 类型的键 `bird` 和 `Int` 类型的值 `2` 添加到字典中

```swift
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2
```

>  Swift 的 `Dictionary` 类型的下标接受并返回*可选*类型的值
>
> 因为不是每个键都有对应的值，同时这也提供了一种通过键删除对应值的方式，只需将键对应的值赋值为 `nil` 即可

## 下标选项

- 下标的本质是函数：可以多个参数，参数可任意的类型，返回值可任意类型
- 参数可为可变参数、默认参数，但不能是 inout 参数
- 一个 `Double` 类型的二维矩阵结构体

```swift
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
```

```swift
var matrix = Matrix(rows: 2, columns: 2)
```

- 该 `Matrix` 实例的 `grid` 数组按照从左上到右下的阅读顺序将矩阵扁平化存储：

<img src="https://docs.swift.org/swift-book/_images/subscriptMatrix01_2x.png" alt="img" style="zoom: 67%;" />

- 下标的多个参数，使用逗号分隔：

```swift
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
```

![img](https://docs.swift.org/swift-book/_images/subscriptMatrix02_2x.png)

- 断言在下标越界时触发：

```swift
let someValue = matrix[2, 2]
// 断言将会触发，因为 [2, 2] 已经超过了 matrix 的范围
```

## 类型下标

- 定义和调用一个类型下标：

```swift
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)
```

# 继承 - Inheritance

- 区分【类】和其他类型的一个特征：继承
- 子类 继承 超类（父类）的属性、方法和下标。
  - 可调用、重写父类的方法、属性和下标
  - 为父类添加属性观察器（存储属性和计算属性都可以）

## 定义一个基类
- 基类：不继承其他类

> 与 OC 相比，Swift 类不默认继承基类
>
> 没有指定父类，都是基类

```swift
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // 什么也不做——因为车辆不一定会有噪音
    }
}
```

```swift
let someVehicle = Vehicle()
```

- 访问它的 `description` 属性来打印车辆的当前速度：

```
print("Vehicle: \(someVehicle.description)")
// 打印“Vehicle: traveling at 0.0 miles per hour”
```

## 子类生成

- 指明某个类的超类，将超类名写在子类名的后面，用冒号分隔：

```swift
class SomeClass: SomeSuperclass {
    // 这里是子类的定义
}
```

```swift
class Bicycle: Vehicle {
    var hasBasket = false
}
```

```swift
let bicycle = Bicycle()
bicycle.hasBasket = true
```

- 修改继承的 `currentSpeed` 属性

```swift
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")
// 打印“Bicycle: traveling at 15.0 miles per hour”
```

- 创建了一个名为 `Tandem`（双人自行车）的子类

```swift
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}
```

```swift
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")
// 打印：“Tandem: traveling at 22.0 miles per hour”
```

## 重写

- 重写：子类可以为继承来的实例方法，类方法，实例属性，类属性，或下标提供自己定制的实现

- 重写（非继承）定义前面加上 override 关键字（不写关键字会报错）
- override 会查找父类是否有重写的属性、方法等

### 访问超类的方法，属性及下标

- 重写时，可多调用父类方法实现
- 使用 `super` 前缀来访问超类版本的方法，属性或下标：
  - 方法重写：通过 `super.someMethod()` 来调用超类版本的 `someMethod()` 方法
  - 属性的 getter 、setter 的重写： `super.someProperty` 来访问超类 `someProperty` 属性
  - 下标重写：通过 `super[someIndex]` 来访问超类版本中的相同下标

### 重写方法

- 可重写方法类型：实例方法、类型方法

```swift
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}
```

```swift
let train = Train()
train.makeNoise()
// 打印“Choo Choo”
```

### 重写属性

- 可重写的属性类型：存储属性、计算属性
- 重写属性-应用场景：
  - 自定义 getter + setter 方法实现
  - 添加属性观察器

#### 重写属性的 Getters 和 Setters

- 重写声明：属性名 + 类型
- 只读属性 **可**重写为 读写属性（同时提供 getter + setter 即可）
- 读写属性 **不可**重写为 只读属性

> 重写属性的增加 setter，也必须 提供 getter方法
>
> 不想改变父类getter，可通过 `super.someProperty` 来返回继承来的值

```swift
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}
```

```swift
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")
// 打印“Car: traveling at 25.0 miles per hour in gear 3”
```

#### 重写属性观察器

> - 无法添加属性观察器：
>   - 常量 的存储属性（常量无法修改）
>   - 只读计算属性 （只读不能写入）
> - 不可同时提供 setter + 属性观察器 （只需在 setter 内部监听即可）

```swift
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
```

- 属性观察器将新的速度值除以 `10`，然后向下取得最接近的整数值，最后加 `1` 来得到档位 `gear` 的值。例如，速度为 `35.0` 时，档位为 `4`：

```swift
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
// 打印“AutomaticCar: traveling at 35.0 miles per hour in gear 4”
```

## 防止重写

- 防重写，但可继承
  - 在声明关键字前加上 `final` 修饰符
  - 例如：`final var`、`final func`、`final class func` 以及 `final subscript`
- 类拓展也可使用 final 标记
- 防止继承
  - 在关键字 `class` 前添加 `final` 修饰符（`final class`）来将整个类标记为 final 

# 构造 / 初始化过程 - Initialization

- 与 Objective -C 不同，Swift 的构造器没有返回值（特殊情况，可失败构造器返回 nil）。

## 存储属性的初始赋值

> 初始化器内部，修改存储属性默认值，不会触发属性监听器

### 构造器 / 初始化器

- 最简形式

```swift
init() {
    // 在此处执行构造过程
}
```

- 保存华氏温度的结构体 `Fahrenheit`，它拥有一个 `Double` 类型的存储型属性 `temperature`：

```swift
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")
// 打印“The default temperature is 32.0° Fahrenheit”
```

- 定义了一个不带形参的构造器 `init`，并在里面将存储型属性 `temperature` 的值初始化为 `32.0`（华氏温度下水的冰点）。

### 默认属性值

- 在属性声明时为 `temperature` 提供默认值

```swift
struct Fahrenheit {
    var temperature = 32.0
}
```

## 自定义构造过程

### 形参的构造过程

- 跟函数和方法的形参相同

```swift
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius 是 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius 是 0.0
```

- 转换成摄氏温度值

### 形参命名和实参标签

```swift
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}
```

```swift
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
```

```swift
let veryGreen = Color(0.0, 1.0, 0.0)
// 报编译期错误-需要实参标签
```

### 不带实参标签的构造器形参

- 使用下划线（`_`）来代替显式的实参标签来重写默认行为

```swift
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double){
        temperatureInCelsius = celsius
    }
}

let bodyTemperature = Celsius(37.0)
// bodyTemperature.temperatureInCelsius 为 37.0
```

### 可选属性类型

- 可选类型的属性将自动初始化为 `nil`，表示这个属性是特意在构造过程设置为空

```swift
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
// 打印“Do you like cheese?”
cheeseQuestion.response = "Yes, I do like cheese."
```

- 调查问题的答案在询问前是无法确定的，因此我们将属性 `response` 声明为 `String?` 类型

### 构造过程中常量属性的赋值

- 初始化方法内部，可给常量赋值，一旦赋值，将不可更

> 类的实例，常量属性只能在类的构造过程中修改；
>
> 常量属性，不能在子类中修改。

- 用常量属性替代变量属性 `text`，表示创建之后不会再被修改

```swift
class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestion(text: "How about beets?")
beetsQuestion.ask()
// 打印“How about beets?”
beetsQuestion.response = "I also like beets. (But not with cheese.)"
```

## （自动生成）默认构造器

- 适用：结构体、类

- 前提条件
  - 为所有属性有默认值
  - 没有自定义一个构造器

```swift
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()
```

### 结构体类型的成员初始化器

- 适用：结构体
- 跟默认初始化器区别
  - 属性无需有默认值
  - 生成的初始化方法，可传参，然后传入默认值
  - 可省略拥有默认值的属性

```swift
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)
```

```swift
let zeroByTwo = Size(height: 2.0)
print(zeroByTwo.width, zeroByTwo.height)
// 打印 "0.0 2.0"

let zeroByZero = Size()
print(zeroByZero.width, zeroByZero.height)
// 打印 "0.0 0.0"
```

## 值类型的构造器代理

- 构造器代理：初始化器调用其他初始化器
- 值类型构造器
  - 不支持继承
  - 用 `self.init` 在自定义构造器中引用其它构造器（内部）
  - 对于值类型，自定义构造器，默认构造器失效
    - 解决：使用扩展（`extension`）自定义构造器

```swift
struct Size {
    var width = 0.0, height = 0.0
}


struct Point {
    var x = 0.0, y = 0.0
}
```

- 三种方式提供了三个自定义的构造器：

```swift
struct Rect {
    var origin = Point()
    var size = Size()
    init() {}

    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }

    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}	
```

```swift
let basicRect = Rect()
// basicRect 的 origin 是 (0.0, 0.0)，size 是 (0.0, 0.0)
```

```swift
let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
    size: Size(width: 5.0, height: 5.0))
// originRect 的 origin 是 (2.0, 2.0)，size 是 (5.0, 5.0)
```

- 先通过 `center` 和 `size` 的值计算出 `origin` 的坐标，然后再调用（或者说代理给）`init(origin:size:)` 构造器来将新的 `origin` 和 `size` 值赋值到对应的属性中

```swift
let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
    size: Size(width: 5.0, height: 5.0))
// originRect 的 origin 是 (2.0, 2.0)，size 是 (5.0, 5.0)
```

## 类的继承和构造过程

- 类的存储属性（包括继承父类的），在初始化时，必须有默认值
- 保证存储属性有初始值的两构造器：
  - 指定构造器 - designated initializers
  - 便利构造器 - convenience initializers

### 指定构造器和便利构造器

- 指定初始化器（主要）
  - 一个类至少有一个（继承父类也算）
  - 像漏斗，连接父和子类的链条
- 便捷初始化器（可选）
  - 可有可无
  - 可调用指定初始化器

### 指定构造器和便利构造器的语法

- 指定初始化器：与值类型的一致

```swift
init(parameters) {
    statements
}
```

- 便捷初始化器：多了一个 `convenience` 关键字

```swift
convenience init(parameters) {
    statements
}
```

### class 类型的构造器代理

- 构造器实现规则 - 指定和便利的调用关系
  - 规则1：**子类指定**必须调用（直接）**父类的指定**
  - 规则2：**便利**必须调用（同类）其它构造器。
  - 规则3：**便利**构造器**最后必须**调用**指定**（间接调用也行）
- 记忆口诀
  - **指定**必向上调用
  - **便利**必横向调用
- 图解-三规则：

<img src="https://www.logcg.com/wp-content/uploads/2015/08/initializerDelegation01_2x.png" alt="initializerDelegation01_2x" style="zoom:50%;" />

- 图示-父类为基类，规则 1 没用
- 两指定必须调用父类唯一（直接）指定，满足规则 1



> 3个规则，只影响构造器实现，不影响类的实例创建，上面任一构造器都可创建实例

- 4个类的例子：

<img src="https://www.logcg.com/wp-content/uploads/2015/08/initializerDelegation02_2x.png" alt="initializerDelegation02_2x" style="zoom: 50%;" />

### 两段式构造过程

- 类初始化两过程
  - 第一阶段（完成初始化）：存储属性全赋值
  - 第二阶段（自定义操作）：自定义 存储属性值

> OC 初始化多为0或 nil，Swift 初始化全赋初值

- 两段式的四种安全检查：【实例非空 = 非继承属性有值】【自定义值前，避免覆盖】
  - 安全检查 1：调用父类前，所有（非继承）属性必须赋值
  - 安全检查 2：自定义**继承属性**值前，先调用父类初始化器（避免被覆盖）
  - 安全检查3：便捷初始化器，先调用其他构造器，再自定义属性值（避免被覆盖）
  - 安全检查4：第一阶段完成前，不能调用实例方法、属性、self（实例为 nil）
- 两段式初始化 + 四种检查 详细流程：
  - 阶段1：
    - 调用（指定 / 便利）构造器
    - 完成实例的内存分配，但内存没被初始化（属性内存大小没确定）
    - 调用指定构造器，确保存储属性的内存完成初始化
    - 指定构造器，调用父类构造器，完成存储属性初始化
    - 继承链顶部，最后一类的存储实现已赋值，这个实例被认为完全初始化（阶段1完成）
  - 阶段2：（非必须）调用便利初始化器 = 自定义属性的初始化值
    - 自顶向下，继承链中的每个类，在自定义实例时，可访问 `self`、修改属性并调用实例方法等
    - 便利构造器可自定义实例和使用 `self`

- 阶段1

<img src="https://docs.swift.org/swift-book/_images/twoPhaseInitialization01_2x.png" alt="img" style="zoom: 50%;" />

- 阶段2：

<img src="https://docs.swift.org/swift-book/_images/twoPhaseInitialization02_2x.png" alt="img" style="zoom:50%;" />



### 构造器的继承和重写

- 与 OC 不同，Swift子类不继承父类构造器。（防止父类简单初始化器被子类继承后，无法完成初始化或被错误初始化）

> 特殊情况会继承。
>
> 参考后续章节 构造器的自动继承。

- 在子类可自定义与父类同名的指定初始化器（自动生成的父类初始化器，也可以重写）
  - 必须写 override 修饰符（检查父类是否有同名初始化器）

> 重写指定初始化器，必须写 override 修饰符，哪怕重写为 便捷初始化器

- 先写一个父类（Swift 自动创建默认（指定）构造器）

```swift
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}
```

```swift
let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")
// Vehicle: 0 wheel(s)
```

```swift
class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
```

- Bicycle 自定义指定构造器 `init()`，和父类指定构造器相匹配，所以要写 override 修饰符
- 若 没有自定义 numberOfWheels = 2  && 父类无参数 = 可省略 `super.init()` 的调用



- 隐式调用 super.init()（确保父类能完整初始化）

```swift
class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
        // super.init() 在这里被隐式调用
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}
```

> 继承来的属性，子类只能修改变量，不能修改常量

### 构造器的自动继承

- 默认情况，不继承父类构造器。
- 自动继承的前提： （记忆：属性全值；没指定，全指定；全指定，全便捷）
  - 子类所有新属性有默认值
    - 继承**所有**指定：
      - 没有自定义**指定**构造器（便利除外）
    - 继承**所有**便利：
      - 实现了父类所有指定（继承的 、自定义的实现）



- 综上，属性全值 + 不自定义 = 继承全部的 指定 + 便利

> 子类可以将父类的指定构造器实现为便利构造器来满足规则 2

### 指定构造器和便利构造器实践

- 定义三个类 `Food`、`RecipeIngredient` 以及 `ShoppingListItem` 

- `Food` 引入一 `name` 的 `String` 类型的属性，两个构造器创建 `Food` 实例

```swift
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }

    convenience init() {
        self.init(name: "[Unnamed]")
    }
}
```

-  Food 类初始化链

![img](https://docs.swift.org/swift-book/_images/initializersExample01_2x.png)

- class 没有逐一成员构造器，`Food` 类提供一个接受单一参数 `name` 的指定构造器

```swift
let namedMeat = Food(name: "Bacon")
// namedMeat 的名字是 "Bacon"
```

-  `init(name: String)` 确保 `Food` 所有存储属性有值 = 指定构造器
- `Food` 没父类 ，无需调用 `super.init()`



- `RecipeIngredient` 类用来表示食谱中的一项原料

```swift
class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}
```

- 图解`RecipeIngredient` 类的构造器链

<img src="https://docs.swift.org/swift-book/_images/initializersExample02_2x.png" alt="img" style="zoom:50%;" />

- 指定构造器 `init(name: String, quantity: Int)`，给`RecipeIngredient` 所有属性赋值

- 将父类同名的指定重写为了便利，`RecipeIngredient` 自动继承所有便利构造器 `init()`


```swift
let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
```

- 购物单中的每一项总是从未购买状态开始的

```swift
class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}
```

- 属性都有值 + 没定义构造器 = 继承父类 指定 + 便利 构造器

<img src="https://docs.swift.org/swift-book/_images/initializersExample03_2x.png" alt="img" style="zoom:50%;" />

- 使用三个继承来的构造器

```swift
var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}
// 1 x orange juice ✔
// 1 x bacon ✘
// 6 x eggs ✘
```

- 组的类型也能被自动推导为 `[ShoppingListItem]`。

## 可失败构造器

- 语法：在 `init` 后面添加问号（`init?`）
- 类型：为自身类型的可选类型的对象

> 禁止可失败和非可失败的初始化器为相同参数类型和名称

- 通过 `return nil` 语句来表明可失败

> - 严格来说，构造器都不支持返回值.
> - 可写 return nil 触发初始化失败，但不能用 return 关键字来表示初始化成功



- 针对数字类型转换的可失败构造器

```swift
let wholeNumber: Double = 12345.0
let pi = 3.14159

if let valueMaintained = Int(exactly: wholeNumber) {
    print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")
}
// 打印“12345.0 conversion to Int maintains value of 12345”

let valueChanged = Int(exactly: pi)
// valueChanged 是 Int? 类型，不是 Int 类型

if valueChanged == nil {
    print("\(pi) conversion to Int does not maintain value")
}
// 打印“3.14159 conversion to Int does not maintain value”
```

- 传入的`species` 值是否为一个空字符串。如果为空字符串，则构造失败。

```swift
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}
```

- 使用

```swift
let someCreature = Animal(species: "Giraffe")
// someCreature 的类型是 Animal? 而不是 Animal


if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}
// 打印“An animal was initialized with a species of Giraffe”
```

- 传入一个空字符串

```swift
let anonymousCreature = Animal(species: "")
// anonymousCreature 的类型是 Animal?, 而不是 Animal


if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}
// 打印“The anonymous creature could not be initialized”
```

> 空字符串（`""`）其实是一个有效的，非可选类型的字符串
>
> 让 `Animal` 的可失败构造器构造失败，它更适合有一个具体的值，而不是空字符串

### 枚举类型的可失败构造器

- 场景：获取枚举类型中特定的枚举成员

```swift
enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}
```

```swift
let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
// 打印“This is a defined temperature unit, so initialization succeeded.”

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}
// 打印“This is not a defined temperature unit, so initialization failed.”
```

### 带原始值的枚举类型的可失败构造器

- 带原始值的枚举类型：自带一个可失败构造器 `init?(rawValue:)`

```swift
enum TemperatureUnit: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}

let fahrenheitUnit = TemperatureUnit(rawValue: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
// 打印“This is a defined temperature unit, so initialization succeeded.”

let unknownUnit = TemperatureUnit(rawValue: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}
// 打印“This is not a defined temperature unit, so initialization failed.”
```

### 构造失败的传递

- 代理到的其他可失败构造器触发构造失败，整个构造过程将立即终止，接下来的任何构造代码不会再被执行

>  可失败构造器也，可代理到其它的不可失败构造器
>
> 为已有的初始化过程添加初始化失败的条件

```swift
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}
```

- 若 `quantity` 值无效，则立即终止整个构造过程

- 成功创建

```swift
if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}
// 打印“Item: sock, quantity: 2”
```

- 值为 0 的 `quantity` 来创建，失败

```swift
if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}
// 打印“Unable to initialize zero shirts”
```

- 值为空字符串的 `name` 来创建，失败

```swift
if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}
// 打印“Unable to initialize one unnamed product”
```

### 重写一个可失败构造器

- 子类重写父类可失败:
  - 子类非失败重写父类可失败
  - 需对父类可失败返回值强制解包

>  非失败重写可失败，但反过来却不行

- 例子：属性的值必须为一个非空字符串或 `nil`

```swift
class Document {
    var name: String?
    // 该构造器创建了一个 name 属性的值为 nil 的 document 实例
    init() {}
    // 该构造器创建了一个 name 属性的值为非空字符串的 document 实例
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}
```

- 子类重写了所有父类引入的指定构造器
- 确保生成的实例中的 `name` 属性总有初始值 `"[Untitled]"`：

```swift
class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}
```

- 使用强制解包来调用父类的可失败构造器

```swift
class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}
```

- 这里是通过字符串常量来调用，构造器不会失败，所以不会（强制解包）运行时错误。

### init! 可失败构造器

- 可失败构造器：
  - （`init?`）
  - （`init!`）- 隐式解包
- 调用：可在 init? 初始化器中委托调用 init! 初始化器，反之亦然。
- 重写：也可以用 init! 重写 init? ，反之亦然
- 用 init 委托调用 init!，初始化失败时会触发断言

## 必要(实现)构造器

- 子类都必须实现该初始化器
- 语法：类的构造器前添加 `required` 修饰符

```swift
class SomeClass {
    required init() {
        // 构造器的实现代码
    }
}
```

- 重写父类的必要构造器
  - 要添加 `required` 修饰符
  - 重写父类**必要的指定**构造器时，不需要添加 `override` 修饰符

```swift
class SomeSubclass: SomeClass {
    required init() {
        // 构造器的实现代码
    }
}
```

> 继承的构造器满足基本使用，则无需在子类实现必要构造器

## 通过闭包或函数设置属性的默认值

- 模板

```swift
class SomeClass {
    let someProperty: SomeType = {
        // 在这个闭包中给 someProperty 创建一个默认值
        // someValue 必须和 SomeType 类型相同
        return someValue
    }()
}
```

- 花括号后面接了一对空的小括号, 立即执行此闭包
- 忽略小括号，将闭包本身作为值赋值给了属性

>  在闭包执行时，实例的其它部分都还没有初始化
>
> 不能在闭包里访问其它属性，即使这些属性有默认值，也不能使用隐式的 `self` 属性，或者调用任何实例方法

- 结构体 `Chessboard`，构建西洋跳棋游戏的棋盘

<img src="https://docs.swift.org/swift-book/_images/chessBoard_2x.png" alt="img" style="zoom:33%;" />

- 值为 `true` 的元素表示一个黑格，值为 `false` 的元素表示一个白格
- 第一个元素代表棋盘上左上角的格子，最后一个元素代表棋盘上右下角的格子



- 通过一个闭包来初始化并设置颜色值

```swift
struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}
```

```swift
let board = Chessboard()
print(board.squareIsBlackAt(row: 0, column: 1))
// 打印“true”
print(board.squareIsBlackAt(row: 7, column: 7))
// 打印“false”
```

# 析构过程

- 场景：
  - Swift 也是使用*自动引用计数（ARC)* 处理实例的内存管理，实例释放不需要手动清理
  - 但是，用自己资源，需额外清理。如，文件读写
- 适用：class 类型
- 数量：一个类只能有一个
- 触发时机：
  - 不能主动调用
  - 可访问实例属性（调用后，实例才释放）
- 关键字：deinit
- 可继承，实现代码最后会（隐式）调用父类的析构器
  - 即使子类没实现，父类也会被调用

## 析构过程原理

- 语法：不带任何参数和圆括号

```swift
deinit {
    // 执行析构过程
}
```

## 析构器实践

- `Bank` 类管理虚拟币，确保流通币数不超 10,000。

- 使用类型属性和类型方法来存储和管理其当前状态

```swift
class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}
```

- 玩家在任意时间有一定数量币存在他钱包

```swift
class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
      // 银行回收硬币
        Bank.receive(coins: coinsInPurse)
    }
}
```

```swift
// 玩家可以随时离开游戏，设置为可选使你可以追踪玩家当前是否在游戏中
var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
// 打印“A new player has joined the game with 100 coins”
print("There are now \(Bank.coinsInBank) coins left in the bank")
// 打印“There are now 9900 coins left in the bank”
```

- 使用感叹号（`!`）强制解包

```swift
playerOne!.win(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
// 打印“PlayerOne won 2000 coins & now has 2100 coins”
print("The bank now only has \(Bank.coinsInBank) coins left")
// 打印“The bank now only has 7900 coins left”
```

- 玩家现在已经离开了游戏。这通过将可选类型的 `playerOne` 变量设置为 `nil` 来表示

```swift
playerOne = nil
print("PlayerOne has left the game")
// 打印“PlayerOne has left the game”
print("The bank now has \(Bank.coinsInBank) coins")
// 打印“The bank now has 10000 coins”
```

- 实例的析构器被自动调用，玩家的硬币被返还给银行

# 可选(类型)链

- 本质：安全解包 + 方法调用（属性读写、方法调用、脚标读写）

- 应用：检查（可选 属性、方法、下标）调用过程是否为 nil
  - 非 nil：返回 T？，继续执行后面的代码
  - 是 nil，调用失败，立即返回 nil
- 多个可选链可连接使用，一个节点为 nil ，整个调用链失败，返回 nil

> Swift 可选链 ≈ OC 的向 nil 发送消息类似
>
> 区别：Swift 调用失败会返回 nil，**做判断**检查

## 使用可选链式调用代替强制解包

- 语法：在想调用的属性、方法，或下标的可选值后面放一个问号（`?`）

- 场景
  - 解决强制解包弊端：可选值为空时，触发运行时错误

- 可选链返回类型：原本类型 + 一层可选包装 
  - 如：非可选链成功返回 Int，可选链返回 Int?

```swift
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}
```

- `john` 有一个值为 `nil` 的 `residence` 属性：（可选类型属性初始化为 nil）

```swift
let john = Person()
```

```swift
let roomCount = john.residence!.numberOfRooms
// 这会引发运行时错误
```

```swift
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// 打印“Unable to retrieve the number of rooms.”
```

```swift
john.residence = Residence()
```

```swift
// numberOfRooms为费可选 Int, 使用了可选链,变为返回 Int?，所以需要解包后调用
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// 打印“John's residence has 1 room(s).”
```

## 为可选链调用定义模型类

- 在复杂的模型中向下访问各种子属性，并且判断能否访问子属性的属性、方法和下标。

```swift
class Person {
    var residence: Residence?
}
```

- 增加了一个名为 `rooms` 的变量属性

```swift
class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}
```

```swift
class Room {
    let name: String
    init(name: String) { self.name = name }
}
```

```swift
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}
```



## 通过可选链访问属性

- 通过可选链式调用在一个可选值上，访问它的属性，并判断访问是否成功

```swift
let john = Person()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// 打印“Unable to retrieve the number of rooms.”
```

- `john.residence` 为 `nil`，所以这个可选链式调用依旧会像先前一样失败。



- 通过可选链式调用来设置属性值：

```swift
let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress
```

- 可选链式调用失败时，等号右侧的代码不会被执行



- 验证等号右侧的代码是否被执行。

```swift
func createAddress() -> Address {
    print("Function was called.")


    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"


    return someAddress
}
john.residence?.address = createAddress()
```

- 没有任何打印消息，可以看出 `createAddress()` 函数并未被执行。

## 通过可选链调用方法

- 调用方法，并判断方法调用成功
  - 无返回值的方法，调用成功，隐式返回`Void`类型，本质是一个空元组 `()`

```swift
public typealias Void = ()
```

- 可选链-调用【无返回值】方法
  - 成功：返回类 `Void?` 
  - 失败：返回 nil

> 过可选链式调用得到的返回值都是可选的

```swift
if john.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}
// 打印“It was not possible to print the number of rooms.”
```

- 通过可选链式调用给属性赋值会返回 `Void?`，通过判断返回值是否为 `nil` 就可以知道赋值是否成功：

```swift
if (john.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}
// 打印“It was not possible to set the address.”
```

## 通过可选链访问下标

- 在一个可选值上访问下标，且判断下标调用是否成功。

> 将问号放在下标方括号的前面而不是后面
>
> 可选链式调用的问号一般直接跟在可选表达式的后面

```swift
if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
// 打印“Unable to retrieve the first room name.”
```

- 问号直接放在 `john.residence` 的后面，并且在方括号的前面，因为 `john.residence` 是可选值

```swift
john.residence?[0] = Room(name: "Bathroom")
```

- 赋值同样会失败，因为 `residence` 目前是 `nil`。

```swift
let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnsHouse

if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
// 打印“The first room name is Living Room.”
```

### 访问可选类型的下标

- 在下标的结尾括号后面放一个问号，来在其可选返回值上进行可选链式调用

```swift
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
// "Dave" 数组现在是 [91, 82, 84]，"Bev" 数组现在是 [80, 94, 81]
```

## 连接多层可选链式调用

多层可选链式调用不会增加返回值的可选层级

- 访问的值不是可选的，可选链式调用返回可选值。
  - 可选链式调用访问一个 `Int` 值，返回 `Int?`，无论多少层可选链式调用
- 访问的值是可选，可选链式调用不会让可选返回值变得“更可选”。
  - 可选链式调用访问 `Int?` 值，依旧会返回 `Int?` 值，并不会返回 `Int??`

## 在方法的可选返回值上进行可选链式调用

```swift
if let beginsWithThe =
    john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
        if beginsWithThe {
            print("John's building identifier begins with \"The\".")
        } else {
            print("John's building identifier does not begin with \"The\".")
        }
}
// 打印“John's building identifier begins with "The".”
```

> 在 `buildingIdentifier()` 方法的可选返回值上进行可选链式调用，而不是 `buildingIdentifier()` 方法本身

# 错误处理

- Swift 在运行时提供了抛出、捕获、传递和操作可恢复错误（recoverable errors）的一等支持（first-class support）
- 区分这些不同的失败情况可以让程序处理并解决某些错误，然后把它解决不了的错误报告给用户

> 
>
>  Swift 中的错误处理涉及到错误处理模式，这会用到 Cocoa 和 Objective-C 中的 `NSError`。更多详情参见 [用 Swift 解决 Cocoa 错误](https://developer.apple.com/documentation/swift/cocoa_design_patterns/handling_cocoa_errors_in_swift)。

## 表示与抛出错误

- 在 Swift 中，错误用遵循 `Error` 协议的类型的值来表示
- 这个空协议表明该类型可以用于错误处理。



- 枚举类型适合构建一组相关的错误状态，关联值还可以提供错误状态的额外信息。
- 游戏中操作自动贩卖机

```swift
enum VendingMachineError: Error {
    case invalidSelection                     //选择无效
    case insufficientFunds(coinsNeeded: Int) //金额不足
    case outOfStock                             //缺货
}
```

- 抛出一个错误，提示贩卖机还需要 `5` 个硬币：

```
throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
```

## 处理错误

- 部分代码必须负责处理错误，如纠正这个问题、尝试另一种方式、或向用户报告错误。

- Swift `4` 种处理错误的方式
  - 传递给调用此函数的代码
  - 用 `do-catch` 语句处理错误
  - 将错误作为可选类型处理
  - 断言此错误根本不会发生
- 定位错误抛出的位置
  - 在调用一个能抛出错误的函数、方法或者构造器之前，加上 `try` 关键字，或者 `try?` 或 `try!` 这种变体

> 和其他语言中（包括 Objective-C ）的异常处理不同的是，Swift 中的错误处理并不涉及解除调用栈，这是一个计算代价高昂的过程。就此而言，`throw` 语句的性能特性是可以和 `return` 语句相媲美的。

### 用 throwing 函数传递错误

- 方法、函数抛出错误能力：
  - 在函数声明的参数之后加上 `throws` 关键字
  - 函数指明返回值类型，`throws` 需写在返回箭头（`->`）前面

```swift
func canThrowErrors() throws -> String

func cannotThrowErrors() -> String
```

- 标有 `throws` 关键字的函数被称作 *throwing 函数*
-  throwing 函数可以在其内部抛出错误，并将错误传递到函数被调用时的作用域

> 只有 throwing 函数可以传递错误。
>
> 在非 throwing 函数内部抛出的错误，只能在函数内部处理。



- 如果请求的物品不存在、缺货或者投入金额小于物品价格，该方法就会抛出一个相应的 `VendingMachineError`：

```swift
struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0

    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }

        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem

        print("Dispensing \(name)")
    }
}
```

- 使用了 `guard` 语句来确保在购买某个物品所需的条件中有任一条件不满足时，提前退出方法并抛出相应的错误

### 用 Do-Catch 处理错误

- 捕捉： do-catch 语句
- 匹配：catch 语句

```swift
do {
    try expression
    statements
} catch pattern 1 {
    statements
} catch pattern 2 where condition {
    statements
} catch pattern 3, pattern 4 where condition {
    statements
} catch {
    statements
}
```

- catch 不指定模式 = 匹配任何错误 + 赋值 error 局部常量

```swift
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
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error).")
}
// 打印“Insufficient funds. Please insert an additional 2 coins.”
```



- 不匹配的错误
  - 不抛出错误的函数：
    - 内部必须用 `do-catch` 语句处理错误
  - 能抛出错误的函数：
    - 可内部用 `do-catch` 语句处理
    - 可让上一层的调用方处理
    - 传递到顶层作用域，没被处理，运行时错误



- 错误会在调用函数的地方被捕获：

```swift
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
// 打印“Couldn't buy that from the vending machine.”
```

- 另一种写法：捕获多个相关错误的方式
- 放在 `catch` 后，通过逗号分隔

```swift
func eat(item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch VendingMachineError.invalidSelection, VendingMachineError.insufficientFunds, VendingMachineError.outOfStock {
        print("Invalid selection, out of stock, or not enough money.")
    }
}
```

- 三个错误中任意一个抛出，这个 `catch` 代码块就会打印信息。其他错误会传递到外面的作用域

### 将错误转换成可选值

- 使用 `try?` 通过将错误 error 转换成一个可选值 
  - 抛出错误：返回 nil
  - 正常执行：返回值的 可选类型
- 在下面的代码中，`x` 和 `y` 是等价的：

```swift
func someThrowingFunction() throws -> Int {
    // ...
}

let x = try? someThrowingFunction()

let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}
```

- 用 `try?`可让代码变简洁
- 用几种方式来获取数据，如果所有方式都失败了则返回 `nil`。

```swift
func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() { return data }
    if let data = try? fetchDataFromServer() { return data }
    return nil
}
```

### 禁用错误传递

- 本质： try？的强制解包
- 已知某个 `throwing` 函数运行时不会抛出错误

- 前提：保证无错误抛出，否则运行时报错
- 在表达式前面写 `try!`

```swift
let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")
```

## 指定清理操作

- 使用 defer 延迟操作语句

- **代码块结束前**执行必须要的清理工作
  - 不限制结束代码块方式：如抛出错误、 `return`、`break` 等语句

-  defer 语句不能包含控制转移语句
  - 如 `break`、`return` 语句，或是抛出一个错误
- 多个 defer 语句执行顺序（先进后出）
  - 按照它们声明的顺序从后往前执行——也就是说，第一条 `defer` 语句中的代码最后才执行，第二条 `defer` 语句中的代码倒数第二个执行，以此类推。最后一条语句会第一个执行。

- 保证文件描述符都关闭并且手动指定的内存到被释放

```swift
func processFile(filename: String) throws {
    if exists(filename) {
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline() {
            // 处理文件。
        }
        // close(file) 会在这里被调用，即作用域的最后。
    }
}
```

- 用一条 `defer` 语句来确保 `open(_:)` 函数有一个相应的对 `close(_:)` 函数的调用

>  没有涉及到错误处理的代码，也可以使用 `defer` 语句。

# 类型转换

- 使用场景：
  - 判断实例的类型 
  - 转换实例的类型
- 检查类型： `is` 
- 转换类型： `as` 
- 检查是否遵循某个协议

## 为类型转换定义类层次

- 在类和子类的层次结构上，检查特定类实例的类型并且转换这个类实例的类型成为这个层次结构中的其他类型。
- 基类 `MediaItem`。这个类为任何出现在数字媒体库的媒体项提供基础功能

```swift
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}
```

```swift
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
```

- Swift 的类型检测器能够推断出 `Movie` 和 `Song` 有共同的父类 `MediaItem`，所以它推断出 `[MediaItem]` 类作为 `library` 的类型：

```swift
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
// 数组 library 的类型被推断为 [MediaItem]
```

- `library` 里存储的媒体项依然是 `Movie` 和 `Song` 类型的
- 遍历取出的实例会是 `MediaItem` 类型的，而不是 `Movie` 和 `Song` 类型

## 检查类型

- *操作符*（`is`）：检查一个实例是否属于特定子类型
- 属于子类型，返回 `true`，否则返回 `false`

```swift
var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")
// 打印“Media library contains 2 movies and 3 songs”
```



## 向下转(子类)型

- 用*类型转换操作符*（`as?` 或 `as!`）向下转到它的子类型

- 条件形式 `as?` 返回向下转型的可选值，转型失败，返回 nil
- 强制形式 `as!` ，在 `as?`  继承上进行强制解包，失败触发运行时错误。



- 事前你不知道每个 `item` 的真实类型，所以这里使用条件形式的类型转换（`as?`）去检查

```swift
for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}


// Movie: Casablanca, dir. Michael Curtiz
// Song: Blue Suede Shoes, by Elvis Presley
// Movie: Citizen Kane, dir. Orson Welles
// Song: The One And Only, by Chesney Hawkes
// Song: Never Gonna Give You Up, by Rick Astley
```

> 注意
>
> 转换没有真的改变实例或它的值。根本的实例保持不变；只是简单地把它作为它被转换成的类型来使用。

## Any 和 AnyObject 的类型转换

- 使用场景：为不确定类型提供了两种特殊的类型别名
  - 如新建一个存放数据的数组；
  - 网络获取的不确定类型的数据

- `Any` 可以表示任何类型，包括函数类型
- `AnyObject` 表示任何类（class）类型的实例



- 用 `Any` 类型来和混合的不同类型一起工作

```swift
var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })
```

- 可在 `switch` 表达式的 `case` 中，用 `is` 和 `as` 找出 `Any` 或 `AnyObject` 类型的常量或变量的具体类型

```swift
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
```

- 确定 any 类型数组元素的真实类型

```swift
for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}

// zero as an Int
// zero as a Double
// an integer value of 42
// a positive double value of 3.14159
// a string value of "hello"
// an (x, y) point at 3.0, 5.0
// a movie called Ghostbusters, dir. Ivan Reitman
// Hello, Michael
```

> 注意
>
> `Any` 类型可表示所有类型的值，包括可选类型。
>
> Swift 会在你用 `Any` 类型来表示一个可选值的时候，给你一个警告。
>
> 如果你确实想使用 `Any` 类型来承载可选值，你可以使用 `as` 操作符**显式转换**为 `Any`，如下所示：

```swift
let optionalNumber: Int? = 3
things.append(optionalNumber)        // 警告
things.append(optionalNumber as Any) // 没有警告
```

# 嵌套类型

- 在一个类型中嵌套另一个类型，将嵌套类型的定义写在其外部类型的 `{}` 内，而且可以根据需要定义多级嵌套
- 使用场景：工具类/结构体
- 适用：枚举、类、结构体

## 嵌套类型实践

- 一个结构体 `BlackjackCard`（二十一点），嵌套定义枚举类型 `Suit` 和 `Rank`
- `Ace` 牌可以表示 `1` 或者 `11`，这一特征通过一个嵌套在 `Rank` 枚举中的结构体 `Values`

```swift
struct BlackjackCard {

    // 嵌套的 Suit 枚举
    enum Suit: Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }

    // 嵌套的 Rank 枚举
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }

    // BlackjackCard 的属性和方法
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}
```

- 没自定义构造器，在 [结构体的逐一成员构造器]() 中可知，结构体有默认的成员构造器

```swift
let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
print("theAceOfSpades: \(theAceOfSpades.description)")
// 打印“theAceOfSpades: suit is ♠, value is 1 or 11”
```

- 尽管 `Rank` 和 `Suit` 嵌套在 `BlackjackCard` 中，但它们的类型仍可从上下文中推断出来
- 所以在初始化实例时能够单独通过成员名称（`.ace` 和 `.spades`）引用枚举实例

## 引用嵌套类型

- 嵌套类型的类型名前加上其外部类型的类型名，作为前缀

```swift
let heartsSymbol = BlackjackCard.Suit.hearts.rawValue
// 红心符号为“♡”
```

# 扩展 - Extensions

- 适用：结构体、枚举、枚举、协议
- 使用场景
  - 增加
    - 计算属性（实例和类）【不能扩充存储属性】
    - 方法（实例或）
    - 构造器
    - 下标
    - 嵌套类型
  - 协议
    - 遵循（conform）协议
    - 实现协议方法

> 注意
>
> 扩展可以给一个类型添加新的功能，但是不能重写已经存在的功能。

## 扩展的语法

```swift
extension SomeType {
  // 在这里给 SomeType 添加新的功能
}
```

- 充一个现有的类型，给它添加一个或多个协议

```swift
extension SomeType: SomeProtocol, AnotherProtocol {
  // 协议所需要的实现写在这里
}
```

> 注意
>
> 现有的类型通过扩展，添加新的功能，所有实例都可用新功能（包括扩展之前创建的）。

## 计算型属性

- 给 Swift 内建的 `Double` 类型添加了五个**计算型实例属性**，从而提供与距离单位相关工作的基本支持

```swift
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 } // 一米有 3.28084 英尺
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// 打印“One inch is 0.0254 meters”
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// 打印“Three feet is 0.914399970739201 meters”
```

- 只读计算属性，表达式不包含 `get` 关键字

```swift
let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")
// 打印“A marathon is 42195.0 meters long”
```

> 注意 
>
> - 扩展可添加新的计算属性
>
> - 不能添加存储属性
>
> - 不能向现有的属性添加属性观察者。

## 扩展构造器

- 指定构造器 + 析构器，必须始终由类的原始实现提供
  - 能添加便利构造器
  - 不能添加指定构造器
- 使用扩展添加构造器，新的构造器用 self 调用另一个构造器，不能使用 self

```swift
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}
```

- 结构体给所有的属性都提供了默认值，自动获得了一个默认构造器和一个成员构造器

```swift
let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
   size: Size(width: 5.0, height: 5.0))
```

- 通过扩展 `Rect` 结构体来提供一个允许指定 point 和 size 的构造器：

```swift
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
```

```swift
let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))
// centerRect 的 origin 是 (2.5, 2.5) 并且它的 size 是 (3.0, 3.0)
```

> 扩展新构造器，务必确保实例初始化完整

## 方法

- 给 `Int` 类型添加了一个新的实例方法叫做 `repetitions`：

```swift
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}
```

- 对任意整形数值调用 `repetitions(task:)` 方法，来执行对应次数的任务：

```swift
3.repetitions {
    print("Hello!")
}
// Hello!
// Hello!
// Hello!
```

### 可变实例方法

- 扩展添加的实例方法，同样也可修改（或 *mutating（改变）*）实例本身
- `Int` 类型添加了一个新的 mutating 方法，叫做 `square`，它将原始值求平方

```swift
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()
// someInt 现在是 9
```

## 下标

- 下标 `[n]` 从数字右侧开始，返回小数点后的第 `n` 位
  - `123456789[0]` 返回 `9`
  - `123456789[1]` 返回 `8`

……以此类推：



```swift
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
746381295[0]
// 返回 5
746381295[1]
// 返回 9
746381295[2]
// 返回 2
746381295[8]
// 返回 7
```

没有足够的位数，下标的现实将返回 `0`，就好像在数字的左边补上了 0：

```swift
746381295[9]
// 返回 0，就好像你进行了这个请求：
0746381295[9]
```

## 嵌套类型

```swift
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}
```

- 表示数字是负的、零的还是正的
- 给 `Int` 添加了一个新的计算型实例属性，叫做 Kind

```swift
func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
// 打印“+ + - 0 - 0 + ”
```

> 注意 `number.kind` 已经被认为是 `Int.Kind` 类型。所以，在 `switch` 语句中所有的 `Int.Kind` case 分支可以被缩写，就像使用 `.negative` 替代 `Int.Kind.negative.`。

# 协议

## 协议语法

- 与类、结构体、枚举类型非常相似

```swift
protocol SomeProtocol {
    // protocol definition goes here
}
```

- 表示该类型采纳协议，多个协议用逗号分开：

```swift
struct SomeStructure: FirstProtocol, AnotherProtocol {
    // structure definition goes here
}
```

- 有父类的写法，父类名放协议名之前，用逗号分隔

```swift
class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
    // class definition goes here
}
```

## 属性要求

- 场景：要求遵循该协议的类型，提供特定名字和类型的实例属性或类型属性
- 特性：
  - 不要求 存储属性 or 计算属性（只要求名称和类型一致）
  - 须明确可读可写（set 和 get）
    - 可读写：不能用常量、只读属性
    - 只读：任意类型

```swift
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}
```

- 类型属性:  实现时，使用 class 或static 关键字

```swift
protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}
```

- 只有一个实例属性要求

```swift
protocol FullyNamed {
    var fullName: String { get }
}
```

- 使用

```swift
struct Person: FullyNamed {
    var fullName: String
}
let john = Person(fullName: "John Appleseed")
// john.fullName is "John Appleseed"
```

- 更加复杂的类，遵循 FullyNamed 协议

```swift
class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
// ncc1701.fullName is "USS Enterprise"
```

- 当 prefix 值存在时，fullName 将 prefix 放在 name 之前以创建星舰的全名

## 方法要求

- 使用场景：要求采纳的类型，实现指定的实例方法和类方法
- 语法：
  - 与正常实例、类方法相同，但不需大括号
  - 方法参数不能定义默认值（可在扩展中写默认实现）

```swift
protocol SomeProtocol {
    static func someTypeMethod()
}
```

- 只有一个实例方法要求的协议，要求生成器提供一个生成随机数的标准过程

```swift
protocol RandomNumberGenerator {
    func random() -> Double
}
```

```swift
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
// Prints "Here's a random number: 0.37464991998171"
print("And another one: \(generator.random())")
// Prints "And another one: 0.729023776863283"
```

## 异变方法要求

- 场景：方法需要改变（或*异变*）其所属的实例
- 语法：在方法的 func 关键字之前，使用 mutating 关键字

> 在协议标记实例方法 mutating ，mutating 只在结构体和枚举要写，为类实现该方法的时不用写 mutating 

```swift
protocol Togglable {
    mutating func toggle()
}
```

```swift
enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
// lightSwitch is now equal to .on
```

## 构造器要求

- 场景：遵循协议的类型实现指定的初始化器

- 语法：不用写大括号

```swift
protocol SomeProtocol {
    init(someParameter: Int)
}
```

### 协议构造器要求的类实现

- 实现要求：
  - 指定和便捷初始化器都可以
  - 必须用 required 关键字修饰（保证了子类继承父类协议时，实现方法）

```swift
class SomeClass: SomeProtocol {
    required init(someParameter: Int) {
        // initializer implementation goes here
    }
}
```

> 由于 final 的类没子类，协议初始化器实现的类，用 final 标记，不需用 required 修饰。因为这样的类不能被继承子类。详见 阻止重写 

- 一个子类，重写了父类指定的初始化器 + 遵循协议实现了要求的初始化器，这个初始化器的实现添加 required 和 override 

```swift
protocol SomeProtocol {
    init()
}
 
class SomeSuperClass {
    init() {
        // initializer implementation goes here
    }
}
 
class SomeSubClass: SomeSuperClass, SomeProtocol {
    // "required" from SomeProtocol conformance; "override" from SomeSuperClass
    required override init() {
        // initializer implementation goes here
    }
}
```

### 可失败构造器要求

- 可失败的初始化器的实现：
  - 不可失败初始化器
  - 隐式展开的可失败初始化器

## 协议作为类型

- 协议自身并不实现功能，可以变为一个功能完备的类型在代码中使用。
  - 作为参数或返回类型
  - 作为常量、变量或者属性的类型；
  - 作为数组、字典或者其他存储器的元素的类型

> 协议是类型，要开头大写（比如说 FullyNamed 和 RandomNumberGenerator ）来匹配 Swift 里其他类型名称格式（比如说 Int 、 String 还有 Double ）

- 例子：

```swift
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}
```

- generator 属性是 RandomNumberGenerator 类型，任何采纳了RandomNumberGenerator 协议的类型

- 初始化器有一个形式参数叫做generator ，它同样也是 RandomNumberGenerator 类型，接收遵循这个协议的类型的值
-  random() 方法，由于 generator 已知采纳了RandomNumberGenerator ，它保证了会有 random() 方法以供调用



- Dice 类用 LinearCongurentialGenerator 实例创建一个六面骰子的随机数生成器，来创建一个六面骰子

```swift
var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}
```

## 委托 / 代理

- 是一种设计模式：委托/代理模式
  - 通过定义一个封装了委托责任的协议来实现
  - 遵循了协议的类型（所谓的委托）来保证提供被委托的功能
  - 响应一个特定的行为
  - 从外部资源取回数据（而不需要了解资源具体的类型）

> *Delegation 委托，可能也以“代理”而为人熟知，这里我们选择译为“委托”是为了更好的理解避免混淆*

- 定义了两个协议以用于基于骰子的棋盘游戏:

```swift
protocol DiceGame {
    var dice: Dice { get }
    func play()
}
protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}
```

- DiceGame 与骰子有关的游戏采纳的协议，DiceGameDelegate 协议可以被任何追踪 DiceGame 进度的类型采纳

- 采用 DiceGame 协议；然后通知一个 DiceGameDelegate 关于进度的信息

```swift
class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}
```

- dice 属性为常量，因它不需初始化后再改变，而且协议只需它是可读
-  delegate 属性为*可选* ，自动初始化为 nil ，play() 方法调用委托时候需用可选链



-  DiceGameDelegate 协议：

```swift
class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}
```

```swift
let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()
// Started a new game of Snakes and Ladders
// The game is using a 6-sided dice
// Rolled a 3
// Rolled a 5
// Rolled a 4
// Rolled a 5
// The game lasted for 4 turns
```

## 在扩展里添加协议遵循

- 场景：给已存在的类遵循一个新协议（无法访问该类型的源代码也行）

> 类型已经存在的实例，自动地采纳和遵循这个协议。

- 用文本表达的类型实现

```swift
protocol TextRepresentable {
    var textualDescription: String { get }
}
```

- 遵循 TextRepresentable ：

```swift
extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}
```

- Dice 实例现在都可以被视作 TextRepresentable ：

```swift
let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)
// Prints "A 12-sided dice"
```

```swift
extension SnakesAndLadders: TextRepresentable {
    var textualDescription: String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}
print(game.textualDescription)
```

## 有条件地遵循协议

- 使用场景：泛型有条件遵守协议
- 语法：协议的名字后面写泛型 where 分句



- 让 Array 类型在存储遵循 TextRepresentable 协议的元素时遵循TextRepresentable 协议
  - 让元素拥有协议方法

```swift
extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}
let myDice = [d6, d12]
print(myDice.textualDescription)
// Prints "[A 6-sided dice, A 12-sided dice]"
```

## 在扩展里声明采纳协议

- 场景：实现了协议方法，但没遵循协议
- 语法：遵循协议 + 空拓展

```swift
struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}
```

- Hamster 实例，可以赋值给遵守 TextRepresentable 协议的实例

```swift
let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable.textualDescription)
// Prints "A hamster named Simon"
```

> 类型不会因为实现协议方法，就自动遵守协议，必须显式地声明

## 使用合成实现来采纳协议

- 场景：使用系统定义 + 实现好的协议，直接调用协议的功能方法（减少重复代码）

- 常见系统协议： Equatable 、 Hashable 以及 Comparable 协议

- Swift 为以下自定义类型提供了 Equatable 的综合实现：

  - 只包含遵循 Equatable 协议的**存储属性**的**结构体**；
  - 只关联遵循 Equatable 协议的类型的**枚举**；
  - 没有关联类型的**枚举**。

- 遵循 Equatable 协议

  - 不需手动实现 == 运算符
  - 默认的 != 实现

  

- Swift为以下自定义类型提供了 Hashable 的综合实现：

  - 只包含遵循 Hashable 协议的存储属性的结构体；
  - 只关联遵循 Hashable 协议的类型的枚举；
  - 没有关联类型的枚举。

- 遵循 Hashable 协议

  - 不需要手动实现 hash(into:) 方法



- Swift为不包含原始值的枚举，提供 Comparable 的综合实现
  - 如果枚举拥有关联类型，这些类型必须都遵循 Comparable 协议
- 遵循 Comparable 协议
  - 不需要手动实现 <= 、 > 和 >=  运算符



- 定义了一个包含 beginners、intermediates以及 experts 情况的枚举SkillLevel

- Experts 还额外使用数字来记录他们拥有的星星数量等级。

```swift
enum SkillLevel: Comparable {
    case beginner
    case intermediate
    case expert(stars: Int)
}
var levels = [SkillLevel.intermediate, SkillLevel.beginner,
              SkillLevel.expert(stars: 5), SkillLevel.expert(stars: 3)]
for level in levels.sorted() {
    print(level)
}
// Prints "beginner"
// Prints "intermediate"
// Prints "expert(stars: 3)"
// Prints "expert(stars: 5)"
```

## 协议类型的集合

- 场景：存储遵守统一协议的元素

```swift
let things: [TextRepresentable] = [game, d12, simonTheHamster]
```

- 现在可以遍历数组中的元素了，并且打印每一个元素的文本化描述：

```swift
for thing in things {
    print(thing.textualDescription)
}
// A game of Snakes and Ladders with 25 squares
// A 12-sided dice
// A hamster named Simon
```

- 注意 thing 常量是 TextRepresentable 类型。它不是 Dice 类型，抑或 DiceGame 还是Hamster ，就算后台实际类型是它们之一

## 协议的继承

- 场景：扩充功能
- 语法：与类继承类似，但可以多继承

```swift
protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
    // protocol definition goes here
}
```

- 继承了上边 TextRepresentable 协议

```swift
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}
```

- SnakesAndLadders 类可以通过扩展来采纳和遵循 PrettyTextRepresentable ：

```swift
extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}

```

```swift
print(game.prettyTextualDescription)
// A game of Snakes and Ladders with 25 squares:
// ○ ○ ▲ ○ ○ ▲ ○ ○ ▲ ▲ ○ ○ ○ ▼ ○ ○ ○ ○ ▼ ○ ○ ▼ ○ ▼ ○
```

## 类专属的协议

- 场景：限制协议只能被类类型采纳（并且不是结构体或者枚举）
- 语法：添加 AnyObject 关键字到协议的继承列表

```swift
protocol SomeClassOnlyProtocol: AnyObject, SomeInheritedProtocol {
    // class-only protocol definition goes here
}
```

## 协议合成

- 场景：要求一个类型一次遵循多个协议

- 注意：协议组合不定义任何新的协议类型
- 语法：用 SomeProtocol & AnotherProtocol 的形式

```swift
protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person: Named, Aged {
    var name: String
    var age: Int
}
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}
let birthdayPerson = Person(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)
// Prints "Happy birthday, Malcolm, you're 21!"
```

- 不关心具体是什么样的类型传入函数，只要它遵循这两个要求的协议即可

```swift
class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

class City: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}

// 任何 Location 的子类且遵循 Named 协议的类型
func beginConcert(in location: Location & Named) {
    print("Hello, \(location.name)!")
}

let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
beginConcert(in: seattle)
// Prints "Hello, Seattle!"
```

## 检查协议一致性

- 场景：检查是否遵守协议
- 语法：使用 is 和 as 
- 循协议is运算符返回 true 否则返回 false
- as? 成功，返回协议的可选项，如果不遵循协议，返回nil ；
- as! 成功返回解包值，失败运行时报错

```
protocol HasArea {
    var area: Double { get }
}
```

- Circle 和 Country ，这两个类都遵循 HasArea 协议

```swift
class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}
class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}
```

- Animal 的类，它不遵循 HasArea 协议

```swift
class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}
```

- Circle 、 Country 和 Animal 类并不基于相同的基类。不过它们都是类

```swift
let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]
```

```swift
for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}
// Area is 12.5663708
// Area is 243610.0
// Something that doesn't have an area
```

## 可选的协议要求

- 场景：不需要遵循协议的类型实现
- 语法：使用optional 修饰符作为前缀
- 可选要求协议被 Objective-C 遵循
  - 协议和可选要求必须用 @objc 标志标记
  - @objc 协议只能被继承 OC 类或 @objc 类采纳（不能被结构体或者枚举采纳）
- 可选方法或属性时，类型自动变成可选项
  - 一个 (Int) ->String 类型的方法会变成 ((Int) -> String)?（函数类型可选项，不是返回值）
- 可选协议可在可选链中调用
  - 在调用方法的时候在方法名后边写一个问号来检查它是否被实现

```swift
someOptionalMethod?(someArgument)
```

- Counter 的整数计数的类，用一个外部数据源来提供它的增量

```swift
@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}
```

> 可以写一个遵循 CounterDataSource 的自定义类而不实现*任何*协议要求。反正它们都是可选的。尽管技术上来讲是可以的，但这样的话就不能做一个好的数据源了。

- 定义的 Counter 类，有一个可选的 dataSource 属性，类型是CounterDataSource? 

```swift
class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}
```

-  dataSource 不是 nil 的时候才能调用 incrementForCount(forCount:)， dataSource *确实*存在，也没有人能保证它实现了 incrementForCount(forCount:) ，因为它是可选要求
- 就算 dataSource *确实*存在，也没有人能保证它实现了 incrementForCount(forCount:) ，因为它是可选要求



- 据源在每次查询时返回固定值 3 .它通过实现可选 fixedIncrement 属性要求来实现这一点

```swift
class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}
```

- 使用 ThreeSource 的实例作为新 Counter 实例的数据源：

```swift
var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}
// 3
// 6
// 9
// 12
```

- 使 Counter 实例依照它当前的count 值往上或往下朝着零计数

```swift
@objc class TowardsZeroSource: NSObject, CounterDataSource {
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}
```

- 使用 TowardsZeroSource 给现存的 Counter 实例来从 -4 到零。一旦计数器到零，就不会再变化：

```swift
counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {
    counter.increment()
    print(counter.count)
}
// -3
// -2
// -1
// 0
// 0
```

## 协议扩展

- 场景：通过扩展，实现协议属性或方法
- RandomNumberGenerator 协议可以扩展来提供 randomBool() 方法

```swift
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}
```

- 有的遵循类型自动获得这个方法的实现

```swift
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
// Prints "Here's a random number: 0.37464991998171"
print("And here's a random Boolean: \(generator.randomBool())")
// Prints "And here's a random Boolean: true"
```

### 提供默认实现

- 使用协议扩展，给协议方法或者计算属性，提供默认实现
  - 遵守协议 + 自定义了实现 = 替代默认实现

> 有默认实现的要求，不需要使用可选链就能调用

- 提供一个默认实现来简单的返回访问textualDescription 属性的结果

```swift
extension PrettyTextRepresentable  {
    var prettyTextualDescription: String {
        return textualDescription
    }
}
```

### 为协议扩展添加限制条件

- 场景：协议扩展，明确遵循类型的限制
- 语法：在扩展协议名字后边使用where 分句来写这些限制
- 给 Collection 定义一个扩展，任意元素遵循上面 TextRepresentable 协议

```swift
extension Collection where Iterator.Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}
```

- 之前的 Hamster 结构体，它遵循 TextRepresentable 协议， Hamster 值的数组

```swift
let murrayTheHamster = Hamster(name: "Murray")
let morganTheHamster = Hamster(name: "Morgan")
let mauriceTheHamster = Hamster(name: "Maurice")
let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]
```

-  Array 遵循 Collection 并且数组的元素遵循 TextRepresentable 协议，数组可以使用 textualDescription 属性来获取它内容的文本化

```swift
print(hamsters.textualDescription)
// Prints "[A hamster named Murray, A hamster named Morgan, A hamster named Maurice]"
```

> 如果遵循类型满足了为相同方法或者属性提供实现的多限制扩展的要求，Swift 会使用最匹配限制的实现。

# 泛型 - Generics

- 场景：类型参数化，增强代码的复用性
- 很多 Swift 标准库是基于泛型构建
  - Array 和Dictionary 类型都是泛型集合
    - 可以创建一个容纳 Int 值的数组，或者容纳String 值的数组
    - 以创建一个存储任何指定类型值的字典，而且类型没有限制

## 泛型解决的问题

- 非泛型例子

```swift
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
```

- 使用

```swift
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3"
```

- 非泛型例子

```swift
func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}
```

- 函数体是一样的。唯一的区别是它们接收值类型不同（ Int 、String 和 Double ）

> 若 a 和 b 类型不同，Swift 是类型安全语言，会引发一个编译错误。

## 泛型函数

- 上面提到的 swapTwoInts(_:_:) 函数的泛型版本，叫做 swapTwoValues(_:_:) ：

```swift
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
```

- *占位符*类型名（ T ）
  - 不是实际类型名（比如Int 、 String 或 Double ），Swift 不会查找尖括号的 T 类型
  -  a 和 b 必须都是同一个类型 T
  - 调用函数时，会根据实际数据类型，替代 T 



- 两个例子中， T 分别被推断为 Int 和 String ：

```swift
var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)
// someInt is now 107, and anotherInt is now 3
 
var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
// someString is now "world", and anotherString is now "hello"
```

> swap 函数是 Swift 标准库的一部分，可直接用  swap(_:_:) 函数，不需要自己实现

## 类型参数

- **类型参数**跟**普通参数**类似
  - 命名，写在函数名后面的尖括号里
  - 用作参数类型、返回值类型
  - 多个类型参数，用逗号隔开

## 命名类型参数

- 类型参数命名规范：
  - 要有描述性时：
    - 如 Dictionary<Key, Value> 中的Key 和 Value
  - 没有关系描述时：
    - 一般按单个字母命名，如 T 、 U 、 V ，如上面 swapTwoValues(_:_:) 函数中的 T

> 类型参数永远用**大写开头**的驼峰命名法（如 T 和 MyTypeParameter ），以指明是一个类型的占位符，不是一个值。

## 泛型类型

- 场景：自定义一个带泛型的类型（相对于带泛型的函数）

- 展示如何写出一个叫做 Stack 的泛型集合类型
  - 数组允许在其中任何位置插入和移除元素。
  - 栈的新元素只能添加到集合的末尾（*压栈*）。
  - 栈只允许从集合的末尾移除元素（*出栈*）。

- 非泛型版本的栈，是一个 Int 值的栈

```swift
swstruct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}
```

- 泛型版本：

```swift
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
```

- 给尖括号传参，创建一个新的字符串栈，可以写 Stack<String>() ：

```swift
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
// the stack now contains 4 strings
```

```swift
let fromTheTop = stackOfStrings.pop()
// fromTheTop is equal to "cuatro", and the stack now contains 3 strings
```

## 泛型扩展

场景：给**泛型类型**写扩展

- 不需写出**类型参数**的列表
- 原（始）类型的**类型参数**可用于拓展

- 添加一个叫做 topItem 的只读计算属性，不需要移除

```swift
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
```

- 扩展没有定义类型形式参数列表。相反，扩展中用 Stack 已有的类型形式参数名称， Element ，来指明计算属性 topItem 的可选项类型。

## 类型约束

场景：限定泛型，必须继承特定的类 or 遵守特定协议

- Dictionary 需要它的键是可哈希的，以便它可以检查字典中是否包含一个特定键的值
  - 指明了键类型必须遵循 Swift 标准库中定义的 Hashable 协议
- 所有 Swift 基本类型（比如 String 、 Int 、Double 和 Bool ）默认都是可哈希的

### 类型约束语法

语法：类型形式参数，名称后面放一个类或协议，作为形式参数列表的一部分

```swift
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // function body goes here
}
```

- T ，要求 T 是SomeClass 的子类。 U ，要求 U 遵循SomeProtocol 协议。

### 类型约束实践

给定字符串，它会返回数组中第一个匹配的字符串的索引值，如果找不到给定字符串就返回 nil ：

```swift
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
```

```swift
let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}
// Prints "The index of llama is 2"
```

- 只能用于字符串

- T 类型的值代替所有用到的字符串，可以用泛型函数写一个相同的功能

```
func findIndex<T>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
```

- 报运行时错误 - 原因：
  - 不是每种都能用相等操作符（ == ）来比较的，如类、结构体，相等无法推断
- 解决：
  - 遵循 Equatable 的协议

```swift
func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
```

```swift
let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
// doubleIndex is an optional Int with no value, because 9.3 is not in the array
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
// stringIndex is an optional Int containing a value of 2
```

## 关联类型（协议的泛型参数）

场景：定义协议不能像定义函数那样，使用泛型参数，素养使用**关联类型**

报错如下：

```swift
Protocols do not allow generic parameters; use associated types instead
```

- 采纳协议时，才推断出关联类型的实际类型
- 通过 associatedtype 关键字指定

### 关联类型实践

- 声明了一个叫做 ItemType 的关联类型：

```swift
protocol Container {
    associatedtype ItemType
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}
```

- 前面非泛型版本的 IntStack ，使其遵循 Container 协议：

```swift
struct IntStack: Container {
    // original IntStack implementation
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // conformance to the Container protocol
    typealias ItemType = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}
```

- 指定 ItemType 类型是 Int 。如果删除 typealias ItemType = Int ，一切正常运行，因为 ItemType 该用什么类型能被推断出来



- 遵循 Container 协议的**泛型 Stack** 类型

```swift
struct Stack<Element>: Container {
    // original Stack<Element> implementation
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}
```

-  Element 用于 append(_:) 方法的 item 形式参数和下标的返回类型
- Swift 可以推断出 Element 是适用于 ItemType 的类型

### 给关联类型添加约束

- 场景：给协议的关联类型，添加协议遵守或类型继承
- 定义了一个版本的 Container ，它要求容器中的元素都是可判等的

```swift
protocol Container {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
```

- 遵循这个版本的 Container ，容器的 Item 必须遵循 Equatable 协议

### 在关联类型约束里使用协议

- 场景：限定协议的关联类型
- 返回容器中从后往前给定数量的元素

```swift
protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}
```

- 关联类型 Suffix 拥有两个约束
  - 必须遵循 SuffixableContainer 协议（就是当前定义的协议）
  -  Item 类型必须是和容器里的 Item 类型相同

- 扩展添加了对SuffixableContainer 协议的遵循

```swift
extension Stack: SuffixableContainer {
    func suffix(_ size: Int) -> Stack {
        var result = Stack()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
    // Inferred that Suffix is Stack.
}
var stackOfInts = Stack<Int>()
stackOfInts.append(10)
stackOfInts.append(20)
stackOfInts.append(30)
let suffix = stackOfInts.suffix(2)
// suffix contains 20 and 30
```

- 使用Stack<Int> 作为它的后缀类型

```swift
extension IntStack: SuffixableContainer {
    func suffix(_ size: Int) -> Stack<Int> {
        var result = Stack<Int>()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
    // Inferred that Suffix is Stack<Int>.
}
```

### 扩展现有类型来指定关联类型

- 场景：为系统类型扩展功能
- 扩展 Array ，使其遵循 Container 协议。通过一个空的扩展实现

```swift
extension Array: Container {}
```

- 数组已有的 append(_:) 方法和下标使得Swift能为 ItemType 推断出合适的类型
- 可以把任何 Array 当做一个Container 使用

## 泛型 Where 语句

- 场景：在泛型函数或泛型类型，约束泛型

- *Where分句*-语法：
  - 后接关联类型的约束或类型和关联类型一致的关系
    - 遵循指定的协议
    - 指定的类型参数和关联类型必须相同
  - 写在一个类型或函数体的左半个大括号前面



- 查两个 Container 实例是否包含相同顺序的相同元素

- 两个容器不一定是相同类型（尽管它们可以是)，元素类型必须相同

```swift
func allItemsMatch<C1: Container, C2: Container>
    (_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
        
        // Check that both containers contain the same number of items.
        if someContainer.count != anotherContainer.count {
            return false
        }
        
        // Check each pair of items to see if they are equivalent.
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        
        // All items match, so return true.
        return true
}
```

- C1 的 ItemType 必须和 C2 的 ItemType 相同（写作 C1.ItemType ==C2.ItemType ）；
- C1 的 ItemType 必须遵循 Equatable 协议（写作 C1.ItemType: Equatable ）。



- allItemsMatch(_:_:) 函数使用

```swift
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
 
var arrayOfStrings = ["uno", "dos", "tres"]
 
if allItemsMatch(stackOfStrings, arrayOfStrings) {
    print("All items match.")
} else {
    print("Not all items match.")
}
// Prints "All items match."
```



## 具有泛型 Where 子句的扩展

- 场景：扩展新功能时，给泛型添加约束条件

- 添加了一个 isTop(_:) 方法

```swift
extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {// 验栈不为空
            return false
        }
        return topItem == item// 对比给定的元素与栈顶元素
    }
}
```

- 使用

```swift
if stackOfStrings.isTop("tres") {
    print("Top element is tres.")
} else {
    print("Top element is something else.")
}
// Prints "Top element is tres."
```

- 在元素不能判等的栈调用 isTop(_:) 方法，运行时错误

```swift
struct NotEquatable { }
var notEquatableStack = Stack<NotEquatable>()
let notEquatableValue = NotEquatable()
notEquatableStack.push(notEquatableValue)
notEquatableStack.isTop(notEquatableValue) // Error
```

- 用泛型 where 分句来扩展到一个协议

```swift
extension Container where Item: Equatable {
    func startsWith(_ item: Item) -> Bool {
        return count >= 1 && self[0] == item
    }
}
```

-  方法可以应用到任何遵循 Container 协议的类型上

```swift
if [9, 9, 9].startsWith(42) {
    print("Starts with 42.")
} else {
    print("Starts with something else.")
}
// Prints "Starts with something else."
```

- 除了要求 Item 遵循协议，还可以写泛型 where 分句要求 Item 为特定类型

```swift
extension Container where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        return sum / Double(count)
    }
}
print([1260.0, 1200.0, 98.6, 37.0].average())
// Prints "648.9"
```

- 遍历容器中的元素来把它们相加，然后除以容器的总数来计算平均值
- 显式地把总数从 Int 转为Double 来允许浮点除法



- 泛型 where 分句中包含多个要求来作为扩展的一部分，每一个需求用逗号分隔

## 包含上下文关系的 where 分句

- 场景：简化代码，多个泛型类型的 extension 写成一个extension 

```swift
extension Container {
    func average() -> Double where Item == Int {
        var sum = 0.0
        for index in 0..<count {
            sum += Double(self[index])
        }
        return sum / Double(count)
    }
    func endsWith(_ item: Item) -> Bool where Item: Equatable {
        return count >= 1 && self[count-1] == item
    }
}
let numbers = [1260, 1200, 98, 37]
print(numbers.average())
// Prints "648.75"
print(numbers.endsWith(37))
// Prints "true"
```

- 在元素是整数时，给 Container 添加了一个 average() 方法
- 在元素是可判等的情况下，添加了 endsWith(_:) 方法



- 不使用上下文 where 分句，就需要写两个扩展，每一个都要用范型 where 分句

```swift
extension Container where Item == Int {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += Double(self[index])
        }
        return sum / Double(count)
    }
}
extension Container where Item: Equatable {
    func endsWith(_ item: Item) -> Bool {
        return count >= 1 && self[count-1] == item
    }
}
```

- 用了上下文 where 分句， average() 和 endsWith(_:) 都写在了同一个扩展当中

## 具有泛型 Where 子句的关联类型

- 场景：给关联类型添加约束

- 要做一个包含遍历器的Container，要求遍历器 元素类型 = 容器元素类型

```swift
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
    
    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}
```

- 给继承的协议中关联类型添加限定，要求 Item 遵循 Comparable ：

```
protocol ComparableContainer: Container where Item: Comparable { }
```

## 泛型下标

语法：

- 在 subscript 后用尖括号来写类型占位符
- 还可在花括号前写泛型 where 分句

```swift
extension Container {
    subscript<Indices: Sequence>(indices: Indices) -> [Item]
        where Indices.Iterator.Element == Int {
            var result = [Item]()
            for index in indices {
                result.append(self[index])
            }
            return result
    }
}
```

- Container 协议的扩展添加了一个接收一系列索引并返回包含给定索引元素的数组
- 泛型下班有如下限定
  - 泛型形式参数 Indices 必须是遵循标准库中 Sequence 协议的某类型
  - 泛型 where 分句要求序列的遍历器元素，必须为 Int 类型的

# 不透明类型 - Opaque Types

- 场景：返回值使用泛型，会暴露具体类型
  - 不同于返回一个协议类型的值，不透明类型保持了类型的身份——编译器可以访问类型的信息，但模块的客户端不能

## 不透明类型解决的问题

- 泛型例子-使用 ASCII 绘制图像

```swift
protocol Shape {
    func draw() -> String
}
```

```swift
struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var result = [String]()
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}
let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())
// *
// **
// ***
```

- 使用泛型：翻转图形

```swift
struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}
let flippedTriangle = FlippedShape(shape: smallTriangle)
print(flippedTriangle.draw())
// ***
// **
// *
```

- 定义了一个 JoinedShape<T: Shape, U: Shape> 结构体，把两个图形垂直地结合在一起

```swift
JoinedShape<FlippedShape<Triangle>, Triangle>
```

```swift
struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}
let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
print(joinedTriangles.draw())
// *
// **
// ***
// ***
// **
// *
```

- 弊端：暴露了返回值类型，而且调用接口需要关心返回值类型

## 返回不透明类型

- 不透明类型当作泛型反义词
- 下面函数返回类型由调用时决定

```swift
func max<T>(_ x: T, _ y: T) -> T where T: Comparable { ... }
```

- x 、 y 值的类型决定了T 的具体类型



- 不透明类型：函数返回了一个梯形而没有暴露图形的类型

```swift
struct Square: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array<String>(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}
 
func makeTrapezoid() -> some Shape {
    let top = Triangle(size: 2)
    let middle = Square(size: 2)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(
        top: top,
        bottom: JoinedShape(top: middle, bottom: bottom)
    )
    return trapezoid
}
let trapezoid = makeTrapezoid()
print(trapezoid.draw())
// *
// **
// **
// **
// **
// *
```

- 声明了它的返回类型为 some Shape，函数返回一个遵循 Shape 协议的类型，而不需要标明具体类型，只要类型遵循 Shape 协议



- 泛型 + 不透明返回类型

```swift
func flip<T: Shape>(_ shape: T) -> some Shape {
    return FlippedShape(shape: shape)
}
func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
    JoinedShape(top: top, bottom: bottom)
}
 
let opaqueJoinedTriangles = join(smallTriangle, flip(smallTriangle))
print(opaqueJoinedTriangles.draw())
// *
// **
// ***
// ***
// **
// *
```



- 函数代码有多处 return 时，保证都是相同类型
- 返回类型也可用泛型类型参数，但必须保证单一类型

- 例子：包含方块特殊处理的图形翻转函数的*错误*版本：

```swift
func invalidFlip<T: Shape>(_ shape: T) -> some Shape {
    if shape is Square {
        return shape // Error: return types don't match
    }
    return FlippedShape(shape: shape) // Error: return types don't match
}
```



```swift
func `repeat`<T: Shape>(shape: T, count: Int) -> some Collection {
    return Array<T>(repeating: shape, count: count)
}
```

- 无论什么图形传入，repeat(shape:count:) 都会创建和返回这个图形的数组

- 依旧满足返回不透明类型的函数必须返回同一类型的约束

## 不透明类型和协议类型的区别

- 与使用协议类型作为函数返回类型非常相似
- 区别于它们是否保存类型特征
  - 不透明类型引用为特定的类型（调用者不能看到）
  - 议类型可以引用到任何遵循这个协议的类型



- 比如，这里有一个版本的 flip(_:) 它返回一个协议类型的值而不是不透明类型：

```swift
func protoFlip<T: Shape>(_ shape: T) -> Shape {
    return FlippedShape(shape: shape)
}
```

- protoFlip(_:) 返回的值并不要求总是返回相同的类型——只要遵循 Shape 协议就好
- protoFlip(_:) 使得 API 要求远比 flip(_:) 要松。它**保留了返回多种类型的弹性**

```swift
func protoFlip<T: Shape>(_ shape: T) -> Shape {
    if shape is Square {
        return shape
    }
 
    return FlippedShape(shape: shape)
}
// 函数返回的两个翻转过的图形可能拥有完全不同的类型
```

- protoFlip(_:) 具有更少的特定返回类型信息，意味依赖类型信息的操作无法完成

- 比如， == 运算符无法比较函数返回的结果

```swift
let protoFlippedTriangle = protoFlip(smallTriangle)
let sameThing = protoFlip(smallTriangle)
protoFlippedTriangle == sameThing  // Error
```

- 错误原因
  - Shape 并没有 == 作为自身协议的需求
  - 尝试添加，会遇到 == 运算符需要知道左手实际参数和右手实际参数的类型
- 弹性的代价就是返回值无法使用某些运算
- 另一个问题是图形转换不能嵌套



- 相反，不透明类型保持了具体类型的特征。Swift 可以推断相关类型

```swift
protocol Container {
    associatedtype Item
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
extension Array: Container { }
```

- 不能使用 Container 作为函数的返回类型，因为这个协议有一个关联类型
- 也不能使用它作为范型返回类型的约束，因为它在函数体外没足够信息推断它到底成为什么范型类型

```swift
// Error: Protocol with associated types can't be used as a return type.
func makeProtocolContainer<T>(item: T) -> Container {
    return [item]
}
 
// Error: Not enough information to infer C.
func makeProtocolContainer<T, C: Container>(item: T) -> C {
    return [item]
}
```

- 使用不透明类型 some Container 作为返回类型则能够表达期望的 API 约束——函数返回一个容器，但不指定特定的容器类型：

```swift
func makeOpaqueContainer<T>(item: T) -> some Container {
    return [item]
}
let opaqueContainer = makeOpaqueContainer(item: 12)
let twelve = opaqueContainer[0]
print(type(of: twelve))
// Prints "Int"
```

- 不透明容器的具体类型是 [T]

# 自动引用计数

- Swift 使用*自动引用计数*(ARC)机制来追踪和管理你的 App 的内存
- 当这些实例不在需要时，ARC会自动释放类实例所占用的内存。

> 引用计数只应用于类的实例。结构体和枚举是值类型，不是引用类型，没有通过引用存储和传递。

## 自动引用计数的工作机制

- 创建一个类的实例，ARC 分配一大块内存来存储这个实例的信息
  - 类型信息
  - 存储属性值的信息
- 当实例不需要时，ARC 会释放该实例所占用的内存
- 如果 ARC 释放了正在使用的实例内存，那么它将不会访问实例的属性，或者调用实例的方法
  - 如果你试图访问该实例，你的app很可能会崩溃
- ARC 会跟踪和计算当前实例被多少属性，常量和变量所引用。
  - 只要存在对该类实例的引用，ARC 将不会释放该实例。
  - 无论你将实例分配给属性，常量或变量，它们都会创建该实例的*强引用*
    - 称之为“强”引用，是因它将实例保持住，只要强引用在，实例是不允许被销毁的

## 自动引用计数实践

- 场景：实例内存的分配和释放操作

- 展示了自动引用计数的工作机制

```swift
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
```

- 由于可选类型的变量会被自动初始化为一个 nil 值，目前还不会引用到 Person 类的实例。

```swift
var reference1: Person?
var reference2: Person?
var reference3: Person?
```

```swift
reference1 = Person(name: "John Appleseed")
// prints "John Appleseed is being initialized"
```

- 现在就有了一个从reference1 到该实例的强引用

- 实例又会多出两个强引用：

```swift
reference2 = reference1
reference3 = reference1
```

- 给其中两个变量赋值 nil 的方式断开两个强引用

```swift
reference1 = nil
reference2 = nil
```

```swift
reference3 = nil
// prints "John Appleseed is being deinitialized"
```

## 类实例之间的循环强引用

- 场景：某个类*永远*不会变成零强引用 = 永远不会销毁
- 循环引用：两个类实例，彼此持有对方的强引用

- 循环引用解决：
  - 定义类之间的关系为弱引用( weak )或无主引用(unowned )来代替强引用
- 循环引用例子：

```swift
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}
 
class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}
```

- apartment 属性是可选项，因为一个人并不总是拥有公寓
- tenant 属性是可选的，因为一栋公寓并不总是有居民
- 反初始化时输出信息，Person 和 Apartment 的实例是否像预期的那样被释放



- 两个变量都被初始化为 nil ，这正是可选项的优点：

```swift
var john: Person?
var unit4A: Apartment?
```



- 创建特定的 Person 和 Apartment 实例并将其赋值给 john 和unit4A 变量

```swift
john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")
```



-  John 变量对Person 实例有一个强引用， unit4A 变量对 Apartment 实例有一个强引用

<img src="https://docs.swift.org/swift-book/_images/referenceCycle01_2x.png" alt="../_images/referenceCycle01_2x.png" style="zoom:67%;" />



- 感叹号( ! )是用来展开和访问可选变量 john 和 unit4A 里的实例的

```swift
john!.apartment = unit4A
unit4A!.tenant = john
```

- 两个实例联系在一起之后，强引用的关系如图

<img src="https://www.logcg.com/wp-content/uploads/2015/12/referenceCycle02_2x.png" alt="referenceCycle02_2x" style="zoom:50%;" />

- Person 实例现在有了一个指向Apartment 实例的强引用
- Apartment 实例也有了一个指向 Person 实例的强引用

- 断开 john 和 unit4A 变量持有的强引用，引用计数并不会降零，实例也不会被 ARC 释放

```swift
john = nil
unit4A = nil
```

- 没有任何一个反初始化器被调用

- 强引用关系如下图：

<img src="https://docs.swift.org/swift-book/_images/referenceCycle03_2x.png" alt="../_images/referenceCycle03_2x.png" style="zoom:50%;" />

## 解决实例之间的循环强引用

- 对于生命周期中会变为 nil 的实例使用弱引用
- 对于初始化赋值后再也不会被赋值为 nil 的实例，使用无主引用
- 上面的 Apartment 例子中，在它的声明周期中，有时是”没有居民”的/可选的，因此适合使用弱引用来解决循环强引用。

### 弱引用

- 不会对引用实例强引用，不会阻止 ARC 释放
- 语法：声明属性或者变量时，在前面加上 weak 关键字
- 置 nil 操作：ARC 会在**被弱引用的实例**被释放，自动地设置弱引用为 nil （由于弱引用需要允许它们的值为 nil ，它们一定得是可选类型）
- 检查弱引用的值是否存在，就像其他可选项的值一样，并且你将永远不会遇到“野指针”

> 在 ARC 给弱引用设置 nil 时不会调用属性观察者。

- Apartment 的 tenant 属性被声明为弱引用：

```swift
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}
 
class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}
```

```swift
var john: Person?
var unit4A: Apartment?
 
john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")
 
john!.apartment = unit4A
unit4A!.tenant = john
```

<img src="https://docs.swift.org/swift-book/_images/weakReference01_2x.png" alt="../_images/weakReference01_2x.png" style="zoom: 50%;" />

- Person 实例对 Apartment 实例强引用， Apartment 实例对Person 实例是*弱*引用
- 当你断开 john 变量所保持的强引用时，再也没有指向 Person 实例的强引用
- 实例会被释放：

```swift
john = nil
// prints "John Appleseed is being deinitialized"
```

- 没有强引用到 Person 它被释放掉了，并且 tenant 属性被设置为 nil 

<img src="https://docs.swift.org/swift-book/_images/weakReference02_2x.png" alt="../_images/weakReference02_2x.png" style="zoom:50%;" />

```swift
unit4A = nil
// prints "Apartment 4A is being deinitialized"
```

- 没有指向 Apartment 实例的强引用，该实例也会被释放：

<img src="https://cnswift.content-delivery.top/wp-content/uploads/2015/08/weakReference03_2x.png" alt="weakReference03_2x" style="zoom:50%;" />

> 注意
>
> 在使用垃圾回收机制的系统中，由于没有强引用的对象会在内存有压力时触发垃圾回收而被释放，弱指针有时用来实现简单的缓存机制。总之，对于 ARC 来说，一旦最后的强引用被移除，值就会被释放，这样的话弱引用就不再适合这类用法了。

### 无主引用

- 使用场景：非可选类型
- 优点：不需要在使用它的时候将它展开
- 缺点：ARC 无法在实例被释放后将无主引用设为 nil（因非可选类型变量不允许赋值为 nil）

> 如果你试图在实例的被释放后访问无主引用，那么你将触发运行时错误。

-  Customer 和 CreditCard ，模拟了银行客户和客户的信用卡

- 一个客户可能有或者没有信用卡，但是一张信用卡总是关联着一个客户
  - 新 CreditCard 实例只有通过 number 值和 customer 实例到CreditCard 的初始化器才能创建。
  - 确保 CreditCard 实例创建时总有 customer 实例

```swift
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}
 
class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}
```

> 注意: CreditCard 类的 number 属性定义为 UInt64 类型而不是 Int ，以确保 number 属性的存储量在32位和64位系统上都能足够容纳16位的卡号

```swift
var john: Customer?
```

```swift
john = Customer(name: "John Appleseed")
john!.card = CreditCard(number: 1234_5678_9012_3456， customer: john!)
```

- 关联了两个实例后的图示关系:

<img src="https://docs.swift.org/swift-book/_images/unownedReference01_2x.png" alt="../_images/unownedReference01_2x.png" style="zoom:50%;" />

- 断开 john 变量持有的强引用时，再也没有指向CreditCard 实例的强引用，该实例也随之被释放了

<img src="https://docs.swift.org/swift-book/_images/unownedReference02_2x.png" alt="../_images/unownedReference02_2x.png" style="zoom:50%;" />

```swift
john = nil
// prints "John Appleseed is being deinitialized"
// prints "Card #1234567890123456 is being deinitialized"
```

### 无主可选引用

- 场景：（非可选）无主引用不能为 nil，**无主可选引用可为 nil** （但不会自动置 nil）

- 使用无主可选引用时，需保证引用合法对象或 nil

- 追踪学校特定部门提供的课程

```swift
class Department {
    var name: String
    var courses: [Course]
    init(name: String) {
        self.name = name
        self.courses = []
    }
}
 
class Course {
    var name: String
    unowned var department: Department
    unowned var nextCourse: Course?
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextCourse = nil
    }
}
```

- Course 有两个无主引用，一个是到部门，另一个是下一门学生要上的课程

- 每一门课程都是某些部门的一部分，所以 department 不是可选的
- 课程并不包含推荐的后续课程， nextCourse 是可选的

```swift
let department = Department(name: "Horticulture")// 创建了一个部门以及它的三个课程
 
let intro = Course(name: "Survey of Plants", in: department)
let intermediate = Course(name: "Growing Common Herbs", in: department)
let advanced = Course(name: "Caring for Tropical Plants", in: department)
 // 初级和中级课程都有一个建议的后续课程存放在它们的 nextCourse 属性中
intro.nextCourse = intermediate
intermediate.nextCourse = advanced
department.courses = [intro, intermediate, advanced]
```

- nextCourse 维护了一个无主可选引用，指向了学生在完成本课程后应该继续的课程

<img src="https://docs.swift.org/swift-book/_images/unownedOptionalReference_2x.png" alt="../_images/unownedOptionalReference_2x.png" style="zoom: 50%;" />

- unowned 不能自动置nil，所以还是需要保证 nextCourse 指向了一个没有被释放的课程
- 从 department.courses 删除课程时，同样要移除其他课程对这个课程的引用

> 上述可选值的类型是 Optional ，也就是 Swift 标准库中的枚举。
>
> 总之，可选项是值类型不能被标记为unowned 这个规则中的例外。
>
> 包裹了类的可选项并不使用引用计数，所以你不需要对可选项维持强引用。

### 无主引用和隐式解包可选值属性 

- 循环引用-解决
  - 弱引用来解决：两个属性的值都允许为 nil
    - Person 和 Apartment 
  - 无主引用解决：一个属性的值允许为 nil ，而另一个属性的值不允许为 nil
    - Customer 和 CreditCard
  - 一个类用无主属性，另一个类用隐式展开的可选属性：
    - 两个属性都必须有值，并且初始化完成后永远不会为 nil 
- 两个类， Country 和 City 
  - 每个国家必须有首都，每个城市必须属于一个国家

```swift
class Country {
    let name: String
    var capitalCity: City! // 有一个默认值 nil,保证 Country 的实例完全初始化完后， Country 的初始化器才能把 self 传给 City 的初始化器
    init(name: String, capitalName: String) {
        self.name = name // 一旦 name 属性被赋值后， Country 的初始化器就能引用并传递隐式的 self
        self.capitalCity = City(name: capitalName, country: self)
    }
}
 
class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
```

- 以上的意义：通过一条语句同时创建 Country 和 City 的实例，而不产生循环强引用， capitalCity 的属性能被直接访问，二不需要可选绑定、强制展开

```swift
var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")
// prints "Canada's capital city is called Ottawa"
```

- 用隐式展开的可选属性的意义
  - 满足了两段式类初始化器的需求
  - capitalCity 属性初始化完成后，能像非可选项一样使用，同时还避免了循环强引用

## 闭包的循环强引用

- 闭包循环引用：比属性循环引用，多了变量捕获
- 场景：闭包赋值给实例属性，闭包又捕获这个实例
- 闭包捕获实例场景：
  - 闭包函数体访问了实例某个属性，比如self.someProperty
  - 闭包调用了一个实例的方法，例如self.someMethod()
- 闭包循环引用本质：闭包和类，都是*引用类型*



- 用一种简单的模型表示 HTML 中的一个单独的元素：

```swift
class HTMLElement {
    
    let name: String // 元素的名称，如表示标题元素的 "h1" 、代表段落元素的 "p" 、或者代表换行元素的 "br" 
    let text: String?// 可选的属性 text ，它可以用来设置和展现 HTML  元素的文本
    
  // 这个属性引用了一个将 name 和 text 组合成 HTML  字符串片段的闭包
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
}
```

- 由于 asHTML 是闭包，用自定义的闭包来取代默认值

```swift
let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())
// prints "<h1>some default text</h1>"
```

> asHTML 声明为 lazy 属性，因为只有当元素确实需要处理为 HTML 输出的字符串时，才需要使用asHTML 。
>
> 
>
> 实际上 asHTML 是**延迟加载属性**，意味在默认闭包可用 self ，因只有当初始化完成以及 self 确实存在后，才能访问延迟加载属性。

- 用 HTMLElement 类创建实例并打印消息

```swift
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
// prints"hello, world"
```



- HTMLElement 类产生了和 asHTML 默认值的闭包之间的循环强引用

<img src="https://docs.swift.org/swift-book/_images/closureReferenceCycle01_2x.png" alt="../_images/closureReferenceCycle01_2x.png" style="zoom:50%;" />

-  asHTML 属性持有闭包的强引用
- 闭包在其闭包体内使用了 self （引用了 self.name 和 self.text ），因此闭包捕获了 self ，这意味着闭包又反过来持有了 HTMLElement 实例的强引用

> 尽管闭包多次引用了 self ，它只捕获 HTMLElement 实例的一个强引用。

```swift
paragraph = nil
// 实例和它的闭包都不会被释放，也是因为循环强引用
```

- HTMLElement 的反初始化器中的消息并没有被打印，证明了 HTMLElement 实例并没有被销毁

## 解决闭包的循环强引用

- 场景：通过弱/无主引用，标记闭包捕获列表的变量，解决闭包和实例的循环引用

> 建议显式使用 self.someProperty 或者 self.someMethod （而不只是someProperty 或 someMethod ），有助于提醒捕获了 self ，避免循环引用

### 定义捕获列表（ closuer capture list ）

语法：

- weak / unowned  + 类实例的引用（如 self ） / 初始化过的变量（如 delegate = self.delegate! ）
- 中括号包裹，逗号隔开

- 放形式参数和返回值的前边

```swift
lazy var someClosure: (Int, String) -> String = {
    [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
    // closure body goes here
}
```

- 没有参数列表和返回值，把捕获列表放在关键字 in 前边

```swift
lazy var someClosure: () -> String = {
    [unowned self, weak delegate = self.delegate!] in
    // closure body goes here
}
```

### 弱引用和无主引用

- 闭包和捕获的实例总是互相引用并总是同时释放时：
  - 将闭包内的捕获定义为无主引用
- 被捕获的引用可能会变为 nil 时
  - 定义一个弱引用的捕获

```swift
如果被捕获的引用永远不会变为 nil ，应该用无主引用而不是弱引用。
```

- HTMLElement 例子中，无主引用是正确的解决循环强引用的方法

```swift
class HTMLElement {
    
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
}
```

- 创建并打印 HTMLElement 实例：

```swift
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
// prints "<p>hello, world</p>"
```

- 使用捕获列表后引用关系

![../_images/closureReferenceCycle02_2x.png](https://docs.swift.org/swift-book/_images/closureReferenceCycle02_2x.png)

- 闭包以无主引用的形式捕获 self ，并不会持有 HTMLElement 实例的强引用

```swift
paragraph = nil
// prints "p is being deinitialized"
```

# 内存安全

- Swift 安全性
  - 使用前就初始化
  - 内存在变量释放后不能再访问
  - 数组会检查越界错误
- Swift 还通过要求标记内存位置来确保代码对内存有独占访问权，以确保了同一内存多访问时不会冲突。
  - 了解一下什么情况下会潜在导致冲突
  - 避免写出对内存访问冲突的代码

## 理解内存访问冲突

- 出现场景：给变量赋值，或者传递参数给函数
- 比如说，下面代码同时包含了读取访问和写入访问：

```swift
// 向 one 所在的内存区域发起一次写操作
var one = 1

// 向 one 所在的内存区域发起一次读操作
print("We're number \(one)!")
```

- 添加预算项进入表里的时候，它只是在一个临时的，错误的状态，因为总数还没有被更新
- 在添加数据的过程中读取总数就会读取到错误的信息。

![../_images/memory_shopping_2x.png](https://docs.swift.org/swift-book/_images/memory_shopping_2x.png)

> 这里访问冲突的讨论是在单线程的情境下讨论的，并没有使用并发或者多线程。
>
> 在单线程遇到内存访问冲突，Swift 会保证你在要么编译时要么运行时得到错误。
>
> 对于多线程的代码，可以使用 Thread Sanitizer 去帮助检测多线程的冲突

### 内存访问性质

- 冲突会在两个访问，同时满足以下条件时发生：
  - 至少一个是写入访问；
  - 它们访问的是同一块内存；
  - 它们的访问时间重叠。
- 读和写访问的区别
  - 写访问会改变存储地址，而读操作不会（存储地址是指向正在访问的东西（例如一个变量，常量或者属性）的位置的值）
- 内存访问的时长要么是瞬时的，要么是长期的
- 瞬时访问：一个访问在启动后其他代码不能执行直到它结束后才能
- 两个即时访问不能同时发生
- 大多数内存访问都是即时

```swift
func oneMore(than number: Int) -> Int {
    return number + 1
}

var myNumber = 1
myNumber = oneMore(than: myNumber)
print(myNumber)
// 打印“2”
```

- 长期访问：会在别的代码执行时持续进行
  - 长期访问，可被别的长期访问、访问重叠
- 重叠访问场景
  - 使用 in-out 参数的函数和方法
  - 结构体的 mutating 方法里

## In-Out 参数的访问冲突

- 冲突本质：一个函数会对它所有的 in-out 参数进行长期**写**访问
- 顺序：
  - 所有非 in-out 参数处理完之后开始，直到函数执行完毕为止
  - 有多个 in-out 参数，则写访问开始的顺序与参数的顺序一致
- 不能在访问以 in-out 形式传入后的原变量，即使作用域原则和访问权限允许

```swift
var stepSize = 1// 全局变量

func increment(_ number: inout Int) {
    number += stepSize //  stepSize 的读访问与 number 的写访问重叠了
}

increment(&stepSize)
// 错误：stepSize 访问冲突
```

- `number` 和 `stepSize` 都指向了同一个存储地址
- 同一块内存的读和写访问重叠了

<img src="https://docs.swift.org/swift-book/_images/memory_increment_2x.png" alt="../_images/memory_increment_2x.png" style="zoom:50%;" />

- 解决 inout 参数访问冲突：拷贝一份 `stepSize`

```swift
// Make an explicit copy.
var copyOfStepSize = stepSize
increment(&copyOfStepSize)
 
// Update the original.
stepSize = copyOfStepSize
// stepSize is now 2
// stepSize is now 2
```

- 读访问在写操作之前就已经结束了，所以不会有冲突。



- 同一个函数的多个 in-out 参数里传入同一个变量，产生冲突

```swift
func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}
var playerOneScore = 42
var playerTwoScore = 30
balance(&playerOneScore, &playerTwoScore)  // 正常, 访问的是不同的内存位置
balance(&playerOneScore, &playerOneScore)// 同时访问同一个的存储地址。
// 错误：playerOneScore 访问冲突
```

> 操作符也是函数，也会对 in-out 参数进行长期访问
>
> `balance(_:_:)` 是一个名为 `<^>` 的操作符函数，那么 `playerOneScore <^> playerOneScore` 也会造成像 `balance(&playerOneScore, &playerOneScore)` 一样的冲突

## 方法里 self 的访问冲突

- 本质：结构体的 mutating 方法会在调用期间对 `self` 进行**写**访问

```swift
struct Player {
    var name: String
    var health: Int
    var energy: Int

    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}
```

- 不管有没有调用 self，只要 标记了mutating
  - 在上面的 `restoreHealth()` 方法里，一个对于 `self` 的写访问会从方法开始直到方法 return
  - 不可以对 `Player` **实例的属性**发起重叠的访问



- `shareHealth(with:)` 接受另一个 `Player` 的实例作为 in-out 参数，有访问重叠的可能性

```swift

extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}

var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria)  // 正常
```

- 把 `oscar` 玩家的血量分享给 `maria` 玩家
  - 方法调用时会对 `oscar` 发起写访问，在 mutating 方法里 `self` 就是 `oscar`
  - `maria` 也会发起写访问，因为 `maria` 作为 in-out 参数传入
  - 访问内存的不同位置。即使两个写访问重叠了，它们也不会冲突

![img](https://docs.swift.org/swift-book/_images/memory_share_health_maria_2x.png)

```swift
oscar.shareHealth(with: &oscar)
// 错误：oscar 访问冲突
```

- `self` 和 `teammate` 都指向了同一个存储地址
- 同一块内存同时进行两个写访问，并且它们重叠了，就此产生了冲突

<img src="https://docs.swift.org/swift-book/_images/memory_share_health_oscar_2x.png" alt="../_images/memory_share_health_oscar_2x.png" style="zoom:50%;" />



## 属性的访问冲突

- 出现场景：
  - 值类型：结构体，元组和枚举，由多个独立的值组成
  - 修改值的一部分都是对整个值的修改
  - 一个属性的读或写访问都需要访问整一个值
- 如，元组元素的写访问重叠会产生冲突：

```swift
var playerInformation = (health: 10, energy: 20)
balance(&playerInformation.health, &playerInformation.energy)
// 错误：playerInformation 的属性访问冲突
```

- 传入同一元组的元素对 `balance(_:_:)` 进行调用，产生了冲突，因为 `playerInformation` 的访问产生了写访问重叠
- 作为 in-out 参数传入
- 对于元组元素的写访问都需要对整个元组发起写访问



- 展示错误：对于一个存储在全局变量里的结构体属性的写访问重叠  (struct Player)

```swift
var holly = Player(name: "Holly", health: 10, energy: 10)
balance(&holly.health, &holly.energy)  // 错误
```

- 解决：将变量 `holly` 改为本地变量，而非全局变量，

```swift
func someFunction() {
    var oscar = Player(name: "Oscar", health: 10, energy: 10)
    balance(&oscar.health, &oscar.energy)  // 正常
}
// 两个存储属性任何情况下都不会相互影响(全局变量，传指针，局部变量传值)
```

- 遵循下面原则，编译器可保证结构体属性的重叠访问安全
  - 访问的是实例的存储属性，而非计算属性或类的属性
  - 结构体是本地变量的值，而非全局变量
  - 结构体要么没有被闭包捕获，要么只被非逃逸闭包捕获了

# 访问控制 - Access Control

- 使用场景：
  - 限制其他源文件和模块对代码的访问权限。
  - 封装隐藏代码的实现细节，只公开接口给人调用
- 适用范围：
  - 给单个类型（类、结构体、枚举）设置访问级别
    - 或单独给这些类型的属性、方法、构造器、下标等设置访问级别
  - 限定协议在一定访问级别的范围内使用
    - 包括协议里的全局常量、变量和函数
- 默认的访问级别
  - 不需代码中都显式声明访问级别
- 开发一个单 target 的应用程序
  - 完全可以不用显式声明代码的访问级别

> 对代码中可设置访问级别的特性（**属性、基本类型、函数**等），统一称之为“实体”（entities）。

## 模块和源文件 - Modules and Source Files

- 访问控制模型--两个概念：
  - 模块：单一的代码分配单元——一个框架或应用程序（a framework or application），一个模块可使用 `import` 关键字导入另外一个模块
    - 源文件：一个模块中的单个 Swift 源代码文件（事实上，是一个应用程序或是框架中的单个文件），通常在单独源文件中定义单个类型，但是一个源文件可以包含多个类型。函数等的定义
      - 实体

## 访问级别 - Access Levels

- **Swift 代码实体的五个访问级别**
  - *Open*（允许其他模块，继承和重写类和类成员） 和 *public*（禁止其他模块，继承和重写类：
    -  范围：可被本模块中所有源文件可访问，另一模块的源文件访问需要导入本模块
    - 应用：用 open 或 public 级别来指定框架的外部接口
  - *Internal* ：
    - 范围：本模块中所有源文件可访问，其他模块的源文件不能访问
    - 应用：接口只在应用程序或框架内部使用，设置为 internal 级别
  - *File-private*：
    - 范围：当前定义源文件可访问
    - 应用：功能接口实现，全在一个源文件，用 File-private 隐藏接口实现细节
  - *private*
    - 范围：在其定义的作用域可访问 + 同一源文件内的 extension 访问
    - 应用：接口只需在当前作用域内使用时，用 private 来将其隐藏

### 访问级别基本原则

- 总体指导准则 - overall guiding principle：实体不能定义在比自己访问级别低的实体中（至少要相同）
  - 访问级别：实体  ≥  定义实体的范围
- 例子：
  - 定义一个 public 的变量的类型，不能是 internal, file-private 或是 private，访问public 变量的地方，可能无法访问这个类型的权限，从而无法访问该 public 变量
  - 参数类型、返回类型 ≥ 函数，否侧可以调用函数，但无法范围参数和返回值

### 默认访问级别

- 定义实体时，不显式指定访问级别，一般默认访问级别为 `internal` （有一些情况会例外）
- 数情况下，不需要明确指定实体的访问级别

### 单 target 应用程序的访问级别

- 写单 target 应用程序，代码都在本应用使用并且不会在应用模块之外使用，internal 已匹配这种需求
  - 不需明确自定访问级别
  - 若要对模块中其他代码隐藏接口实现细节，标注为 file private 或private

### 框架的访问级别 - Access Levels for Frameworks

- 因默认 internal，但框架接口要给外部调用，所以定义为 open 或 public 
  - 对外的接口，就是这个框架的 API

> 内部实现仍可用默认 `internal`，隐藏细节可用 `private` 或 `fileprivate`
>
> 框架的对外 API 部分，需要将它们设置为 `open` 或 `public` 了

### 单元测试 target 的访问级别

- 默认 open 或 public 的才可跨模块访问
- 应用程序有单元测试 target 时，测试模块要访问应用程序模块的代码
  - 在导入应用程序模块的语句前使用 `@testable` 特性
  - 允许测试的编译设置（`Build Options -> Enable Testability`）下编译这个应用程序模块
  - 单元测试 target 就可以访问应用程序模块中所有内部级别的实体

## 访问控制语法

- 通过修饰符 `open`、`public`、`internal`、`fileprivate`、`private` 来声明实体的访问级别：

```swift
public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}
```

- 除非已经标注，否则都会使用默认的 internal 访问级别

```swift
class SomeInternalClass {}   // 隐式 internal
var someInternalConstant = 0 // 隐式 internal
```

## 自定义类型

- 一个类型的访问级别会影响类型*成员*（属性、方法、构造器、下标）的默认访问级别
- 将**类型**定为 `private` 或 `fileprivate` ，该**类型成员**默认访问级别也变成 `private` 或 `fileprivate` 级别
- **类型**指定为 `internal` 或 `public`（或者不明确指定访问级别，而使用默认的 `internal` ），该类型**所有成员**的默认访问级别将是 `internal`

> 一个 `public` 类型的所有成员的访问级别默认为 `internal` 级别，而不是 `public` 级别
>
> 如果你想将某个成员指定为 `public` 级别，必须显式指定
>
> 这样做的好处是，在你定义公共接口的时候，可以明确地选择哪些接口是需要公开的，哪些是内部使用的，**避免不小心将（类型）内部使用的接口公开**

```swift

public class SomePublicClass {                  // 显式 public 类
    public var somePublicProperty = 0            // 显式 public 类成员
    var someInternalProperty = 0                 // 隐式 internal 类成员
    fileprivate func someFilePrivateMethod() {}  // 显式 fileprivate 类成员
    private func somePrivateMethod() {}          // 显式 private 类成员
}

class SomeInternalClass {                       // 隐式 internal 类
    var someInternalProperty = 0                 // 隐式 internal 类成员
    fileprivate func someFilePrivateMethod() {}  // 显式 fileprivate 类成员
    private func somePrivateMethod() {}          // 显式 private 类成员
}

fileprivate class SomeFilePrivateClass {        // 显式 fileprivate 类
    func someFilePrivateMethod() {}              // 隐式 fileprivate 类成员
    private func somePrivateMethod() {}          // 显式 private 类成员
}

private class SomePrivateClass {                // 显式 private 类
    func somePrivateMethod() {}                  // 隐式 private 类成员
}
```

### 元组类型

- 由元级别最严格的类型（元素）来决定
- 如，构建一个包含两种不同类型的元组，其中一个为 `internal`，另一个类型为 `private`，那么这元组的访问级别为 `private`。

> 元组不同于类、结构体、枚举、函数那样有单独的定义。
>
> 一个元组的访问级别由元组中元素的访问级别来决定的，不能被显式指定。

### 函数类型

- 根据**最严格的参数类型或返回类型**的访问级别来决定
- 如不符合函数定义所在环境的默认访问级别，需明确指定函数访问级别



- 按下面这种写法，代码将无法通过编译：

```swift
func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    // 此处是函数实现部分
}
```

- 返回类型-该元组的访问级别是 `private`
- 必须使**明确**用 `private` 修饰符来明确指定该函数的访问级别

```swift
private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    // 此处是函数实现部分
}
```

- 该**函数当做 `public` 或 `internal` 级别来使用的话**，可能会无法访问 `private` 级别的返回值

[![DsCXJs.png](https://s3.ax1x.com/2020/11/27/DsCXJs.png)](https://imgchr.com/i/DsCXJs)

### 枚举类型

- 成员的访问级别和该枚举类型相同
- 不能为枚举成员单独指定不同的访问级别

```swift
public enum CompassPoint {
    case north
    case south
    case east
    case west
}
// CompassPoint 被明确指定为 public，那么它的成员 north、south、east、west 的访问级别同样也是 public：
```

### 原始值和关联值

- 原始值、关联值的类型的访问级别至少不能低于枚举类型的访问级别
- 如不能在一个 `internal` 的枚举中定义 `private` 的原始值类型

### 嵌套类型 - Nested Types

- 嵌套类型的访问级别 = 包含它的类型的访问级别
  - private 级别的类型中定义的嵌套类型自动为 private 级别
  - fileprivate 级别的类型中定义的嵌套类型自动为 fileprivate 级别
  - public 或 internal 级别的类型中定义的嵌套类型自动为 internal 级别
  - **想让嵌套类型是 public 级别的，必须显式指明为 public**

## 子类

- 可继承同一模块中的所有访问权限的类，也可继承不同模块被 open 修饰的类
- 子类不得高于父类（子类 ≤ 父类）
  - 如，父类是 `internal`，子类不能是 `public`
  - 可重写类成员（方法，属性，初始化器或下标）

![DcNEDI.png](https://s3.ax1x.com/2020/11/29/DcNEDI.png)



- 提高父类权限：对 someMethod() 函数进行了重写即改为“internal”级别，这比 someMethod() 的原本实现级别*更高*

```swift
public class A {
         fileprivate func someMethod() {}
}
internal class B: A {
         override internal func someMethod() {}
}
```

- 类 A 和子类 B 定义在同一个源文件中，那么 B 类可以在 someMethod() 中调用父类的 someMethod() 

## 常量、变量、属性、下标

- 常量、变量、属性不能拥有比它们类型更高的访问级别。
  - 如，你不能写一个public 的属性而它的类型是 private 的
- 下标也不能拥有比索引类型或返回类型更高的访问级别

```swift
private var privateInstance = SomePrivateClass()
```

### Getter 和 Setter 

- getter 和 setter 和它们所属常量、变量、属性和下标的访问级别相同
- `Setter` 的访问级别可低于 `Getter` ，从而控制读写权限
- 语法：`var` 或 `subscript` 关键字之前，你可以通过 `fileprivate(set)`，`private(set)` 或 `internal(set)` 为它们的写入权限指定更低的访问级别

>这规则适用于存储型和计算型属性。
>
>即使你不明确指定**存储型属性**的 `Getter` 和 `Setter`，Swift 也会隐式创建 `Getter` 和 `Setter`

- `TrackedString` 的结构体，记录了 `value` 属性被修改的次数：

```swift
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}
```

- numberOfEdits 属性的 Getter 依然是默认的访问级别 internal
- `Setter` 的访问级别是 `private`，这表示该属性只能在内部修改，而在结构体的外部则表现为一个只读属性

```swift
var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")
// 打印“The number of edits is 3”
```

- 可在其他的源文件中获取 `numberOfEdits` 属性的值，但不能对其赋值



- 将 `TrackedString` 结构体明确为 `public`
- 结构体的成员（包括 `numberOfEdits` 属性）拥有默认的访问级别 `internal`
- 结合 `public` 和 `private(set)` 修饰符
  - 把结构体中的 `numberOfEdits` 属性的 `Getter` 的访问级别设置为 `public`
  - 而 `Setter` 的访问级别设置为 `private`：

```swift
public struct TrackedString {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    public init() {}
}
```

## 构造器

- 自定义构造器
  - 可低于或等于所属类型
-  必要构造器
  - 必须和所属类型的访问级别相同
- 类似函数或方法，构造器参数不能低于构造器本身的访问级别

### 默认构造器

- Swift 会为结构体和类提供一个**默认的无参数**的构造器（前提条件：给存储属性赋初值 + 未定义构造器）
- 默认构造器的访问级别与所属类型的访问级别相同
  - 类型被指定为 `public` 级别，那么默认构造器的访问级别将为 `internal`
- 希望在其他模块中使用这种无参数的默认构造器，自己提供一个 `public` 访问级别的无参数构造器

### 结构体默认的成员逐一构造器

- 任意存储型属性的访问级别为 `private`，成员逐一构造器的访问级别就是 `private`。否则，这种构造器的访问级别依然是 `internal`。
- 希望一个 `public` 级别的结构体也能在其他模块中使用其默认的成员逐一构造器，只能自己提供一个 `public` 访问级别的成员逐一构造器

## 协议

- 限制该协议只能在适当的访问级别范围内被遵循。
- 协议中的每个方法或属性都必须和该协议相同的访问级别
  - 不能将协议中的方法或属性设置为其他访问级别
  - 才能确保该协议的所有方法或属性对于任意遵循者都可用。

### 协议继承

- 新协议和被继承协议的访问级别相同
  - 如，不能将继承自 `internal` 协议的新协议定为 `public` 协议。

### 协议遵循

- 一个类型可遵循比它级别更低的协议
  - 一个 `public` 级别类型，如果遵循一个 `internal` 协议，**遵循的部分**只能在这 `internal` **协议所在的模块中使用**
- 遵循了协议的类，取协议和类的访问级别的最小者
  - 如类型是 public ，遵循协议 internal 级别，这个类型就是 internal 级别的

- 写或扩展一个类型让它遵循一个协议时，类按协议要求的实现方法与该协议的访问级别一致
  - 一个 `public` 类型遵循一个 `internal` 协议，这个类型对协议的所有实现至少都应是 `internal` 级别的

> Swift 和 Objective-C 一样，协议遵循是全局的，也就是说，在同一程序中，一个类型不可能用两种不同的方式实现同一个协议。

## 扩展 - Extension

- Extension 的新增成员有和原始类型成员一致的访问级别
  -  extension 一个 `public` 或者 `internal` 类型， extension 中的成员默认为 `internal` 访问级别
  - 用 extension 扩展一个 `fileprivate` 类型，则 extension 中的成员默认使用 `fileprivate` 访问级别
  - 用 extension 扩展了一个 `private` 类型，则 extension 的成员默认使用 `private` 访问级别
- 可以重新指定 extension 的默认访问级别（例如，`private`），从而给 extension 中所有成员一个新默认访问级别
- **用 extension 来遵循协议的话**，就不能显式地声明 extension 的访问级别
  - extension 每个 protocol 要求的实现都默认使用 protocol 的访问级别

### Extension 的私有成员

- 扩展**同一文件内**的类，结构体或者枚举，extension 里的代码会表现得跟声明在原类型里的一模一样。也就是说你可以这样：
  - 在类型的声明里，声明一个私有成员，在同一文件的 extension 里访问。
  - 在 extension 里声明一个私有成员，在同一文件的另一个 extension 里访问。
  - 在 extension 里声明一个私有成员，在同一文件的类型声明里访问。
- 可以使用 extension 来组织你的代码，而且不受私有成员的影响

```swift
protocol SomeProtocol {
    func doSomething()
}
```

- 使用 extension 来遵循协议，就像这样：

```swift
struct SomeStruct {
    private var privateVariable = 12
}

extension SomeStruct: SomeProtocol {
    func doSomething() {
        print(privateVariable)
    }
}
```

## 泛型

- 泛型类型或泛型函数，取决于泛型类型或泛型函数本身的访问级别
  - 还需结合类型参数的类型约束的访问级别
  - 根据这些访问级别中的最低访问级别来确定

## 类型别名

- 类型别名的访问级别，不能高于原类型
  - `private` 级别的类型别名可以作为 `private`、`fileprivate`、`internal`、`public` 或者 `open` 类型的别名
  - 但是 `public` 级别的类型别名只能作为 `public` 类型的别名，不能作为 `internal`、`fileprivate` 或 `private` 类型的别名。

> 这条规则也适用于为满足协议遵循而将类型别名用于关联类型的情况。

# 高级运算符 - Advanced Operators

- Swift 运算符
  - 基本运算符
  - 高级运算符（包括 C 或 Objective-C 所有按位和移位运算符。）
- 与 C 的算术运算符不同，Swift 算术运算符默认是不会溢出的。
  - 所有溢出行为都会被捕获并报告为错误。
  - 如果想让系统允许溢出行为，可用 Swift 支持溢出的运算符
  - 如溢出加法运算符（`&+`）。所有溢出运算符都以 `&` 开头的。
- 中缀、前缀、后缀和赋值运算符，它们具有自定义的优先级与关联值。
- 可扩展已有的类型以支持自定义运算符。

## 位运算符
- 操作数据结构中，每个独立的比特位
- 使用场景：
  - 底层开发中，比如图形编程和创建设备驱动
  - 处理外部资源的原始数据，对自定义通信协议传输的数据进行编码和解码
- Swift 支持 C 语言中的全部位运算符

### Bitwise NOT Operator（按位取反运算符）

- *按位取反运算符（**`~`**）*
  - 对一个数值的全部比特位进行取反：

<img src="https://docs.swift.org/swift-book/_images/bitwiseNOT_2x.png" alt="img" style="zoom:50%;" />

- 前缀运算符，直接放在运算数之前，并且它们之间不能添加任何空格：

```swift
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits // 等于 0b11110000
```

### Bitwise AND Operator（按位与运算符）

- *按位与运算符（**`&`**）* 对两个数的比特位进行合并
- 返回一个新的数，只有当两个数的对应位*都*为 `1` 的时候，新数的对应位才为 `1`：

<img src="https://docs.swift.org/swift-book/_images/bitwiseAND_2x.png" alt="img" style="zoom:50%;" />

```swift
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8  = 0b00111111
let middleFourBits = firstSixBits & lastSixBits // 等于 00111100
```

### Bitwise OR Operator（按位或运算符）

- *按位或运算符（**`|`**）*可以对两个数的比特位进行比较
- 只要两个数的对应位中有*任意一个*为 `1` 时，新数的对应位就为 `1`：

<img src="https://docs.swift.org/swift-book/_images/bitwiseOR_2x.png" alt="img" style="zoom:50%;" />

```swift
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits // 等于 11111110
```

### Bitwise XOR Operator（按位异或运算符）

- *按位异或运算符*，或称“排外的或运算符”、“互斥或”（`^`）
- 当两个数的对应位不相同时，新数的对应位就为 `1`，并且对应位相同时则为 `0`：

<img src="https://docs.swift.org/swift-book/_images/bitwiseXOR_2x.png" alt="img" style="zoom:50%;" />

```swift
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits // 等于 00010001
```

### Bitwise Left and Right Shift Operators（按位左移、右移运算符）
- *按位左移运算符（**`<<`**）* 和 *按位右移运算符（**`>>`**）*
- 对一个数的所有位进行指定位数的左移和右移
- 本质：相当于对这个数进行乘以 2 或除以 2 的运算
  - 左移一位，等价于将这个数乘以 2
  - 右移一位，等价于将这个数除以 2。

#### 无符号整数的移位运算

- 无符号整数进行移位的规则：

1. 已存在的位按指定的位数进行左移和右移。
2. 任何因移动而超出整型存储范围的位都会被丢弃。
3. 用 `0` 来填充移位后产生的空白位。



- 蓝色的数字是被移位的，灰色的数字是被抛弃的，橙色的 `0` 则是被填充进来的：

<img src="https://docs.swift.org/swift-book/_images/bitshiftUnsigned_2x.png" alt="img" style="zoom:50%;" />

- 演示了 Swift 中的移位运算：

```swift
let shiftBits: UInt8 = 4 // 即二进制的 00000100
shiftBits << 1           // 00001000
shiftBits << 2           // 00010000
shiftBits << 5           // 10000000
shiftBits << 6           // 00000000
shiftBits >> 2           // 00000001
```

- 用移位运算对其他的数据类型进行编码和解码：

```swift
let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16  // redComponent 是 0xCC，即 204
let greenComponent = (pink & 0x00FF00) >> 8 // greenComponent 是 0x66， 即 102
let blueComponent = pink & 0x0000FF         // blueComponent 是 0x99，即 153
```

#### 有符号整数的移位运算

- 以下的示例基于 8 比特的有符号整数，但原理对任何位数的有符号整数都是通用的。
- 有符号整数用第 1 个比特位（通常被称为*符号位*）表示正负。
  - 符号位为 `0` 代表正数，为 `1` 代表负数。
- 其余的比特位（通常被称为*数值位*）存储了实际的值。
- 有符号正整数和无符号数的存储方式是一样的，都是从 `0`开始算起。



- 这是值为 `4` 的 `Int8` 型整数的二进制位表现形式：

<img src="https://docs.swift.org/swift-book/_images/bitshiftSignedFour_2x.png" alt="img"  />

- 值为 `-4` 的 `Int8` 型整数的二进制表现形式：

![img](https://docs.swift.org/swift-book/_images/bitshiftSignedMinusFour_2x.png)

- 符号位为 `1`，说明这是一个负数，另外 7 个位则代表了数值 `124`（即 `128 - 4`）的二进制表示：

![img](https://docs.swift.org/swift-book/_images/bitshiftSignedMinusFourValue_2x.png)

- 负数的表示通常被称为*二进制补码*
  - 存储最大值： `2` 的 `n` 次方减去其实际值的绝对值
  - 一个 8 比特位的数有 7 个比特位是数值位，所以是 `2` 的 `7` 次方，即 `128`。
- 对 `-1` 和 `-4` 进行加法运算
- 只需要对这两个数的全部 8 个比特位执行标准的二进制相加（包括符号位）
- 将计算结果中超出 8 位的数值丢弃：

![img](https://docs.swift.org/swift-book/_images/bitshiftSignedAddition_2x.png)

- 二进制补码可以使负数的按位左移和右移运算得到跟正数同样的效果
- 要达到此目的，对有符号整数的右移有一个额外的规则：
  - 当对有符号整数进行按位右移运算时，遵循与无符号整数相同的规则
  - 但是对于移位产生的空白位使**用*符号位*进行填充，而不是用 `0`。**

![img](https://docs.swift.org/swift-book/_images/bitshiftSigned_2x.png)

- 这通常被称为*算术移位*。
- 移位的过程中保持符号位不变，意味着负整数在接近零的过程中会一直保持为负。

## 溢出运算符 - Overflow Operators

- Swift 溢出会直接报错

- Int16 有符号整数范围是 -32768 到 32767 ，当为一个Int16 型变量赋的值超过这个范围时，系统就会报错：

```swift
var potentialOverflow = Int16.max
// potentialOverflow equals 32767, which is the maximum value an Int16 can hold
potentialOverflow += 1
// this causes an error
```

- 故意想要溢出来截断可用位的数字时，也可以选择这么做而非报错
- Swift 提供三个算数*溢出运算符*来让系统支持整数溢出运算。这些运算符都是以 & 开头的：
  - 溢出加法 （ &+ ）
  - 溢出减法 （ &- ）
  - 溢出乘法 （ &* ）

### 数值溢出

- 上溢或者下溢。

- 对一个无符号整数使用溢出加法（`&+`）进行上溢运算时会发生什么：

```swift
var unsignedOverflow = UInt8.max
// unsignedOverflow 等于 UInt8 所能容纳的最大整数 255
unsignedOverflow = unsignedOverflow &+ 1
// 此时 unsignedOverflow 等于 0
```

- 如下图所示。数值溢出后，仍然留在 `UInt8` 边界内的值是 `00000000`，也就是十进制数值的 `0`。

![img](https://docs.swift.org/swift-book/_images/overflowAddition_2x.png)

- 使用溢出减法运算符（`&-`）的例子：

```swift
var unsignedOverflow = UInt8.min
// unsignedOverflow 等于 UInt8 所能容纳的最小整数 0
unsignedOverflow = unsignedOverflow &- 1
// 此时 unsignedOverflow 等于 255
```

- 对其进行减 `1` 运算时，数值会产生下溢并被截断为 `11111111`， 也就是十进制数值的 `255`

![img](https://docs.swift.org/swift-book/_images/overflowUnsignedSubtraction_2x.png)



- 溢出也会发生在有符号整型上。
  - 针对有符号整型的所有溢出加法或者减法运算都是按位运算的方式执行的
  - 符号位也需要参与计算，正如 按位左移、右移运算符 所描述的。

```swift
var signedOverflow = Int8.min
// signedOverflow 等于 Int8 所能容纳的最小整数 -128
signedOverflow = signedOverflow &- 1
// 此时 signedOverflow 等于 127
```

- `Int8` 型整数能容纳的最小值是 `-128`，以二进制表示即 `10000000`。当使用溢出减法运算符对其进行减 `1` 运算时，符号位被翻转，得到二进制数值 `01111111`，也就是十进制数值的 `127`，这个值也是 `Int8` 型整所能容纳的最大值。

<img src="https://docs.swift.org/swift-book/_images/overflowSignedSubtraction_2x.png" style="zoom:67%;" />

- 对于无符号与有符号整型数值来说，当出现上溢时，它们会从数值所能容纳的最大数变成最小数。
- 当发生下溢时，它们会从所能容纳的最小数变成最大数。

## 优先级和结合性

- 场景：计算顺序

- 高优先级的运算符会先被计算
- *结合性*定义了**相同优先级的运算符**是如何结合的，是与左边结合为一组，还是与右边结合为一组。

```swift
2 + 3 % 4 * 5
// 结果是 17
```

- 从左到右进行运算
  - 2 + 3 = 5
  - 5 % 4 = 1
  - 1 * 5 = 5
- 与 C 语言类似，在 Swift 中，乘法运算符（`*`）与取余运算符（`%`）的优先级高于加法运算符（`+`）
- 乘法运算与取余运算的优先级*相同*

- 为这两部分表达式都隐式地加上括号：

```swift
2 + ((3 % 4) * 5)
```

- `(3 % 4)` 等于 `3`，所以表达式相当于：

```swift
2 + (3 * 5)
```

- `3 * 5` 等于 `15`，所以表达式相当于：

```swift
2 + 15
```

- 因此计算结果为 `17`。

## 运算符函数

- 运算符*重载*：类和结构体，为现有运算符提供自定义的实现
- 让自定义的结构体支持加法运算符（`+`）
- *中缀*运算符：算术加法运算符是一个*二元运算符*，因为它是对两个值进行运算，出现在两个值中间。



- 定义了一个名为 `Vector2D` 的结构体用来表示二维坐标向量 `(x, y)`
- 定义了一个可以将两个 `Vector2D` 结构体实例进行相加的*运算符函数*：

```swift
struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
  // 接收两个类型为 Vector2D 的参数，同时有一个 Vector2D 类型的返回值
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}
```

- 因为加法运算并**不是一个向量必需的功能**，所以这个类方法被定义在 `Vector2D` 的一个扩展中
- 函数返回一个新的 `Vector2D` 实例，这个实例的 `x` 和 `y` 分别等于作为参数的两个实例的 `x` 和 `y` 的值之和



- 可以在任意两个 `Vector2D` 实例中间作为中缀运算符来使用

```swift
let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
// combinedVector 是一个新的 Vector2D 实例，值为 (5.0, 5.0)
```

- 例子实现两个向量 `(3.0，1.0)` 和 `(2.0，4.0)` 的相加，并得到新的向量 `(5.0，5.0)`。这个过程如下图示：

<img src="https://docs.swift.org/swift-book/_images/vectorAddition_2x.png" alt="img" style="zoom: 50%;" />

### 前缀和后缀运算符

- 一元运算符只运算一个值
  - 运算符出现在值之前时，它就是*前缀*的（例如 `-a`）
  - 出现在值之后时，它就是*后缀*的（例如 `b!`）

- 语法：在声明运算符函数的时候在 `func` 关键字之前指定 `prefix` 或者 `postfix` 修饰符：

```swift
extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}
```

```swift
let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
// negative 是一个值为 (-3.0, -4.0) 的 Vector2D 实例
let alsoPositive = -negative
// alsoPositive 是一个值为 (3.0, 4.0) 的 Vector2D 实例
```

### 复合赋值运算符

- 复合赋值运算符：赋值运算符（`=`）与其它运算符进行结合
  - 如，将加法与赋值结合成加法赋值运算符（`+=`）
- 实现的时候，需要把运算符的左参数设置成 `inout` 类型，因为这个参数的值会在运算符函数内直接被修改

```swift
extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}
```

- 加法运算在之前已经定义过了，所以在这里无需重新定义
- 直接利用现有的加法运算符函数，用它来对左值和右值进行相加，并再次赋值给左值

```swift
var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd
// original 的值现在为 (4.0, 6.0)
```

> 不能对默认的赋值运算符（`=`）进行重载
>
> 只有复合赋值运算符可以被重载
>
> 也无法对三元条件运算符 （`a ? b : c`） 进行重载

### 等价运算符

- 等价运算符通常被称为*相等*运算符（`==`）与*不等*运算符（`!=`）
- 场景：自定义的类和结构体对*等价运算符*进行默认实现
- 实现的方法与其它中缀运算符一样, 并且增加对标准库 `Equatable` 协议的遵循：

```swift
extension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}
```

- 标准库 `Equatable` 协议对于“不等”运算符有默认的实现，它简单地将“相等”运算符的结果进行取反后返回

- 使用

```swift
let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}
// 打印“These two vectors are equivalent.”
```

## 自定义运算符

- 场景：除了重载运算符，还可以声明和实现*自定义运算符*
  - 用来自定义运算符的字符列表请参考 [运算符]()
- 语法：
  - `operator` 关键字：在全局作用域内进行定义
  - 指定 `prefix`、`infix` 或者 `postfix` 修饰符

```swift
prefix operator +++
```

- `+++` 被实现为“前缀双自增”运算符
  - 使用了前面定义的复合加法运算符来让矩阵与自身进行相加
  - 从而让 `Vector2D` 实例的 `x` 属性和 `y` 属性值翻倍
- 实现：

```swift
extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled
// toBeDoubled 现在的值为 (2.0, 8.0)
// afterDoubling 现在的值也为 (2.0, 8.0)
```

### 自定义中缀运算符的优先级

- 场景：相对于前缀、后缀这种单目运算符，中缀为双目运算符
- 定义了一个新的自定义中缀运算符 `+-`，此运算符属于 `AdditionPrecedence` (“相加型”)优先组：

```swift
infix operator +-: AdditionPrecedence
extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
// plusMinusVector 是一个 Vector2D 实例，并且它的值为 (4.0, -2.0)
```

- 这个运算符把两个向量的 `x` 值相加，同时从第一个向量的 `y` 中减去第二个向量的 `y` 。
- 因为它本质上是属于“相加型”运算符，所以将它放置在 `+` 和 `-` 等默认中缀“相加型”运算符相同的优先级组中。
- 关于 Swift 标准库提供的运算符，以及完整的运算符优先级组和结合性设置，请参考 [运算符声明](https://developer.apple.com/documentation/swift/operator_declarations)。
- 而更多关于优先级组以及自定义操作符和优先级组的语法，请参考 [运算符声明]()。

> 当定义前缀与后缀运算符的时候，我们并没有指定优先级。
>
> 然而，如果对同一个值同时使用前缀与后缀运算符，则后缀运算符会先参与运算。

# 语言参考

