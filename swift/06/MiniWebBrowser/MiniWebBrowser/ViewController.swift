//
//  ViewController.swift
//  MiniWebBrowser
//
//  Created by mintplo on 2017. 10. 5..
//  Copyright © 2017년 mintplo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate {

    @IBOutlet var bookMarkSegmentedControl: UISegmentedControl!
    @IBOutlet var urlTextField: UITextField!
    @IBOutlet var mainWebView: UIWebView!
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    
    @IBAction func bookMarkAction(_ sender: Any) {
        let bookMarkUrl = bookMarkSegmentedControl.titleForSegment(at: bookMarkSegmentedControl.selectedSegmentIndex)!
        let urlString = "https://www.\(bookMarkUrl.lowercased()).com"
        mainWebView.loadRequest(URLRequest(url: URL(string: urlString)!))
        urlTextField.text = urlString
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var urlString = "\(urlTextField.text!)"
        if !urlString.hasPrefix("https://") {
            urlString = "https://\(urlTextField.text!)"
        }
        
        mainWebView.loadRequest(URLRequest(url: URL(string: urlString)!))
        urlTextField.text = urlString
        textField.resignFirstResponder()

        return true
    }

    func webViewDidStartLoad(_ webView: UIWebView) {
        loadingIndicator.startAnimating()
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        loadingIndicator.stopAnimating()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://facebook.com"
        mainWebView.loadRequest(URLRequest(url: URL(string: urlString)!))
        urlTextField.text = urlString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

