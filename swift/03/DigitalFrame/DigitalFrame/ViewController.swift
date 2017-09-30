//
//  ViewController.swift
//  DigitalFrame
//
//  Created by mintplo on 2017. 9. 29..
//  Copyright © 2017년 mintplo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var speedLabel: UILabel!
    @IBOutlet var speedSlider: UISlider!
    @IBOutlet var toggleAnimButton: UIButton!
    @IBOutlet var imgView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let jisuImages = [UIImage(named: "1.png")!, UIImage(named: "2.jpg")!, UIImage(named: "3.png")!, UIImage(named: "4.jpg")!]
        imgView.animationImages = jisuImages
        imgView.animationDuration = 1.0

        speedLabel.text = "\(speedSlider.value)"
    }

    @IBAction func toggleAnimAction(_ sender: AnyObject) {
        if imgView.isAnimating {
            imgView.stopAnimating()
            toggleAnimButton.setTitle("Start", for: .normal)
        } else {
            imgView.startAnimating()
            toggleAnimButton.setTitle("Stop", for: .normal)
        }
    }

    @IBAction func changeSppedAction(_ sender: AnyObject) {
        speedLabel.text = "\(speedSlider.value)"
        imgView.animationDuration = Double(speedSlider.value)
        imgView.startAnimating()
        toggleAnimButton.setTitle("Stop", for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

