//
//  FilterViewController.swift
//  Bucket List
//
//  Created by Erin Wiegman on 2/19/18.
//  Copyright © 2018 Erin Wiegman. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var optionsList:[[String]] = [["Spring", "Summer", "Fall", "Winter"], ["Travel", "Food", "Events", "Adventure"]]
    
    var titles:[String] = ["Seasons", "Categories"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionsList[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return optionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filterCell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath) as! CustomViewCell
        filterCell.filterItem.text = optionsList[indexPath.section][indexPath.row]
        filterCell.filterCheck.image = UIImage(named: "unchecked")?.withRenderingMode(.alwaysTemplate)
        filterCell.filterCheck.tintColor = UIColor(named: "Green")
        
        return filterCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    // change image on click - toggle is not working
    //    var toggleFlag: Bool = true
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filterCell = tableView.cellForRow(at: indexPath) as! CustomViewCell
        //        if (toggleFlag == true) {
        filterCell.filterCheck.image = UIImage(named: "checked")?.withRenderingMode(.alwaysTemplate)
        filterCell.filterCheck.tintColor = UIColor(named: "Green")
        //            toggleFlag = false
        //        } else {
        //            filterCell.filterCheck.image = UIImage(named: "unchecked")?.withRenderingMode(.alwaysTemplate)
        //            filterCell.filterCheck.tintColor = UIColor(named: "Green")
        //        }
        //        print("\(optionsList[indexPath.section][indexPath.row])")
        
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
