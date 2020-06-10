//
//  Luggage.swift
//  Travily
//
//  Created by Claudio De Simone on 19/11/2019.
//  Copyright © 2019 Time Travelers. All rights reserved.
//

import Foundation


class Luggage {

    var name : String
    var items:[String] = []
    
    
    init(name: String) {
        self.name = name
    }
    
    public func setName(name : String){
        self.name = name
    }
    
    public func getName()->String{
        return self.name
    }
    
    public func setItems(item : String){
        self.items.append(item)
    }
    
    public func getItems()->[String]{
        return self.items
    }
    
}
