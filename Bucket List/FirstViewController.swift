//
//  FirstViewController.swift
//  Bucket List
//
//  Created by Erin Wiegman on 2/19/18.
//  Copyright © 2018 Erin Wiegman. All rights reserved.
//

import UIKit

//////////////////////////
//    global vars--------------------------------------------
/////////////////////////
//make global so it can be accessed by other scripts
var toDoList:[String] = ["Go ice skating", "See Christmas lights", "Go to the beach"]

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//////////////////////////
//    outlets--------------------------------------------
/////////////////////////
    //    connect to do table view
    @IBOutlet weak var toDoTableView: UITableView!
    
    
//////////////////////////
//    number of rows--------------------------------------------
/////////////////////////
    //    number of rows = number of to do items
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    
//////////////////////////
//    custom cell setup--------------------------------------------
/////////////////////////
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDoCell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as! CustomViewCell
        // label to do item
        toDoCell.toDoItem.text = toDoList[indexPath.row]
        // unchecked img
        toDoCell.toDoCheck.image = UIImage(named: "unchecked")?.withRenderingMode(.alwaysTemplate)
        toDoCell.toDoCheck.tintColor = UIColor(named: "Green")
        
        return toDoCell
    }
    
    
    //////////////////////////
    //    delete a to do item--------------------------------------------
    /////////////////////////
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            toDoList.remove(at: indexPath.row)
            toDoTableView.reloadData()
        }
    }
    //    global vars
    var selectName:String = ""
    
    
    //////////////////////////
    //    select row --------------------------------------------
    /////////////////////////
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDoCell = tableView.cellForRow(at: indexPath) as! CustomViewCell
        toDoCell.toDoCheck.image = UIImage(named: "checked")?.withRenderingMode(.alwaysTemplate)
        toDoCell.toDoCheck.tintColor = UIColor(named: "Green")
        //        selectName = toDoList[indexPath.row]
        //
        //                self.performSegue(withIdentifier: "itemChecked", sender: nil)
        
        print(selectName)
        print(toDoList[indexPath.row])
        
    }
    
    
    //////////////////////////
    //    reload data here --------------------------------------------
    /////////////////////////
    override func viewDidAppear(_ animated: Bool) {
        toDoTableView.reloadData()
    }
    
    //////////////////////////
    //    view loaded into memory--------------------------------------------
    /////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let doneObj = segue.destination as! SecondViewController
//        doneObj.transName = selectName
//    }


}

