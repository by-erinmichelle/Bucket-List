//
//  FilterViewController.swift
//  Bucket List
//
//  Created by Erin Wiegman on 2/19/18.
//  Copyright © 2018 Erin Wiegman. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
//    attempt to add category to end of 2nd array
//    @IBOutlet weak var addCatInput: UITextField!
//
//    @IBAction func addCatBtn(_ sender: Any) {
//        if (addCatInput.text != "")
//        {
//            optionsFilterList[1].append(addCatInput.text!)
//            //clear input to enter new category
//            addCatInput.text = ""
//        }
//    }
    
//    data for 2 sections
    var optionsFilterList:[[String]] = [["Spring", "Summer", "Fall", "Winter"], ["Travel", "Food", "Events", "Adventure"]]
    
//    titles of 2 sections
    var titles:[String] = ["Seasons", "Categories"]
    
//    number of rows = number of individual options
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionsFilterList[section].count
    }
    
//    number of sections = number of sections in options
    func numberOfSections(in tableView: UITableView) -> Int {
        return optionsFilterList.count
    }
    
//    custom cell setup
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filterCell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath) as! CustomViewCell
//      label for option item
        filterCell.filterItem.text = optionsFilterList[indexPath.section][indexPath.row]
//      unchecked icon
        filterCell.filterCheck.image = UIImage(named: "unchecked")?.withRenderingMode(.alwaysTemplate)
        filterCell.filterCheck.tintColor = UIColor(named: "Green")
        
        return filterCell
    }
    
//   give each section a title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
//    change image on click for each item
var toggleFlag: Bool = true

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let filterCell = tableView.cellForRow(at: indexPath) as! CustomViewCell
    if (toggleFlag == true) {
        filterCell.filterCheck.image = UIImage(named: "checked")?.withRenderingMode(.alwaysTemplate)
        filterCell.filterCheck.tintColor = UIColor(named: "Green")
        toggleFlag = false
    } else {
        filterCell.filterCheck.image = UIImage(named: "unchecked")?.withRenderingMode(.alwaysTemplate)
        filterCell.filterCheck.tintColor = UIColor(named: "Green")
        toggleFlag = true
    }
    
    print(optionsFilterList[indexPath.section][indexPath.row])

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
