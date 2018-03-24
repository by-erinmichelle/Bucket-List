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
let emptyMessage = UILabel(frame: CGRect(x: 15, y: 50, width: 300, height: 80))

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//////////////////////////
//    vars--------------------------------------------
/////////////////////////
// Link context to persistentContainer
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
var toDoEntity: [ToDo] = []
let customFont = UIFont(name: "Raleway-Regular", size: 16.0)

//////////////////////////
//    outlets--------------------------------------------
/////////////////////////
    @IBOutlet weak var toDoTableView: UITableView!

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
                toDoCell.toDoDetails.setImage(UIImage(named: "forward")?.withRenderingMode(.alwaysTemplate), for: .normal)
                toDoCell.toDoDetails.tintColor = UIColor(named: "Blue")
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
  
    }

    
//////////////////////////
//    detail btn --------------------------------------------
/////////////////////////
    var selRowNum:Int = 0

    @IBAction func showDetail(_ sender:UIButton) {
        var superView = sender.superview
        while !(superView is UITableViewCell) {
            superView = superView?.superview
        }
        let cell = superView as! UITableViewCell
        if let indexPath = toDoTableView.indexPath(for: cell){
            selRowNum = indexPath.row
            self.performSegue(withIdentifier: "showDetail", sender: nil)
//          print(selRowNum)
        }
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
                emptyMessage.font = customFont
                emptyMessage.textColor = UIColor(named: "Text")
                emptyMessage.numberOfLines = 3
                
                emptyMessage.text = "You don't have anything on your bucket list right now. Click the 'Add Item' tab to set some goals!"
                
                self.view.addSubview(emptyMessage)
            } else {
            }
        }
        catch {
            print("Entity Fetching Failed")
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            let detailObj = segue.destination as! DetailViewController
            detailObj.transRowNum = selRowNum
        }
    }
    

    
    
//////////////////////////
//    filter data--------------------------------------------
/////////////////////////
//    var item:[ToDo]? = nil
//
//    class func filterData() -> [ToDo]? {
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        let fetchRequest:NSFetchRequest<ToDo> = ToDo.fetchRequest()
//        var item:[ToDo]? = nil
//
//        let predicate = NSPredicate(format: "toDoItemName contains[summer] %@", "summer")
//        fetchRequest.predicate = predicate
//
//        do {
//            item = try context.fetch(fetchRequest)
//            return item
//
//        }catch {
//            return item
//        }
//    }
//    @IBAction func test(_ sender: Any) {
//        item = FirstViewController.filterData()
//        for i in item! {
//            print("item name: \(i.toDoItemName!)")
//
//        }
//    }
    
    
}


