//
//  AboutViewController.swift
//  BullsEyeDemo
//
//  Created by Guliyev Vagif on 8/20/19.
//  Copyright © 2019 Quliyev Vagif. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL (fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }

}
