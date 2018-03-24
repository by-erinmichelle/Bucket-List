//
//  DetailViewController.swift
//  Bucket List
//
//  Created by Erin Wiegman on 3/23/18.
//  Copyright © 2018 Erin Wiegman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemNotes: UILabel!
    @IBOutlet weak var itemDate: UILabel!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var toDoEntity: [ToDo] = []

    var transRowNum: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let tmpRowNum = transRowNum{
            getData()

            let onetoDoItem = toDoEntity[tmpRowNum]
            print(tmpRowNum)
            itemName.text = onetoDoItem.toDoItemName
            itemNotes.text = onetoDoItem.toDoItemNotes
            itemDate.text = onetoDoItem.toDoItemDate

        }
    }
    
    func getData(){
        do{
            toDoEntity = try context.fetch(ToDo.fetchRequest())
        }
        catch {
            print("failed")
        }
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
