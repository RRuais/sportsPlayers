//
//  detailViewController.swift
//  sportsPlayers
//
//  Created by Rich Ruais on 7/25/17.
//  Copyright © 2017 Rich Ruais. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPlayer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getPlayer()
    }
    
    func getPlayer() {
        countryImage.image = countryImages[players[index].countryNumber]
        nameLabel.text = players[index].name
        ageLabel.text = players[index].age
        heightLabel.text = players[index].height
        weightLabel.text = players[index].weight
    }
    
    @IBAction func updateAction(_ sender: Any) {
        performSegue(withIdentifier: "update", sender: self)
    }
 
    @IBAction func closeAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "update") {
            let controller = segue.destination as! UpdateViewController
            controller.index = index
        }

    }
  


}
