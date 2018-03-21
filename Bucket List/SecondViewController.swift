//
//  SecondViewController.swift
//  Bucket List
//
//  Created by Erin Wiegman on 2/19/18.
//  Copyright © 2018 Erin Wiegman. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //////////////////////////
    //    outlets--------------------------------------------
    /////////////////////////
    @IBOutlet weak var doneTableView: UITableView!
    
    
    //////////////////////////
    //    vars--------------------------------------------
    /////////////////////////
    //    completed items. when item is checked in to do its moved to this array
    var doneList = ["Go to a pumpkin patch", "Visit cousins"]
    // Link context to persistentContainer
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var toDoEntity: [ToDo] = []
    
    //    getting the items from to do list, store them here
    //    var transImg:String?
    var transName:String?
    
    //////////////////////////
    //    number of rows--------------------------------------------
    /////////////////////////
    //    number of rows = number of completed items
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return(doneList.count)
//        let onetoDoItem = toDoEntity[Int.row]

//        if (onetoDoItem.isChecked == true) {
            return toDoEntity.count
//        }


    }
    
    //////////////////////////
    //    custom view cell setup--------------------------------------------
    /////////////////////////
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let doneCell = tableView.dequeueReusableCell(withIdentifier: "doneCell", for: indexPath) as! CustomViewCell
        
        let onetoDoItem = toDoEntity[indexPath.row]

        //        label for completed item
        doneCell.doneItem.text = onetoDoItem.toDoItemName
//        doneCell.doneItem.text = doneList[indexPath.row]
        //        checked img
        doneCell.doneCheck.image = UIImage(named: "checked")?.withRenderingMode(.alwaysTemplate)
        doneCell.doneCheck.tintColor = UIColor(named: "Green")
        
        return(doneCell)
    }
    
    //////////////////////////
    //    select row--------------------------------------------
    /////////////////////////
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let doneCell = tableView.cellForRow(at: indexPath) as! CustomViewCell
        doneCell.doneCheck.image = UIImage(named: "unchecked")?.withRenderingMode(.alwaysTemplate)
        doneCell.doneCheck.tintColor = UIColor(named: "Green")
        
        print(doneList[indexPath.row])
        
    }
    
    //////////////////////////
    //   view appeared--------------------------------------------
    /////////////////////////
    override func viewDidAppear(_ animated: Bool) {
        getData()
        
        doneTableView.reloadData()
    }
    
    
    func getData() {
        // Read People Entity into peopleArray
        do {
            toDoEntity = try context.fetch(ToDo.fetchRequest())
            print("People Entity Fetching success")
        }
        catch {
            print("People Entity Fetching Failed")
        }
    }
    
    //////////////////////////
    //    view loaded into memory--------------------------------------------
    /////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //if transname has info add it to the doneList on load
        //        if let tmpStr = transName {
        //            doneList.append(tmpStr)
        //            print(tmpStr)
        //
        //        } else {
        //            print("wtf")
        //        }
        //        print(doneList)
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

