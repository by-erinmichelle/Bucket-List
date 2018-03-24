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

//    var transName:String?
    var transRowNum: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        if let tmpRowNum = transRowNum{
            getData()

            let onetoDoItem = toDoEntity[tmpRowNum]
print(tmpRowNum)
            itemName.text = onetoDoItem.toDoItemName
//            detKind.text = oneWine.wineKind
//            detYear.text = oneWine.wineYear
//            detPrice.text = oneWine.winePrice
//            detAdd.text = oneWine.wineAdd
        }
    }
    
    func getData(){
        do{
            toDoEntity = try context.fetch(ToDo.fetchRequest())
            print("toads are here from coredata")
        }
        catch {
            print("NO TOADS HERE GO FETCH THEM FROM THE FUCKIN COREDATA")
        }
    }
//        //if transname has info
//        if let tmpStr = transName {
//            itemName.text = tmpStr
//            print(tmpStr)
//        } else {
//            //if theres no details yet
//            print("nothing")
//            itemName.text = "you dont have anything"
//        }
//    }

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
