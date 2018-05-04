//
//  ViewController.swift
//  Calculator
//
//  Created by Shishir P on 06/12/17.
//  Copyright © 2017 Shishir P. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        label.text = label.text! + String(sender.tag-1)
        numberOnScreen = Double(label.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16{
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

