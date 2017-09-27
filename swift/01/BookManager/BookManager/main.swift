//
//  main.swift
//  BookManager
//
//  Created by mintplo on 2017. 9. 27..
//  Copyright © 2017년 mintplo. All rights reserved.
//

import Foundation

var book1 = Book()
book1.name = "햄릿"
book1.genre = "비극"
book1.author = "세익스피어"

var book2 = Book()
book2.name = "누구를 위하여 종을 울리나"
book2.genre = "전쟁소설"
book2.author = "헤밍웨이"

var book3 = Book()
book3.name = "죄와벌"
book3.genre = "사실주의"
book3.author = "톨스토이"

var myBookShelf = BookManager()

myBookShelf.addBook(book1)
myBookShelf.addBook(book2)
myBookShelf.addBook(book3)

print(myBookShelf.showAllBook())
print(myBookShelf.countBook())

var findResult = myBookShelf.findBook("햄릿")

if findResult != nil {
    print("\(findResult!) 를 찾았습니다.")
} else {
    print("찾으시는 책이 없습니다.")
}

myBookShelf.removeBook("햄릿")

