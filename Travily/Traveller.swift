//
//  Traveler.swift
//  Travily
//
//  Created by Alessio Di Matteo on 19/11/2019.
//  Copyright © 2019 Time Travelers. All rights reserved.
//

import Foundation

class Traveller{
    var name:String
    var items:[String] = []
    
    /*
     constructor
     */
    init(newName:String) {
        self.name = newName
    }
    
    /*
     getter and setter
     */
    public func setName(name:String){
        self.name = name
    }
    
    public func getName()->String{
        return self.name
    }
    
    public func setItems(item:String){
        self.items.append(item)
    }
    
    public func getItems()->[String]{
        return self.items
    }
    
    
    public func insertItem(item : String){
        self.setItems(item : item)
    }
    
    public func removeItem(item:Item){
        
    }
}
