//
//  LuggagesViewController.swift
//  Travily
//
//  Created by Claudio De Simone on 20/11/2019.
//  Copyright © 2019 Time Travelers. All rights reserved.
//

import UIKit

class LuggagesViewController: UIViewController,UITableViewDataSource {

    
@IBOutlet weak var labelLuggage: UILabel!
    
    var getName = String()
    var travel = Travel(destinationName: "", date: "", numbTravellers: 0, numbLuggages: 0, travellers: [], luggages: [])
 var items: [String] = []
var indexLuggage : Int = 0


 
    
    
    //tableView
    @IBOutlet weak var luggageTableView: UITableView!
    

    @IBAction func newElement(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "New Item",
                                                     message: "Add a new item",
                                                     preferredStyle: .alert)
                       
           let saveAction = UIAlertAction(title: "Save",
                                                      style: .default) {
                         [unowned self] action in
                                                       
                         guard let textField = alert.textFields?.first,
                           let nameToSave = textField.text else {
                             return
                         }
                                                        
                        let item = nameToSave
                        self.items.append(item)
                        self.saveItems()
                       self.travel.luggages[self.indexLuggage].items.append(item)
                                                        self.luggageTableView.reloadData()
            }
            
            let cancelAction = UIAlertAction(title: "Cancel",
                                                               style: .cancel)
                              
                              alert.addTextField()
                              
                              alert.addAction(saveAction)
                              alert.addAction(cancelAction)
                              
                              present(alert, animated: true)
            
        
    }
    
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self .luggageTableView.dataSource = self
        
        // Do any additional setup after loading the view.
        labelLuggage.text! = getName
        print(travel.destination)
        
        title = ""
        print(travel.luggages[0].getName())
        var index = 0
        while index < travel.luggages.count {
            if (labelLuggage.text == travel.luggages[index].getName()){
                self.indexLuggage = index
            }
            index = index + 1
        }
    }
   



    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.travel.luggages[indexLuggage].items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "luggageCell", for: indexPath)
        cell.textLabel?.text = self.travel.luggages[indexLuggage].items[indexPath.row]
        return cell
    }
    
    func saveItems(){
        UserDefaults.standard.set(items, forKey: "myItems")
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DvC = Storyboard.instantiateViewController(identifier: "SegmentedControlViewController") as! SegmentedControlViewController
        DvC.travel = self.travel
        DvC.count = 1
         self.navigationController?.pushViewController(DvC, animated: true)
    }
    
    
}



