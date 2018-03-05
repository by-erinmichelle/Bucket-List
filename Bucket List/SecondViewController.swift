//
//  SecondViewController.swift
//  Bucket List
//
//  Created by Erin Wiegman on 2/19/18.
//  Copyright © 2018 Erin Wiegman. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
//    completed items. when item is checked in to do its moved to this array
    var doneList = ["Go to a pumpkin patch", "Visit cousins"]
    
//    getting the items from to do list, store them here
//    var transImg:String?
    var transName:String?
    
    @IBOutlet weak var doneTableView: UITableView!

//    number of rows = number of completed items
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(doneList.count)
    }

//    custom view cell setup
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let doneCell = tableView.dequeueReusableCell(withIdentifier: "doneCell", for: indexPath) as! CustomViewCell
//        label for completed item
        doneCell.doneItem.text = doneList[indexPath.row]
//        checked img
        doneCell.doneCheck.image = UIImage(named: "checked")?.withRenderingMode(.alwaysTemplate)
        doneCell.doneCheck.tintColor = UIColor(named: "Green")
        
        return(doneCell)
    }
    
//    uncheck button on click
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let doneCell = tableView.cellForRow(at: indexPath) as! CustomViewCell
        doneCell.doneCheck.image = UIImage(named: "unchecked")?.withRenderingMode(.alwaysTemplate)
        doneCell.doneCheck.tintColor = UIColor(named: "Green")
        
        print(doneList[indexPath.row])
        
    }

    override func viewDidAppear(_ animated: Bool) {
       
    }
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

