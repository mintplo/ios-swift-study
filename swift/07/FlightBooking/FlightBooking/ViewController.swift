//
//  ViewController.swift
//  FlightBooking
//
//  Created by mintplo on 2017. 10. 6..
//  Copyright © 2017년 mintplo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var selectDatePicker: UIDatePicker!
    @IBOutlet var departureDateButton: UIButton!
    @IBOutlet var returnDateLabel: UILabel!
    @IBOutlet var returnDateButton: UIButton!

    var buttonTag: Int = 1

    @IBAction func showReturnDateAction(_ sender: AnyObject) {
        let hidden: Bool = !(sender as! UISwitch).isOn

        returnDateLabel.isHidden = hidden
        returnDateButton.isHidden = hidden
    }

    @IBAction func showDatePickerAction(_ sender: Any) {
        if selectDatePicker.isHidden == false {
            selectDatePicker.isHidden = true
        } else {
            selectDatePicker.isHidden = false
        }

        buttonTag = (sender as! UIButton).tag
    }

    @IBAction func selectDateAction(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YY-MM-d hh:mma"

//        let dateString = formatter.string(from: selectDatePicker.date)
        let dateString = formatter.string(from: (sender as! UIDatePicker).date)

        if buttonTag == 1 {
            departureDateButton.setTitle("\(dateString)", for: .normal)
        } else {
            returnDateButton.setTitle("\(dateString)", for: .normal)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        selectDatePicker.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        returnDateLabel.isHidden = true
        returnDateButton.isHidden = true
        selectDatePicker.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

