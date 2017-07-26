//
//  UpdateViewController.swift
//  sportsPlayers
//
//  Created by Rich Ruais on 7/25/17.
//  Copyright © 2017 Rich Ruais. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var heightTxtField: UITextField!
    @IBOutlet weak var weightTxtField: UITextField!
    @IBOutlet weak var ageTxtField: UITextField!
    @IBOutlet weak var countryPickerView: UIPickerView!
    @IBOutlet weak var errorLabel: UILabel!
    
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
        
        countryPickerView.selectRow(players[index].countryNumber, inComponent: 0, animated: true)
        nameTxtField.text = players[index].name
        ageTxtField.text = players[index].age
        heightTxtField.text = players[index].height
        weightTxtField.text = players[index].weight
        
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
    
    @IBAction func updatePlayer(_ sender: Any) {
        
        if (nameTxtField.text?.isEmpty)! || (heightTxtField.text?.isEmpty)! || (weightTxtField.text?.isEmpty)! || (ageTxtField.text?.isEmpty)! {
            errorLabel.isHidden = false
        } else {
            players[index].name = nameTxtField.text
            players[index].height = heightTxtField.text
            players[index].weight = weightTxtField.text
            players[index].age = ageTxtField.text
            players[index].country = countryPickerView.selectedRow(inComponent: 0).description
            players[index].countryNumber = countryPickerView.selectedRow(inComponent: 0)
            self.dismiss(animated: true, completion: nil)
            
        }
        
    }

}
