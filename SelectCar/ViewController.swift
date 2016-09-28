//
//  ViewController.swift
//  SelectCar
//
//  Created by Yoo SeungHwan on 2016/09/27.
//  Copyright © 2016年 Yoo SeungHwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    let carCompanyName = ["Tesla","Lamborghini","Porsche"]
    
    var carModel:[String] = []
    let tesla = ["Model S", "Model X"]
    let lamborghini = ["Aventador", "Huracan", "Veneno"]
    let porsche = ["911","Boxter"]
    
    var carModelImageNames:[String] = []
    let teslaImageNames = ["tesla-model-s.jpg", "tesla-model-x.jpg"]
    let lamborghiniImageNames = ["lamborghini-aventador.jpg", "lamborghini-huracan.jpg", "lamborghini-veneno.jpg"]
    let porscheImageNames = ["porsche-911.jpg","porsche-boxter.jpg"]
    

    
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carModel = tesla
        carModelImageNames = teslaImageNames
        
        imgView.layer.cornerRadius = 50.0
        imgView.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //UIPickerViewDataSource
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return carCompanyName.count
        }else{
            return carModel.count
        }
    }
    
    //UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return carCompanyName[row]
        }else{
            return carModel[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 && row == 0 {
            carModel = tesla
            carModelImageNames = teslaImageNames
        } else if component == 0 && row == 1 {
            carModel = lamborghini
            carModelImageNames = lamborghiniImageNames
        } else if component == 0 && row == 2 {
            carModel = porsche
            carModelImageNames = porscheImageNames
        }
        
        pickerView.reloadAllComponents()
        
        imgView.image = UIImage(named:carModelImageNames[pickerView.selectedRow(inComponent:1)])
    }

}

