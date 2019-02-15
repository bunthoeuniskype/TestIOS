//
//  MyWebViewController.swift
//  TestApp
//
//  Created by Admin on 2/15/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class MyWebViewController: UIViewController {
    
    @IBOutlet weak var myWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("workign webview")
        let site_url = URL(string: "https://wzones.com/")
        let request = URLRequest(url: site_url!)
        myWebView.loadRequest(request)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
}
