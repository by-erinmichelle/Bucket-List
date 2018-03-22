//
//  ThirdViewController.swift
//  Bucket List
//
//  Created by Erin Wiegman on 2/19/18.
//  Copyright © 2018 Erin Wiegman. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //////////////////////////
    //    outlets--------------------------------------------
    /////////////////////////
    @IBOutlet weak var newTableView: UITableView!
    @IBOutlet weak var newItemInput: UITextField!
    
    @IBOutlet weak var newItemBtn: UIButton!

    //add to item to to do list by clicking "save"
    @IBAction func newItemBtn(_ sender: Any) {
        
        if (newItemInput.text != "")
        {
          
        print("Save data to CoreData")

        // Link context to persistentContainer
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // link peopleObj to entity People
        let toDoObj = ToDo(context: context)
        // Update atrributes with entity
        toDoObj.toDoItemName = newItemInput.text
        //clear input to enter new item
        newItemInput.text = ""
                    
            
            // Fade out to set the text
//            UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
//                self.newItemBtn.setTitle("Saved!", for: .normal)
//
//            }, completion: {
//                (finished: Bool) -> Void in

                //Once the label is completely invisible, set the text and fade it back in
                self.newItemBtn.setTitle("Save to Bucket List", for: .normal)
                self.newItemBtn.setTitle("Saved!", for: .highlighted)

                
                // Fade in
//                UIView.animate(withDuration: 1.0, delay: 2.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
//                    self.newItemBtn.setTitle("Save to Bucket List", for: .normal)
//
//                }, completion: nil)
//
//
//            })
        // Save to Context back to CoreData
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        } else {
            print("nothing to save")
        }
        
    }

    
    @IBOutlet weak var addCatInput: UITextField!
    
    @IBAction func addCatBtn(_ sender: Any) {
        if (addCatInput.text != "")
        {
            optionsList[1].append(addCatInput.text!)
            newTableView.reloadData()
            addCatInput.text = ""
        }
    }

    
    //////////////////////////
    //    vars--------------------------------------------
    /////////////////////////
    var optionsList:[[String]] = [["Spring", "Summer", "Fall", "Winter"], ["Travel", "Food", "Events", "Adventure"]]
    var titles:[String] = ["Seasons", "Categories"]
    //    change image on click for each item
    var toggleFlag: Bool = true
    
    
    //////////////////////////
    //    number of rows--------------------------------------------
    /////////////////////////
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionsList[section].count
    }
    
    
    //////////////////////////
    //    number of sections--------------------------------------------
    /////////////////////////
    func numberOfSections(in tableView: UITableView) -> Int {
        return optionsList.count
    }
    
    
    //////////////////////////
    //    custom view cell setup--------------------------------------------
    /////////////////////////
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = tableView.dequeueReusableCell(withIdentifier: "newCell", for: indexPath) as! CustomViewCell
        newCell.newItem.text = optionsList[indexPath.section][indexPath.row]
        newCell.newCheck.image = UIImage(named: "unchecked")?.withRenderingMode(.alwaysTemplate)
        newCell.newCheck.tintColor = UIColor(named: "Green")
        
        return newCell
    }
    
    
    //////////////////////////
    //    section titles--------------------------------------------
    /////////////////////////
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    
    //////////////////////////
    //    select row--------------------------------------------
    /////////////////////////
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
    
    
    //////////////////////////
    //    reload data--------------------------------------------
    /////////////////////////
    override func viewDidAppear(_ animated: Bool) {
        newTableView.reloadData()
//        self.newItemBtn.title(for: .normal)

    
    }
    
    
    //////////////////////////
    //    view loaded into memory--------------------------------------------
    /////////////////////////
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
