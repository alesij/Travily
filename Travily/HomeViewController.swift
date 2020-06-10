//
//  ViewController.swift
//  Travily
//
//  Created by Jonathan Ng on 19/11/2019.
//  Copyright © 2019 Time Travelers. All rights reserved.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {
    @IBOutlet weak var labelDestination: UILabel!
    
    




var travel = Travel(destinationName: "Rome", date: "",numbTravellers: 0,numbLuggages: 0,travellers: [],luggages: [])
    
@IBOutlet var datePickerView: UIView!
   
    
@IBOutlet var doneButton: UIButton!
    
@IBOutlet weak var dateButton: UIButton!
    
@IBOutlet weak var dataPicker: UIDatePicker!
    
 @IBOutlet weak var numberPeopleStepper: UIStepper!
    
@IBOutlet weak var numberLuggageStepper: UIStepper!
    
@IBOutlet weak var labelPeopleStepper: UILabel!
    
   
@IBOutlet weak var labelLuggageStepper: UILabel!
    
    
@IBAction func valueChangedLuggage(_ sender: UIStepper) {
        
        labelLuggageStepper.text = String(Int(sender.value))
        
    }
    
    
@IBAction func valueChangedPeople(_ sender: UIStepper) {
        
        labelPeopleStepper.text = String(Int(sender.value))
    }
    
    
@IBAction func doneButtonTapped(_ sender: UIButton) {
        
        datePickerView.isHidden = true
        
        
    }
    
@IBAction func dateButtonTapped(_ sender: UIButton) {
        
        datePickerView.isHidden = false
        doneButton.isHidden = false
        
    }
    
    
func setInitialDate () {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, YYYY"
        somedateString = formatter.string(from: date)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
        
        setInitialDate()
//        textFieldDestination.resignFirstResponder()
        
        
       
//        labelDestination.text! = travel.destination
 
    }
    
    /*
     list of item avaiable
     */
    var items = ["Jeans" , "Shirt" , "Sunglasses", "Watch"]

 
    /*
     date for date formatter (String)
     */
    var somedateString : String = ""
    
    
    /*
     dichiarazione textField destinazione
     */
@IBOutlet  var textFieldDestination: UITextField! = UITextField()
    
    
    /*
     ad ogni cambio del data picker viene aggiornata la variabile someDateString
     */
@IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, YYYY"
        somedateString = dateFormatter.string(from: sender.date)
        
    }
    
    /*
     alla pressione del bottone next viene creato l'oggetto di tipo viaggio prendendo il valore nel textfield e del datapicker
     */
    @IBAction func setUpTravelButton(_ sender: UIButton) {
        
        
        let destination = textFieldDestination.text!
        
//        let newTravel = Travel(destinationName:destination, date: somedateString)
        
        self.travel.setDestination(destinationName: destination)
        self.travel.setDeparture(departure: somedateString)
        self.travel.setNumberOfTravellers(numTravellers: Int(labelPeopleStepper.text!)!)
        self.travel.setNumberOfLuggages(numLuggages : Int(labelLuggageStepper.text!)!)
        
        let numberOfTravellers =  self.travel.getNumberOfTravellers()
        
        
        for i in 1...numberOfTravellers{
            
            let traveller = Traveller(newName : "Traveller \(i)")
            
            self.travel.travellers.append(traveller)
       
        }
        
        let numberOfLuggages = self.travel.getNumberOfLuggages()
        
        
        for i in 1...numberOfLuggages{
                
            let luggage = Luggage(name: "Luggage \(i)")
                 
                 self.travel.luggages.append(luggage)
            
             }

            
            
                   
    
        
        
       
        /*
        var i = 0
        var k = 0
        var positionOfTravel = 0
       
        while k < travels.count{
            if travels[k].destination == textFieldDestination.text && travels[k].getDeparture() == somedateString{
                positionOfTravel = k
            }
            k = k+1
        }
        while(i < numberOfTraveller!)
        {
            let traveller = Traveller(newName: "Traveller \(i+1)")
            travels[positionOfTravel].setTravellers(traveller: traveller)
            i = i+1
        }
 */
        
        
        /*
        var y = 0
        var z=0
        while (y < travels.count){
            print("number of travel \(travels.count)")
            print("number of travellers \(travels[y].travellers.count)")
        print(travels[y].departureDate)
        print(travels[y].destination)
            z=0
            while(z < travels[y].travellers.count){
        print(travels[y].travellers[z]?.getName() ?? 0)
                z = z+1
            }
            y = y+1
        }
 
 */ 
    }
 
       
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
       
    @IBAction func settingTravelDone(_ sender: UIButton) {
        let destination = textFieldDestination.text!
                
        //        let newTravel = Travel(destinationName:destination, date: somedateString)
                
                self.travel.setDestination(destinationName: destination)
                self.travel.setDeparture(departure: somedateString)
            let Storyboard = UIStoryboard(name: "Main", bundle: nil)
            let DvC = Storyboard.instantiateViewController(identifier: "SegmentedControlViewController") as!  SegmentedControlViewController
            DvC.travel = self.travel
            self.navigationController?.pushViewController(DvC, animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is SegmentedControlViewController
        {
            let vc = segue.destination as? SegmentedControlViewController
            vc?.travel = self.travel
         
           
            
        }
    }
    
    
}

