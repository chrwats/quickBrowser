//
//  ViewController.swift
//  EasyBrowser
//
//  Created by CHRISTOPHER WATSON on 05/19/17.
//  Copyright © 2017 CWatson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let defaults = UserDefaults.standard

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == self.textField {
        let url = URL (string: "https://\(textField.text!)")
        let requestObj = URLRequest(url: url! as URL)
        webView.loadRequest(requestObj as URLRequest)
        print(url!)
        //To save the string
        let userDefaults = UserDefaults.standard
        userDefaults.set( "\(textField.text!)", forKey: "lastURL")
        }
        else if textField == self.textField2 {
            let url2 = URL (string: "https://\(textField2.text!)")
            let requestObj = URLRequest(url: url2! as URL)
            webView2.loadRequest(requestObj as URLRequest)
            print(url2!)
            //To save the string
            let userDefaults = UserDefaults.standard
            userDefaults.set( "\(textField.text!)", forKey: "lastURL2")
            
            
        }
        return true
    }
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var webView2: UIWebView!
    @IBOutlet weak var textField2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //To retrieve from the key
        let userDefaults = UserDefaults.standard
        let lastURL  = userDefaults.string(forKey: "lastURL")
        let lastURL2  = userDefaults.string(forKey: "lastURL2")

       // print(lastURL ?? "www.test.com")
        textField.text = lastURL
        textField2.text = lastURL2


    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


