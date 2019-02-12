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
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            print("Why are you shaking me?")
        }
    }
    
    @objc
    func swiped(sender:UISwipeGestureRecognizer)  {
            switch sender.direction{
                case UISwipeGestureRecognizerDirection.left:
                     self.performSegue(withIdentifier: "MyMusicSeque", sender: nil)
                default:
                
                break
            }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

}
