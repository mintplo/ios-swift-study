//
//  BookManager.swift
//  BookManager
//
//  Created by mintplo on 2017. 9. 27..
//  Copyright © 2017년 mintplo. All rights reserved.
//

import Foundation

class BookManager {
    var bookList = [Book]() // mutable array

    func addBook(_ bookObject: Book) {
        bookList += [bookObject]
    }

    func showAllBook() -> String{
        var bookListStr = ""

        for book in bookList {
            bookListStr += "Name : \(book.name)\n"
            bookListStr += "Genre : \(book.genre)\n"
            bookListStr += "Author : \(book.author)\n"
            bookListStr += "-------------------------\n"
        }

        return bookListStr
    }

    func countBook() -> Int {
        return bookList.count
    }

    func findBook(_ bookName: String) -> String? {
        var bookListStr = ""

        for book in bookList {
            if book.name == bookName {
                bookListStr += "Name : \(book.name) "
                bookListStr += "Genre : \(book.genre) "
                bookListStr += "Author : \(book.author) "

                return bookListStr
            }
        }

        return nil
    }

    func removeBook(_ bookName: String) {
        for book in bookList {
            if book.name == bookName {
                let index = (bookList as NSArray).index(of: book)
                bookList.remove(at: index)
            }
        }
    }
}
