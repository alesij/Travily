//
//  Travel.swift
//  Travily
//
//  Created by Alessandro Barruffo on 19/11/2019.
//  Copyright © 2019 Time Travelers. All rights reserved.
//

import Foundation



class Travel {
    
    
    var destination : String
    var departureDate : String
    var numberOfTravellers : Int
    var numberOfLuggages : Int
    var travellers : [Traveller]
    var luggages: [Luggage]
    
   
    
    init( destinationName : String , date : String, numbTravellers : Int, numbLuggages : Int,travellers : [Traveller], luggages : [Luggage]){
       destination = destinationName
       departureDate = date
        numberOfTravellers = numbTravellers
        numberOfLuggages = numbLuggages
        self.travellers = travellers
        self.luggages = luggages
    }
    
    public func setDestination(destinationName : String){
        self.destination = destinationName
    }
    
    public func getDestination()->String{
        return destination
    }
    
    public func setDeparture(departure : String){
        self.departureDate = departure
    }
    
    public func getDeparture()->String{
        return departureDate
    }
    public func getNumberOfTravellers() -> Int {
        
        return numberOfTravellers
    }
    public func setNumberOfTravellers(numTravellers : Int) {
        
        self.numberOfTravellers = numTravellers
    }
    
    
    public func getNumberOfLuggages() -> Int {
           
           return numberOfLuggages
       }
       public func setNumberOfLuggages(numLuggages : Int) {
           
           self.numberOfLuggages = numLuggages
       }
       
    
    public func setTravellers(traveller : Traveller){
        
        self.travellers.append(traveller)
    }
    
    public func getTravellers()->[Traveller]{
        return travellers
    }
    public func addLuggage(luggage : Luggage){
        self.luggages.append(luggage)
    }
    
    public func getLuggages()->[Luggage]{
        return self.luggages 
    }
    


}
