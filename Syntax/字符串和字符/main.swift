//
//  main.swift
//  字符串和字符
//
//  Created by David on 2020/10/1.
//

import Foundation

// MARK:- 多行字符串 - 为代码可读性，可在代码里加反斜杠（`\`），对字符串换行（输出的字符串不换行, 且没有反斜杠）
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
print(softWrappedQuotation)
print("--------------------")


// MARK:- 特殊字符
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imageination is more important than knowledge" - Enistein
let dollarSign = "\u{24}"             // $，Unicode 标量 U+0024
let blackHeart = "\u{2665}"           // ♥，Unicode 标量 U+2665
let sparklingHeart = "\u{1F496}"      // 💖，Unicode 标量 U+1F496
print("wiseWords = \(wiseWords)")
print("dollarSign = \(dollarSign)")
print("blackHeart = \(blackHeart)")
print("sparklingHeart = \(sparklingHeart)")
print("--------------------")

// MARK:- #号控制字符是否生效
print(#"Line 1\nLine 2"#)
print("--------------------")
print(#"Line 1\#nLine 2"#)
print("--------------------")
print(###"Line1\###nLine2\nLine3"###)
print("--------------------")

// MARK:- 打印"""
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#
print(threeMoreDoubleQuotationMarks)
print("--------------------")

// MARK:- 获取字符
for character in "Dog🐶" {
    print(character)
    print("--------------------")

}

// MARK:- 字符类型
let char: Character = "1"

// MARK:- 字符数组转字符串
let catCharacters: [Character] = ["C", "a", "t", "🐱"]
let catString = String(catCharacters)
print(catString)
print("--------------------")


// MARK:- +号拼接字符串
let ss1 = "hello"
let ss2 = " there"
var welcome = ss1 + ss2
print("welcome = \(welcome)")

// MARK:- +=号拼接字符串
var instr = "look over"
instr += ss2
print(instr)
print("--------------------")

// MARK:- append()拼接
let exclamationMark: Character = "!"
welcome.append(exclamationMark)
print(welcome)
print("--------------------")

// MARK:- 井号让插值字符失效
print(#"Write an interpolated string in Swift using \(multiplier)."#)
print("--------------------")
// 打印 "Write an interpolated string in Swift using \(multiplier)."

// MARK:- 井号让插值字符(部分)失效
print(#"\(6 * 7)  times  is \#(6 * 7)."#)
print("--------------------")
// 打印 \(6 * 7)  times  is 42.

// MARK:- 字符统计
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
print("--------------------")

print("\u{E9}")
print("--------------------")

print("\u{0061}")// a
print("--------------------")

print("\u{1F425}")// 🐥
print("--------------------")

print("\u{301}")
print("--------------------")

// MARK:- 字符串索引
let greeting = "0123456789"
print(greeting[greeting.startIndex])
print("--------------------")

//print(greeting[greeting.endIndex])// Fatal error: String index is out of bounds: file
print(greeting[greeting.index(before: greeting.endIndex)])
print("--------------------")

print(greeting[greeting.index(after: greeting.startIndex)])
print("--------------------")

print(greeting.index(greeting.startIndex, offsetBy: 1))
print("--------------------")

for idx in greeting.indices {
    print(greeting[idx])
}

// Index(_rawBits:
let myStr = "Hello World!"
if let rangeFound = myStr.range(of: "ello"){
    let nsRange = NSRange(rangeFound, in: myStr)
    print("Found ello from \(nsRange.location) to \(nsRange.location + nsRange.length - 1)")
}
