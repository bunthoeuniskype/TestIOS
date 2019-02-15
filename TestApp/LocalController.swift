//
//  LocalController.swift
//  TestApp
//
//  Created by Admin on 2/15/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit


class LocalController: UIViewController {
    
    

    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblCode: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        //Implementing URLSession
        let urlString = "http://ip-api.com/json/203.144.79.181"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }

            guard let data = data else { return }
            
            //Implement JSON decoding and parsing
            do {
                //Decode retrived data with JSONDecoder and assing type of Article object
                let geoData = try JSONDecoder().decode(GeoIP.self, from: data)
                
                //Get back to the main queue
                DispatchQueue.main.async {
                    print(geoData)
                    self.lblCity.text = "\(geoData.city)"
                    self.lblCountry.text =  "\(geoData.country)"
                    self.lblCode.text = "\(geoData.countryCode)"
                    //self.collectionView?.reloadData()
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
            }.resume()
        //End implementing URLSession
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

