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



class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//////////////////////////
//    outlets--------------------------------------------
/////////////////////////
    @IBOutlet weak var toDoTableView: UITableView!
    
    
//////////////////////////
//    vars--------------------------------------------
/////////////////////////
    // Link context to persistentContainer
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var toDoEntity: [ToDo] = []

//////////////////////////
//    number of rows--------------------------------------------
/////////////////////////
    //    number of rows = number of to do items
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoEntity.count
    }

//////////////////////////
//    custom cell setup--------------------------------------------
/////////////////////////
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDoCell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as! CustomViewCell

       
            let onetoDoItem = toDoEntity[indexPath.row]
            if (onetoDoItem.isChecked == false) {
                toDoCell.toDoItem.text = onetoDoItem.toDoItemName
                toDoCell.toDoCheck.image = UIImage(named: "unchecked")?.withRenderingMode(.alwaysTemplate)
                toDoCell.toDoCheck.tintColor = UIColor(named: "Green")
                print("its false")
            }
        
        return toDoCell
    }
    
    
    //////////////////////////
    //    delete a to do item--------------------------------------------
    /////////////////////////
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // extract item from array
            let oneToDoItem = toDoEntity[indexPath.row]
            // Delete that item from context
            context.delete(oneToDoItem)
            // Save context back to CoreData
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            // get fresh data
            getData()
            // Reload table view
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

        let onetoDoItem = toDoEntity[indexPath.row]
        //change the boolean
        onetoDoItem.isChecked = true
        
        // check item
        if (onetoDoItem.isChecked == true) {
            toDoCell.toDoItem.text = onetoDoItem.toDoItemName
            
            // Fade out to set the text
            UIView.animate(withDuration: 0.5, delay: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
                toDoCell.toDoItem.alpha = 0.0
                toDoCell.toDoCheck.alpha = 0.0
                toDoCell.toDoCheck.image = UIImage(named: "checked")?.withRenderingMode(.alwaysTemplate)
                toDoCell.toDoCheck.tintColor = UIColor(named: "Green")
            }, completion: {
                (finished: Bool) -> Void in
                
                //Once the label is completely invisible, set the text and fade it back in
      
                
                // Fade in
                UIView.animate(withDuration: 0.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                    toDoCell.toDoItem.alpha = 1.0
                    toDoCell.toDoCheck.alpha = 1.0
                    self.context.delete(onetoDoItem)
                    // Save context back to CoreData
                    (UIApplication.shared.delegate as! AppDelegate).saveContext()
                    // get fresh data
                    self.getData()
                    // Reload table view
                    self.toDoTableView.reloadData()
                }, completion: nil)
            })
            print("check true")
        } else {
            print("check false")
        }
        //        selectName = toDoList[indexPath.row]
        //                self.performSegue(withIdentifier: "itemChecked", sender: nil)
        
        
    }
    
    
    //////////////////////////
    //    reload data here --------------------------------------------
    /////////////////////////
    override func viewDidAppear(_ animated: Bool) {
        getData()

        toDoTableView.reloadData()
    }
    
    
    func getData() {
        // Read to do Entity into toDoEntity
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

