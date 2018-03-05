//
//  ThirdViewController.swift
//  Bucket List
//
//  Created by Erin Wiegman on 2/19/18.
//  Copyright © 2018 Erin Wiegman. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var newTableView: UITableView!
    
    @IBOutlet weak var newItemInput: UITextField!
    
    //add to item to to do list by clicking "save"
    @IBAction func newItemBtn(_ sender: Any) {
        if (newItemInput.text != "")
        {
            toDoList.append(newItemInput.text!)
            //clear input to enter new item
            newItemInput.text = ""
        }
    }

    var optionsList:[[String]] = [["Spring", "Summer", "Fall", "Winter"], ["Travel", "Food", "Events", "Adventure"]]
    
    @IBOutlet weak var addCatInput: UITextField!
    
    @IBAction func addCatBtn(_ sender: Any) {
        if (addCatInput.text != "")
        {
            optionsList[1].append(addCatInput.text!)
            newTableView.reloadData()
            addCatInput.text = ""
        }
    }
    
    var titles:[String] = ["Seasons", "Categories"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionsList[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return optionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = tableView.dequeueReusableCell(withIdentifier: "newCell", for: indexPath) as! CustomViewCell
        newCell.newItem.text = optionsList[indexPath.section][indexPath.row]
        newCell.newCheck.image = UIImage(named: "unchecked")?.withRenderingMode(.alwaysTemplate)
        newCell.newCheck.tintColor = UIColor(named: "Green")

        return newCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    //    change image on click for each item
    var toggleFlag: Bool = true
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newCell = tableView.cellForRow(at: indexPath) as! CustomViewCell
        if (toggleFlag == true) {
            newCell.newCheck.image = UIImage(named: "checked")?.withRenderingMode(.alwaysTemplate)
            newCell.newCheck.tintColor = UIColor(named: "Green")
            toggleFlag = false
        } else {
            newCell.newCheck.image = UIImage(named: "unchecked")?.withRenderingMode(.alwaysTemplate)
            newCell.newCheck.tintColor = UIColor(named: "Green")
            toggleFlag = true
        }
        
        print(optionsList[indexPath.section][indexPath.row])
        
    }
    
    //    what does this do
    override func viewDidAppear(_ animated: Bool) {
        newTableView.reloadData()
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
