//
//  main.swift
//  类型转换
//
//  Created by David on 2020/11/17.
//

import Foundation

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

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

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You up", artist: "Rick Astley")
]
// 数组 library 的类型被推断为 [MediaItem]

var movieCount = 0
var songCount = 0
var MediaItemCount = 0


for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
    
//    if item is MediaItem {
//        MediaItemCount += 1
//    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")
print("MediaItemCount = \(MediaItemCount)")
print("--------------------")


// 向下转型
for item in library {
    if let movie = item as? Movie {
        print("Movie = \(movie.name)")
        print("--------------------")
        print("dir = \(movie.director)")
        print("--------------------")
    } else if let song  = item as? Song {
        print("song = \(song.name)")
        print("--------------------")
        print("artist = \(song.artist)")
        print("--------------------")
    }
}

// Any 和 AnyObject
var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.15159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })

for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
        print("--------------------")
    case 0 as Double:
        print("zero as a Double")
        print("--------------------")
    case let someInt as Int:
        print("an integer value of \(someInt)")
        print("--------------------")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
        print("--------------------")
    case is Double:
        print("some other double value that I don't want to print")
        print("--------------------")
    case let someString as String:
        print("a string value of\"\(someString)\"")
        print("--------------------")
    case let (x, y) as (Double, Double):
        print("a (x, y) point at \(x) , \(y)")
        print("--------------------")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
        print("--------------------")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}

let optionalNumber: Int? = 3
// var things = [Any]()
//things.append(optionalNumber)        // 警告 Expression implicitly coerced from 'Int?' to 'Any'
things.append(optionalNumber as Any) // 没有警告

protocol Dell {
    
}

class Person: Dell {

}

class Student {
    
}

//print("person 是否遵守协议 = \(Person() is Dell)") // person 是否遵守协议 = true
print("--------------------")
print("Student 是否遵守协议 = \(Student() is Dell)") // Student 是否遵守协议 = false
print("--------------------")


