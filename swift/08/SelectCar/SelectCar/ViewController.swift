//
//  ViewController.swift
//  SelectCar
//
//  Created by mintplo on 2017. 10. 7..
//  Copyright © 2017년 mintplo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var imgView: UIImageView!

    let carCompanyName = ["Tesla", "Lamborghini", "Porsche"]
    let teslaModel = ["Model S", "Model X"]
    let lamborghiniModel = ["aventador", "veneno", "huracan"]
    let porscheModel = ["911", "boxter"]

    let teslaImageNames = ["tesla-model-s.jpg", "tesla-model-x.jpg"]
    let lamborghiniImageNames = ["lamborghini-aventador.jpg", "lamborghini-veneno.jpg", "lamborghini-huracan.jpg"]
    let porscheImageNames = ["porsche-911.jpg", "porsche-boxter.jpg"]

    var carModel: [String] = []
    var carModelImages: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        carModel = teslaModel
        carModelImages = teslaImageNames

        imgView.layer.cornerRadius = 50.0
        imgView.layer.masksToBounds = true
    }

    // UIPickerView DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return carCompanyName.count
        } else {
            return teslaModel.count
        }
    }

    // UIPickerView Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return carCompanyName[row]
        } else {
            return carModel[row]
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 && row == 0 {
            carModel = teslaModel
            carModelImages = teslaImageNames
        } else if component == 0 && row == 1 {
            carModel = lamborghiniModel
            carModelImages = lamborghiniImageNames
        } else if component == 0 && row == 2 {
            carModel = porscheModel
            carModelImages = porscheImageNames
        }

        pickerView.reloadAllComponents()
        imgView.image = UIImage(named: carModelImages[pickerView.selectedRow(inComponent: 1)])!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

