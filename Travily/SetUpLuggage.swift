//
//  SetUpLuggage.swift
//  Travily
//
//  Created by Alessio Di Matteo on 23/11/2019.
//  Copyright © 2019 Time Travelers. All rights reserved.
//

import UIKit

class SetUpLuggage: UIViewController {
    
    @IBOutlet weak var labelBlueLuggage: UILabel!
    @IBOutlet weak var labelRedBag: UILabel!
    @IBOutlet weak var labelGreenTrolley: UILabel!
    @IBOutlet weak var labelVioletBackPack: UILabel!
    @IBOutlet weak var stepperGreenLuggage: UIStepper!
    @IBOutlet weak var stepperBlueLuggage: UIStepper!
    @IBOutlet weak var stepperVioletBackPack: UIStepper!
    @IBOutlet weak var stepperRedBag: UIStepper!
    var numberBlueLuggage = 0
    var numberRedBag = 0
    var numberGreenTrolley = 0
    var numberVioletBackPack = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func stepperBluePressed(_ sender: UIStepper) {
        labelBlueLuggage.text = String(Int(sender.value))

    }
    
    @IBAction func stepperGreenPressed(_ sender: UIStepper) {
        labelGreenTrolley.text = String(Int(sender.value))

    }
    
    @IBAction func stepperVioletPressed(_ sender: UIStepper) {
        labelVioletBackPack.text = String(Int(sender.value))
    }
    
    @IBAction func stepperRedPressed(_ sender: UIStepper) {
        labelRedBag.text = String(Int(sender.value))
    }

    @IBAction func nextButtonPressed(_ sender: UIButton) {
        self.numberBlueLuggage = Int(labelBlueLuggage.text!)!
        self.numberRedBag = Int(labelRedBag.text!)!
        self.numberVioletBackPack = Int(labelVioletBackPack.text!)!
        self.numberGreenTrolley = Int(labelGreenTrolley.text!)!
    }
    
}
