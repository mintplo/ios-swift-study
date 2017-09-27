//
//  Book.swift
//  BookManager
//
//  Created by mintplo on 2017. 9. 27..
//  Copyright © 2017년 mintplo. All rights reserved.
//

import Foundation

class Book {
    var name = ""
    var genre = ""
    var author = ""
    
    func bookPrint() {
        print("Name : \(name)")
        print("Genre : \(genre)")
        print("Author : \(author)")
    }
}
