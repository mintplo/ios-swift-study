//: Playground - noun: a place where people can play

import UIKit

func sayHello() {
    print("Hello")
}

sayHello()

func sayHello2(name: String) {
    print("Hello \(name)")
}

sayHello2(name: "Lee")

func sayHello3(name: String) -> String {
    return "Hello " + name
}

print(sayHello3(name: "Ryu"))

func sayHello4(name: String = "Park") {
    print("Hello \(name)")
}

sayHello4()
sayHello4(name: "Jin")

func sayHello5(insertYourName name: String, internationalAge age: Int) {
    print("Hello \(name) is \(age) years old.")
}

sayHello5(insertYourName: "Lee", internationalAge: 10)

func sayHello6(name: String, _ age: Int) -> String {
    return "\(name) is \(age) years old."
}

print(sayHello6(name: "Jin", 10))
