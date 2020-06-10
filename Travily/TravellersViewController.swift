//
//  SecondViewController.swift
//  Travily
//
//  Created by Claudio De Simone on 20/11/2019.
//  Copyright © 2019 Time Travelers. All rights reserved.
//
import UIKit

class TravellersViewController: UIViewController,UITableViewDataSource {
    
    @IBAction func save(_ sender: Any) {
        saveItems()
    }
    

    
//tableView
    @IBOutlet weak var travellersTableView: UITableView!
    
    
    let defaults = UserDefaults.standard
    @IBOutlet var labelTravellerName: UILabel! = UILabel()
    
    var getName = String()
    var travel = Travel(destinationName: "", date: "", numbTravellers: 0, numbLuggages: 0, travellers: [], luggages: [])
    
    var items: [String] = []
    var indexTraveller : Int = 0
    

    @IBAction func newElement(_ sender: UIButton) {
        
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
                    print(self.travel.travellers[self.indexTraveller].getName())
                    print(item)
                    self.travel.travellers[self.indexTraveller].items.append(item)
                    self.travellersTableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                                           style: .cancel)
                          
                          alert.addTextField()
                          
                          alert.addAction(saveAction)
                          alert.addAction(cancelAction)
                          
                          present(alert, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travel.travellers[indexTraveller].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              let cell = tableView.dequeueReusableCell(withIdentifier: "travellersCell", for: indexPath)
            cell.textLabel?.text = self.travel.travellers[indexTraveller].items[indexPath.row]
            
            return cell
    }
    
    

    @IBAction func doneButton(_ sender: UIButton) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DvC = Storyboard.instantiateViewController(identifier: "SegmentedControlViewController") as! SegmentedControlViewController
        DvC.travel = self.travel
        DvC.count = 1
         self.navigationController?.pushViewController(DvC, animated: true)
    }
    

    

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        self .travellersTableView.dataSource = self
//       let name = UserDefaults.standard.string(forKey: "nameOfTraveller")
        
//        labelTravellerName.text = name
  
        
        
        
        labelTravellerName.text! = getName
//        print(travellerName)
//        print(labelTravellerName.text)
        // Do any additional setup after loading the view.
        var index = 0
        while index < travel.travellers.count {
            if (labelTravellerName.text == travel.travellers[index].getName()){
                self.indexTraveller = index
            }
            index = index + 1
        }
    }
        
    func saveItems(){
        UserDefaults.standard.set(items, forKey: "myItems")
    }
    
  


    


}

