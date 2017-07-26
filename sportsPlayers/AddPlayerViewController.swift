//
//  AddPlayerViewController.swift
//  sportsPlayers
//
//  Created by Rich Ruais on 7/25/17.
//  Copyright © 2017 Rich Ruais. All rights reserved.
//

import UIKit

class AddPlayerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var heightTxtField: UITextField!
    @IBOutlet weak var weightTxtField: UITextField!
    @IBOutlet weak var ageTxtField: UITextField!
    @IBOutlet weak var countryPickerView: UIPickerView!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
        
        errorLabel.isHidden = true
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }

    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePlayer(_ sender: Any) {
        
        if (nameTxtField.text?.isEmpty)! || (heightTxtField.text?.isEmpty)! || (weightTxtField.text?.isEmpty)! || (ageTxtField.text?.isEmpty)! {
            errorLabel.isHidden = false
        } else {
            let name = nameTxtField.text
            let height = heightTxtField.text
            let weight = weightTxtField.text
            let age = ageTxtField.text
            let country = countryPickerView.selectedRow(inComponent: 0).description
            let countryNumber = countryPickerView.selectedRow(inComponent: 0)
            let newPlayer = player.init(name: name, country: country,countryNumber: countryNumber, height: height, weight: weight, age: age)
            players.append(newPlayer)
            self.dismiss(animated: true, completion: nil)

        }
        
    }
    
  
    


}
