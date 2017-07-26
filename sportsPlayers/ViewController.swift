//
//  ViewController.swift
//  sportsPlayers
//
//  Created by Rich Ruais on 7/25/17.
//  Copyright © 2017 Rich Ruais. All rights reserved.
//

import UIKit


struct player {
    var name: String!
    var country: String!
    var countryNumber: Int!
    var height: String!
    var weight: String!
    var age: String!
}

let countries = ["Germany", "France", "USA", "Spain", "Australia"]
let countryImages = [#imageLiteral(resourceName: "germany"), #imageLiteral(resourceName: "france"), #imageLiteral(resourceName: "usa"), #imageLiteral(resourceName: "spain"), #imageLiteral(resourceName: "australia")]

var players = [player]()

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let countryImage = cell.viewWithTag(1) as! UIImageView
        countryImage.image = countryImages[players[indexPath.row].countryNumber]
        let nameLbl = cell.viewWithTag(2) as! UILabel
        nameLbl.text = players[indexPath.row].name
        let ageLbl = cell.viewWithTag(3) as! UILabel
        ageLbl.text = players[indexPath.row].age

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "show", sender: indexPath);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "show") {
            print("Perpare for segue 2")
            let controller = segue.destination as! DetailViewController
            let row = (sender as! NSIndexPath).row;
            controller.index = row
            
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            players.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    
}
