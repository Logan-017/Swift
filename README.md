# 简介
- Swift学习笔记 + 练习代码。

- 参考资料：
  - [Swift官方文档](https://docs.swift.org/swift-book/)
  - [SwiftGG翻译组](https://swiftgg.gitbook.io/swift/)


# 开始使用Swift
## Swift一些特性
- 运行设备：手机，台式机，服务器
- 支持代码预览（playgrounds），不编译和运行Swift 代码，实时查看结果
- 采用现代编程模式，避免编程错误：
  - 变量始终在使用前初始化。
  - 检查数组索引超出范围的错误。
  - 检查整数是否溢出。
  - 可选值确保明确处理 nil 值。
  - 内存被自动管理。
  - 错误处理允许从意外故障控制恢复。

## 版本兼容性与迁移
-  Xcode 12默认 Swift 版本 Swift 5.3
-  可以使用 Xcode 12 来构建 Swift 5.3、Swift 4.2 或 Swift 4 写的项目

-  使用 Xcode 12 构建 Swift 4 和 Swift 4.2 代码时，Swift 5.3 的大多数功能都适用。但以下功能仅支持 Swift 5.3 或更高版本:
  - 返回值是不透明类型的函数依赖 Swift 5.1 运行时；
  - try? 表达式不会为已返回可选类型的代码引入额外的可选类型层级。
  - 大数字的整型字面量初始化代码的类型将会被正确推导，例如 UInt64(0xffff_ffff_ffff_ffff) 将会被推导为整型类型而非溢出。
- Swift 5.3 写的项目可以依赖用 Swift 4.2 或 Swift 4 写的项目，swift  Swift 5.3 写的项目可以依赖用 Swift 4.2 或 Swift 4 写的项目 如果你将一个大的项目分解成多个框架（framework），你可以逐个地将框架从 Swift 4 代码迁移到 Swift 5.3。

## Swift之旅
- 国际惯例

```swift
 print("Hello, world!")
```
- 无需在代码结尾写分号
- 无需为输入输出函数，或字符串处理导入一个库
- 无需写main()函数，全局作用域中的代码会被自动当做程序的入口点

### 简单值
### 控制流
### 函数和闭包
### 对象和类
### 枚举和结构体
### 协议和扩展
### 错误处理
### 泛型

## Swift 版本修订记录
[中文](https://swiftgg.gitbook.io/swift/huan-ying-shi-yong-swift/04_revision_history)
[英文](https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html)

# Swift 教程
## 基础部分
--
### 常量和变量
### 声明常量和变量
### 类型注解
### 常量和变量的命名
### 输出常量和变量
--
### 注释
--
### 分号
--
### 整数
#### 整数范围
#### Int
#### UInt
--
### 浮点数
--
### 类型安全和类型推断
--
### 数值型字面量
--
### 数值型类型转换
#### 整数转换
#### 整数和浮点数转换
--
### 类型别名
--
### 布尔值
--
### 元组
--
### 可选类型
#### nil
#### if 语句以及强制解析
#### 可选绑定
#### 隐式解析可选类型
--
### 错误处理
--
### 断言和先决条件
#### 使用断言进行调试
#### 强制执行先决条件


# 基本运算符
--
## 术语
--
## 赋值运算符
--
## 算术运算符
### 求余运算符
### 一元负号运算符
### 一元正号运算符
--
## 组合赋值运算符
--
## 比较运算符（Comparison Operators）
--
## 三元运算符（Ternary Conditional Operator）
--
## 空合运算符（Nil Coalescing Operator）
--
## 区间运算符（Range Operators）
### 闭区间运算符
### 半开区间运算符
### 单侧区间
--
## 逻辑运算符（Logical Operators）
### 逻辑非运算符
### 逻辑与运算符
### 逻辑或运算符
### 逻辑运算符组合计算
### 使用括号来明确优先级