//
//  FirstViewController.swift
//  Bucket List
//
//  Created by Erin Wiegman on 2/19/18.
//  Copyright © 2018 Erin Wiegman. All rights reserved.
//

import UIKit

//make global so it can be accessed by other scripts
var toDoList:[String] = ["Go ice skating", "See Christmas lights", "Go to the beach"]

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var toDoTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDoCell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as! CustomViewCell
        toDoCell.toDoItem.text = toDoList[indexPath.row]
        toDoCell.toDoCheck.image = UIImage(named: "unchecked")?.withRenderingMode(.alwaysTemplate)
        toDoCell.toDoCheck.tintColor = UIColor(named: "Green")
        
        return toDoCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            toDoList.remove(at: indexPath.row)
            toDoTableView.reloadData()
        }
    }
    
//    change image on click
        var toggleFlag: Bool = true

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDoCell = tableView.cellForRow(at: indexPath) as! CustomViewCell
        if (toggleFlag == true) {
            toDoCell.toDoCheck.image = UIImage(named: "checked")?.withRenderingMode(.alwaysTemplate)
            toDoCell.toDoCheck.tintColor = UIColor(named: "Green")
        toggleFlag = false
    } else {
            toDoCell.toDoCheck.image = UIImage(named: "unchecked")?.withRenderingMode(.alwaysTemplate)
            toDoCell.toDoCheck.tintColor = UIColor(named: "Green")
        toggleFlag = true

    }
       
        print("\(toDoList[indexPath.row])")

    }
    
//    @IBOutlet weak var button: UIButton!
//
//
//    @IBAction func buttonFun(_ sender: Any) {
//
//        if (toggleFlag == true) {
//            //change color on click
//            button.tintColor = UIColor.init(named: "ok")
//            //change image on click - use this for checked
//            button.setBackgroundImage(UIImage(named: "user_group_man_woman"), for: .normal)
//            toggleFlag = false
//        } else {
//            button.tintColor = UIColor.init(named: "wine")
//            button.setBackgroundImage(UIImage(named: "people"), for: .normal)
//            toggleFlag = true
//
//        }
    
    override func viewDidAppear(_ animated: Bool) {
        toDoTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

