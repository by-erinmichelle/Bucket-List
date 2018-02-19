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
        let toDoCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "toDoCell")
        toDoCell.textLabel?.text = toDoList[indexPath.row]
        toDoCell.imageView?.image = UIImage(named: "unchecked")?.withRenderingMode(.alwaysTemplate)
        toDoCell.imageView?.tintColor = UIColor(named: "Green")
        
        return toDoCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            toDoList.remove(at: indexPath.row)
            toDoTableView.reloadData()
        }
    }
    
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

