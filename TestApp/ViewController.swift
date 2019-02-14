//
//  ViewController.swift
//  TestApp
//
//  Created by Admin on 2/10/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import CoreData

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
        // createUserCore()
        retrieveUserCore()
        //updateUserCore()
        // deleteUserCore()
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            print("Why are you shaking me?")
        }
    }
    
    func createUserCore()  {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userEntity = NSEntityDescription.entity(forEntityName: "Users", in: managedContext)!
        
        for i in 1...5{
            let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
            user.setValue("User \(i)", forKey: "username")
            user.setValue("pass\(i)", forKey: "password")
            user.setValue("user\(i)@email.com", forKey: "email")
        }
        
        do{
            try managedContext.save()
        } catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    func retrieveUserCore()  {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            
            for data in result as! [NSManagedObject]{
                print(data.value(forKey: "username") as! String)
            }
        }catch{
            print("failed")
        }
        
    }
    
    
    func updateUserCore()  {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        fetchRequest.predicate = NSPredicate(format: "username = %@", "User 1")
        
        do{
                let result = try managedContext.fetch(fetchRequest)
         
                let user = result[0] as! NSManagedObject
                user.setValue("User edit", forKey: "username")
                user.setValue("passedit", forKey: "password")
                user.setValue("useredit@email.com", forKey: "email")
                
                do {
                    try managedContext.save()
                }catch {
                    print(error)
                }
            
            
        }catch{
            print("failed")
        }
        
    }
    
    func deleteUserCore()  {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        fetchRequest.predicate = NSPredicate(format: "username = %@", "User 2")
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            
          
                let user = result[0] as! NSManagedObject
                managedContext.delete(user)
                do {
                    try managedContext.save()
                }catch {
                    print(error)
                }
            
            
        }catch{
            print("failed")
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
