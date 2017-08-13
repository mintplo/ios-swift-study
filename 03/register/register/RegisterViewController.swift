//
//  RegisterViewController.swift
//  register
//
//  Created by mintplo on 2017. 8. 13..
//  Copyright © 2017년 mintplo. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {

    var haveGirlFriend: Bool = true

    @IBOutlet weak var registerScrollView: UIScrollView!
    @IBOutlet weak var registerProgressView: UIProgressView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCheckTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.passwordCheckTextField.delegate = self

        // 텍스트 필드 입력시 키보드가 텍스트 필드를 덮는 것을 방지하기 위한 Observer 추가
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        passwordCheckTextField.resignFirstResponder()
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
        } else {
            activeTextField = passwordCheckTextField
        }
        
        let keyboardFrame = view.convert(keyboardFrameValue.cgRectValue, from: nil)

        // (iOS 기기의 스크린 크기) = 회원가입 화면 실제 높이 - 키보드 크기 = 키보드가 덮은 화면의 나머지 높이 < 활성화된 텍스트 필드의 Y 위치면 스크롤뷰 오프셋 수정
        if activeTextField.frame.minY > (registerScrollView.frame.height - (self.navigationController?.navigationBar.frame.height)! - keyboardFrame.height) {
            let offsetYToMove = (activeTextField.frame.minY + 10) - (registerScrollView.frame.height - (self.navigationController?.navigationBar.frame.height)! - keyboardFrame.height)
            registerScrollView.setContentOffset(CGPoint(x: 0, y: offsetYToMove), animated: true)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        registerScrollView.setContentOffset(CGPoint(x: 0, y: 0 - registerScrollView.contentInset.top), animated: true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            passwordCheckTextField.becomeFirstResponder()
        } else if textField == passwordCheckTextField {
            emailTextField.resignFirstResponder()
            passwordTextField.resignFirstResponder()
            passwordCheckTextField.resignFirstResponder()
        }

        return true
    }

    @IBAction func doCloseBtnDidTap(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doRegisterBtnDidTap(_ sender: UIButton) {
        // 이메일 검증
        // 비밀번호 유효 검증 및 비밀번호 확인 검증
        // 유저 정보 생성 (초기화)
        let regexStrForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailValidTest = NSPredicate(format: "SELF MATCHES %@", regexStrForEmail)
        let isEmailValid = emailValidTest.evaluate(with: emailTextField.text!)
        
        // 비밀번호 유효성 검사 (영문 대,소문자 한 개 이상 + 숫자 혼용) 6 ~ 10자
        let passwordValidTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{6,10}$")
        let isPasswordValid = passwordValidTest.evaluate(with: passwordTextField.text!)

        let userEmail = UserDefaults.standard.string(forKey: "UserEmail")
        if userEmail == emailTextField.text! {
            showAlert(title: "회원가입 실패", message: "이미 가입한 이메일입니다.")
            
            return
        }
        
        if passwordTextField.text! != passwordCheckTextField.text! {
            showAlert(title: "회원가입 실패", message: "입력하신 비밀번호와 확인용 비밀번호가 서로 일치하지 않습니다.")
            
            return
        }

        if !isEmailValid {
            showAlert(title: "회원가입 실패", message: "입력하신 이메일이 이메일 형식에 맞지 않습니다.")

            return
        }

        if !isPasswordValid {
            showAlert(title: "회원가입 실패", message: "입력하신 비밀번호가 형식에 맞지 않습니다.")

            return
        }

        UserDefaults.standard.set(emailTextField.text!, forKey: "UserEmail")
        UserDefaults.standard.set(passwordTextField.text!, forKey: "UserPassword")
        UserDefaults.standard.set(haveGirlFriend, forKey: "UserHaveGirlFriend")
        UserDefaults.standard.set(0, forKey: "UserLoginCount")
        UserDefaults.standard.set(nil, forKey: "UserLatestLoginDate")

        let alert = UIAlertController(title: "회원가입 성공", message: "회원가입이 완료되었습니다. 로그인 화면에서 로그인해주세요.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: alertHandler))
        self.present(alert, animated: true, completion: nil)
    }

    func alertHandler(alert: UIAlertAction!) {
        self.dismiss(animated: true, completion: nil)
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func girlFirendSwitchValueChanged(_ sender: UISwitch) {
        haveGirlFriend = sender.isOn
    }

    @IBAction func textFieldValueChanged(_ sender: UITextField) {
        let totalCount = 3;
        var count = 0;

        if let text = emailTextField.text, !text.isEmpty {
            count += 1
        }

        if let text = passwordTextField.text, !text.isEmpty {
            count += 1
        }

        if let text = passwordCheckTextField.text, !text.isEmpty {
            count += 1
        }

        registerProgressView.progress = Float(count) / Float(totalCount)
    }

}
