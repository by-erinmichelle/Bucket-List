//
//  ThirdViewController.swift
//  Bucket List
//
//  Created by Erin Wiegman on 2/19/18.
//  Copyright © 2018 Erin Wiegman. All rights reserved.
//

import UIKit
//let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))

class ThirdViewController: UIViewController {

    
//////////////////////////
//    outlets--------------------------------------------
/////////////////////////
    @IBOutlet weak var newItemInput: UITextField!
    @IBOutlet weak var newItemBtn: UIButton!
    @IBOutlet weak var newItemNotes: UITextView!
    @IBOutlet weak var newItemDate: UITextField!
    
    //add to item to to do list by clicking "save"
    @IBAction func newItemBtn(_ sender: Any) {
        
        if (newItemInput.text != "") {
          
        print("Save data to CoreData")

        // Link context to persistentContainer
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // link Obj to entity
        let toDoObj = ToDo(context: context)
        // Update atrributes with entity
        toDoObj.toDoItemName = newItemInput.text
        toDoObj.toDoItemNotes = newItemNotes.text
        toDoObj.toDoItemDate = newItemDate.text

        //clear input to enter new item
        newItemInput.text = ""
        newItemNotes.text = ""
        newItemDate.text = ""

        //remove "no items" msg
        emptyMessage.removeFromSuperview()
    
        // change text
        self.newItemBtn.setTitle("Save to Bucket List", for: .normal)
        self.newItemBtn.setTitle("Saved!", for: .highlighted)

        // Save to Context back to CoreData
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
        } else {
            print("nothing to save")
        }
        
    }

    //////////////////////////
    //    vars--------------------------------------------
    /////////////////////////

    //////////////////////////
    //    reload data--------------------------------------------
    /////////////////////////
    override func viewDidAppear(_ animated: Bool) {
    
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
