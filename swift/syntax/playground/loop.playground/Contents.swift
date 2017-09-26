//: Playground - noun: a place where people can play

import UIKit

var age = 0

// Don't use anymore
// age++, ++age

// same
age += 1
age = age + 1

while age < 5 {
    age += 1
    print(age)
}

// only for-in loops!

for _ in 1...5 {
    print(5)
}

for number in 1...5 {
    print(number)
}

for name in ["Anna", "Alex", "Brian", "Jack"] {
    print("Hello, \(name)")
}

for (animalName, legCount) in ["ant": 6, "human": 2, "snake": 0, "cheetah": 4] {
    print("\(animalName) have \(legCount) legs")
}
