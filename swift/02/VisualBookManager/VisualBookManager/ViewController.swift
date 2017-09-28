//
//  ViewController.swift
//  VisualBookManager
//
//  Created by mintplo on 2017. 9. 28..
//  Copyright © 2017년 mintplo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let myBookShelf = BookManager()

    @IBOutlet weak var printTextView: UITextView!

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var genreTextField: UITextField!
    @IBOutlet var authorTextField: UITextField!
    @IBOutlet var countLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let book1 = Book()
        book1.name = "햄릿"
        book1.genre = "비극"
        book1.author = "세익스피어"
        
        let book2 = Book()
        book2.name = "누구를 위하여 종을 울리나"
        book2.genre = "전쟁소설"
        book2.author = "헤밍웨이"
        
        let book3 = Book()
        book3.name = "죄와벌"
        book3.genre = "사실주의"
        book3.author = "톨스토이"
        
        myBookShelf.addBook(book1)
        myBookShelf.addBook(book2)
        myBookShelf.addBook(book3)

        countLabel.text = "\(myBookShelf.countBook()) 권"
    }

    @IBAction func showAllBookAction(_ sender: AnyObject) {
        printTextView.text = myBookShelf.showAllBook()
    }

    @IBAction func adddBookAction(_ sender: AnyObject) {
        let newBook = Book()

        newBook.name = nameTextField.text!
        newBook.genre = genreTextField.text!
        newBook.author = authorTextField.text!

        myBookShelf.addBook(newBook)

        printTextView.text = "\(nameTextField.text!) 도서가 등록되었습니다!"
        countLabel.text = "\(myBookShelf.countBook()) 권"
    }

    @IBAction func findBookAction(_ sender: AnyObject) {
        let resultBook = myBookShelf.findBook(nameTextField.text!)

        if resultBook != nil {
            printTextView.text = resultBook!
        } else {
            printTextView.text = "찾으시는 책이 없습니다."
        }
    }

    @IBAction func removeBookAction(_ sender: AnyObject) {
        let deleteBook = myBookShelf.removeBook(nameTextField.text!)

        if deleteBook == true {
            printTextView.text = "\(nameTextField.text!)가 삭제되었습니다."
            countLabel.text = "\(myBookShelf.countBook()) 권"
        } else {
           printTextView.text = "삭제할 책이 없습니다."
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

