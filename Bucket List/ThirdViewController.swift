//
//  ThirdViewController.swift
//  Bucket List
//
//  Created by Erin Wiegman on 2/19/18.
//  Copyright © 2018 Erin Wiegman. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var newItemInput: UITextField!
    //add to item to to do list
    @IBAction func newItemBtn(_ sender: Any) {
        if (newItemInput.text != "")
        {
            toDoList.append(newItemInput.text!)
            //clear input to enter new item
            newItemInput.text = ""
        }
    }
    
    let optionsList:[[String]] = [["Spring", "Summer", "Fall", "Winter"], ["Travel", "Food", "Events", "Adventure"]]
    
    let titles:[String] = ["Seasons", "Categories"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionsList[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return optionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "newCell")
        newCell.textLabel?.text = optionsList[indexPath.section][indexPath.row]
        
        return newCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
