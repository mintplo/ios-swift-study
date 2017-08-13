//
//  ViewController.swift
//  login
//
//  Created by mintplo on 2017. 8. 12..
//  Copyright © 2017년 mintplo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginScrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self

        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 여러 개의 세그가 복잡하게 연결되어있다면
        // Segue의 identifier를 확인하여 Data Passing
        if segue.identifier == "ShowLoginCompletedSegue" {
            let destinationViewController = segue.destination as! LoginCompletedViewController
            destinationViewController.userEmail = emailTextField.text!
        }
    }

    func keyboardWillShow(notification: NSNotification) {
        guard let keyboardFrameValue = notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue else {
            return
        }
        
        var activeTextField: UITextField!
        if emailTextField.isFirstResponder {
            activeTextField = emailTextField
        } else {
            activeTextField = passwordTextField
        }
        
        let keyboardFrame = view.convert(keyboardFrameValue.cgRectValue, from: nil)

        // iOS 기기의 스크린 크기 - 키보드 크기 = 키보드가 덮은 화면의 나머지 높이 < 활성화된 텍스트 필드의 Y 위치면 스크롤뷰 오프셋 수정
        if activeTextField.frame.minY > UIScreen.main.bounds.height - keyboardFrame.height {
            let offsetYToMove = activeTextField.frame.minY - (UIScreen.main.bounds.height - keyboardFrame.height)
            loginScrollView.setContentOffset(CGPoint(x: 0, y: offsetYToMove), animated: true)
        }
    }

    func keyboardWillHide(notification: NSNotification) {
        loginScrollView.contentOffset = .zero
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 이메일 텍스트 필드일 경우 비밀번호 입력으로 넘어감
        // 비밀번호 텍스트 필드일 경우 키보드 사라짐
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            emailTextField.resignFirstResponder()
            passwordTextField.resignFirstResponder()
        }

        return true
    }

    @IBAction func doLoginBtnTap(_ sender: Any) {
        // 이메일 유효성 검사 (xxx@xxx.x)
        let regexStrForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailValidTest = NSPredicate(format: "SELF MATCHES %@", regexStrForEmail)
        let isEmailValid = emailValidTest.evaluate(with: emailTextField.text!)

        // 비밀번호 유효성 검사 (영문 대,소문자 한 개 이상 + 숫자 혼용) 6 ~ 10자
        let passwordValidTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{6,10}$")
        let isPasswordValid = passwordValidTest.evaluate(with: passwordTextField.text!)

        if (isEmailValid && isPasswordValid) {
            let loginCount: Int = UserDefaults.standard.integer(forKey: "loginCount")
            UserDefaults.standard.set(loginCount + 1, forKey: "loginCount")

            self.performSegue(withIdentifier: "ShowLoginCompletedSegue", sender: nil)
        } else {
            // 로그인 실패 알려주기
            let alert = UIAlertController(title: "로그인 실패", message: "이메일 또는 비밀번호가 알맞지 않습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

}

