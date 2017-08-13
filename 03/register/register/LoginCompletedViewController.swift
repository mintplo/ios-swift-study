//
//  LoginCompletedViewController.swift
//  register
//
//  Created by mintplo on 2017. 8. 13..
//  Copyright © 2017년 mintplo. All rights reserved.
//

import UIKit

class LoginCompletedViewController: UIViewController {

    @IBOutlet weak var userLoginStatusLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let userEmail = UserDefaults.standard.string(forKey: "UserEmail")!
        let userLoginCount = UserDefaults.standard.integer(forKey: "UserLoginCount")
        let userLatestLoginDate = UserDefaults.standard.object(forKey: "UserLatestLoginDate") as? Date
        UserDefaults.standard.set(Date(), forKey: "UserLatestLoginDate")

        let userHaveGirlFriend = UserDefaults.standard.bool(forKey: "UserHaveGirlFriend")
        let girlFriendStr = (userHaveGirlFriend) ? "있습니다." : "없습니다."

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        var dateStr = "없음"
        if userLatestLoginDate != nil {
            dateStr = formatter.string(from: userLatestLoginDate!)
        }

        let statusStr = "\(userEmail)님,\n안녕하세요!\n\(userLoginCount)번 로그인하셨습니다!\n\n최근 로그인: \(dateStr)\n\n여자친구가 \(girlFriendStr)"

        userLoginStatusLabel.text = statusStr
    }

}
