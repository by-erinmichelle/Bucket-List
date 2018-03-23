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
let emptyMessage = UILabel(frame: CGRect(x: 60, y: 11, width: 245, height: 22))


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
    
    let customFont = UIFont(name: "Raleway-Regular", size: 16.0)


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
            
            UIView.animate(withDuration: 0.5, delay: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
                toDoCell.toDoItem.alpha = 0.0
                toDoCell.toDoCheck.alpha = 0.0
                toDoCell.toDoCheck.image = UIImage(named: "checked")?.withRenderingMode(.alwaysTemplate)
                toDoCell.toDoCheck.tintColor = UIColor(named: "Green")
            }, completion: {
                (finished: Bool) -> Void in
             
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
        } // end if
        //        selectName = toDoList[indexPath.row]
        //                self.performSegue(withIdentifier: "itemChecked", sender: nil)
        
        
    }
    
    
    //////////////////////////
    //    reload data here --------------------------------------------
    /////////////////////////
    override func viewDidAppear(_ animated: Bool) {
        print("view appeared")
        getData()
       
        
        toDoTableView.reloadData()
    }
    
    
    func getData() {
        // Read to do Entity into toDoEntity
        do {
            toDoEntity = try context.fetch(ToDo.fetchRequest())

            if (toDoEntity.count == 0) {
                print("noitems")
                // CGRectMake has been deprecated - and should be let, not var
                
                // you will probably want to set the font (remember to use Dynamic Type!)
                emptyMessage.font = UIFont.preferredFont(forTextStyle: .footnote)
                
                // and set the text color too - remember good contrast
                emptyMessage.textColor = .black
                
                // may not be necessary (e.g., if the width & height match the superview)
                // if you do need to center, CGPointMake has been deprecated, so use this
                emptyMessage.center = CGPoint(x: 160, y: 284)
                
                // this changed in Swift 3 (much better, no?)
                emptyMessage.textAlignment = .center
                
                emptyMessage.text = "I am a test label"
                
                self.view.addSubview(emptyMessage)
            } else {
//                print("hide it")
//                label.removeFromSuperview()
//                label.text = nil
//                print("FUCING hide it")

            }
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

