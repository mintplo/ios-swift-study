//
//  LoginViewController.swift
//  register
//
//  Created by mintplo on 2017. 8. 13..
//  Copyright © 2017년 mintplo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        // 텍스트 필드 입력시 키보드가 텍스트 필드를 덮는 것을 방지하기 위한 Observer 추가
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)

        emailTextField.text = ""
        passwordTextField.text = ""
    }

    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }

    func keyboardWillShow(notification: NSNotification) {
        guard let keyboardFrameValue = notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue else {
            return
        }
        
        var activeTextField: UITextField!
        if emailTextField.isFirstResponder {
            activeTextField = emailTextField
        } else if passwordTextField.isFirstResponder {
            activeTextField = passwordTextField
        }
        
        let keyboardFrame = view.convert(keyboardFrameValue.cgRectValue, from: nil)
        
        // (iOS 기기의 스크린 크기) = 로그인 화면 실제 높이 - 키보드 크기 = 키보드가 덮은 화면의 나머지 높이 < 활성화된 텍스트 필드의 Y 위치면 스크롤뷰 오프셋 수정
        if activeTextField.frame.minY > (loginScrollView.frame.height - (self.navigationController?.navigationBar.frame.height)! - keyboardFrame.height) {
            let offsetYToMove = (activeTextField.frame.minY + 10) - (loginScrollView.frame.height - (self.navigationController?.navigationBar.frame.height)! - keyboardFrame.height)
            loginScrollView.setContentOffset(CGPoint(x: 0, y: offsetYToMove), animated: true)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        loginScrollView.setContentOffset(CGPoint(x: 0, y: 0 - loginScrollView.contentInset.top), animated: true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            emailTextField.resignFirstResponder()
            passwordTextField.resignFirstResponder()
        }

        return true
    }

    @IBAction func doLoginBtnDidTap(_ sender: UIButton) {
        let regexStrForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailValidTest = NSPredicate(format: "SELF MATCHES %@", regexStrForEmail)
        let isEmailValid = emailValidTest.evaluate(with: emailTextField.text!)
        
        // 비밀번호 유효성 검사 (영문 대,소문자 한 개 이상 + 숫자 혼용) 6 ~ 10자
        let passwordValidTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{6,10}$")
        let isPasswordValid = passwordValidTest.evaluate(with: passwordTextField.text!)

        if !isEmailValid {
            showAlert(title: "로그인 실패", message: "입력하신 이메일이 이메일 형식에 맞지 않습니다.")
            
            return
        }
        
        if !isPasswordValid {
            showAlert(title: "로그인 실패", message: "입력하신 비밀번호가 형식에 맞지 않습니다.")
            
            return
        }

        let userEmail = UserDefaults.standard.string(forKey: "UserEmail")
        if userEmail != emailTextField.text! {
            showAlert(title: "로그인 실패", message: "회원가입된 회원이 아닙니다.")

            return
        }

        let userPassword = UserDefaults.standard.string(forKey: "UserPassword")
        if userPassword != passwordTextField.text! {
            showAlert(title: "로그인 실패", message: "비밀번호가 일치하지 않습니다,")

            return
        }

        let userLoginCount = UserDefaults.standard.integer(forKey: "UserLoginCount")
        UserDefaults.standard.set(userLoginCount + 1, forKey: "UserLoginCount")

        self.performSegue(withIdentifier: "LoginCompletedViewSegue", sender: nil)
    }

    @IBAction func doRegisterBtnDidTap(_ sender: UIButton) {
        // 회원가입 View Modal
        self.performSegue(withIdentifier: "RegisterViewSegue", sender: nil)
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
