//
//  ViewController.swift
//  TestApp
//
//  Created by Admin on 2/10/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

var rowCounter:Int = 0

class ViewController: UIViewController {
    
    @IBOutlet weak var txtWel: UITextField!
    @IBOutlet weak var lblWel: UILabel!
    
    @IBAction func btnWel(_ sender: Any) {
        lblWel.text = txtWel.text
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(rowCounter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

}

