//
//  SegmentedControlViewController.swift
//  Travily
//
//  Created by Alessandro Barruffo on 22/11/2019.
//  Copyright © 2019 Time Travelers. All rights reserved.
//

import UIKit

class SegmentedControlViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   

    
       
    var travel = Travel(destinationName: "", date: "",numbTravellers: 0,numbLuggages: 0,travellers: [],luggages: [])
    
    var labelTravellerName = UILabel()
    
    var namesOfTravellers : [String] = []
    var namesOfLuggages : [String] = []
    
    var numberOfTraveller = 0
    
    var count = 0
    

    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet var tableView: UITableView! = UITableView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = travel.destination

        
        tableView.delegate = self
        tableView.dataSource = self
    }
    

    @IBAction func switchViews(_ sender: UISegmentedControl) {
        
        tableView.reloadData()
    }
    
    
    func saveTraveller(name : String){
        
        UserDefaults.standard.set(name,forKey: "nameOfTraveller")
        
    }
    
    
    
    @IBAction func newElement(_ sender: UIBarButtonItem) {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            
            let alert = UIAlertController(title: "New Traveller",
                                                 message: "Add a new traveller",
                                                 preferredStyle: .alert)
                   
                   let saveAction = UIAlertAction(title: "Save",
                                                  style: .default) {
                     [unowned self] action in
                                                   
                     guard let textField = alert.textFields?.first,
                       let nameToSave = textField.text else {
                         return
                     }
                                                    
                    let traveller = Traveller(newName: nameToSave)
                     
                    self.travel.travellers.append(traveller)
                    self.namesOfTravellers.append(nameToSave)
                    self.saveTraveller(name: nameToSave)
                                                    
                     self.tableView.reloadData()
                   }
                   
                   let cancelAction = UIAlertAction(title: "Cancel",
                                                    style: .cancel)
                   
                   alert.addTextField()
                   
                   alert.addAction(saveAction)
                   alert.addAction(cancelAction)
                   
                   present(alert, animated: true)
            
            
        }
        else {
            
            
            let alert = UIAlertController(title: "New Luggage",
                                                            message: "Add a new luggage",
                                                            preferredStyle: .alert)
                              
        let saveAction = UIAlertAction(title: "Save",style: .default) {
                                [unowned self] action in
                                                              
                                guard let textField = alert.textFields?.first,
                                  let nameToSave = textField.text else {
                                    return
                                }
                                                               
            let luggage = Luggage(name: nameToSave)
                                
                               self.travel.luggages.append(luggage)
                            self.namesOfLuggages.append(nameToSave)
                                self.tableView.reloadData()
                              }
                              
                              let cancelAction = UIAlertAction(title: "Cancel",
                                                               style: .cancel)
                              
                              alert.addTextField()
                              
                              alert.addAction(saveAction)
                              alert.addAction(cancelAction)
                              
                              present(alert, animated: true)
                       
            
            
            
            
            
        }
    }
    
    

    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
                      if segmentedControl.selectedSegmentIndex == 0 {
                  
                          
     
                        return travel.travellers.count
                          
                      }else {
                          
                        return travel.luggages.count
                          
                          
                      }

       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        if segmentedControl.selectedSegmentIndex == 0 {
            
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
                           
            cell.textLabel?.text = travel.travellers[indexPath.row].getName()
        }else {
            
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
            cell.textLabel?.text = travel.luggages[indexPath.row].getName()
            
        }
              
                 
                 
                 return cell
       }
    
    
    
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        if segmentedControl.selectedSegmentIndex == 0 {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DvC = Storyboard.instantiateViewController(identifier: "TravellersViewController") as! TravellersViewController
            DvC.getName = travel.travellers[indexPath.row].getName()
        DvC.travel = self.travel
            self.navigationController?.pushViewController(DvC, animated: true)
        }
            
        else {
            
            
            let Storyboard = UIStoryboard(name: "Main", bundle: nil)
            let DvC = Storyboard.instantiateViewController(identifier: "LuggagesViewController") as! LuggagesViewController
            DvC.getName = travel.luggages[indexPath.row].getName()
            DvC.travel = self.travel
            self.navigationController?.pushViewController(DvC, animated: true)
            
            
        }
        
     
 
        
           }
    
    @IBAction func doneButton(_ sender: UIButton) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DvC = Storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        DvC.travel = self.travel
    }
    //     override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//       {
//        if(count != 0){
//           if segue.destination is TravellersViewController
//           {
//               let vc = segue.destination as? TravellersViewController
//
//            vc?.numberOfTraveller = self.numberOfTraveller
////            vc?.travellerName = self.labelTravellerName.text!
//
//
//            vc?.labelTravellerName = self.labelTravellerName
//
//            vc?.labelTravellerName.text = "Traveller \(self.numberOfTraveller+1)"
//            print(self.numberOfTraveller)
//
//           }
//       }
//    }
    /*
    func saveNumber(number : Int) {
        
        default.Set(value : "Pippo" )

        
    }
 */
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

        
        
}

