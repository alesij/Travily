//
//  PrintViewController.swift
//  Travily
//
//  Created by Claudio De Simone on 24/11/2019.
//  Copyright © 2019 Time Travelers. All rights reserved.
//

import UIKit

class PrintViewController: UIViewController {
    

     
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        if (defaults.array(forKey: "myItems") != nil){
            print("true")
            let claudio = UserDefaults.standard.array(forKey: "myItems")
            print(claudio!)
        }else{
            
            print("false")
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
