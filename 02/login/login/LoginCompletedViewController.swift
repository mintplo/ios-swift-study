//
//  LoginCompletedViewController.swift
//  login
//
//  Created by mintplo on 2017. 8. 12..
//  Copyright © 2017년 mintplo. All rights reserved.
//

import UIKit

class LoginCompletedViewController: UIViewController {

    var userEmail: String = ""

    @IBOutlet weak var loginStatusLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let loginCount = UserDefaults.standard.integer(forKey: "loginCount")
        let latestLoginDate = UserDefaults.standard.object(forKey: "latestLoginDate") as! Date
        UserDefaults.standard.set(Date(), forKey: "latestLoginDate")

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateStr = formatter.string(from: latestLoginDate)

        loginStatusLabel.text = "\(userEmail)님, \n안녕하세요!\n\n \(loginCount)번 로그인하셨습니다!\n\n최근 로그인: \(dateStr)"
    }

    @IBAction func closeButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
