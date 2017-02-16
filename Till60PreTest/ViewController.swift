//
//  ViewController.swift
//  Till60PreTest
//
//  Created by Mazdah on 2017. 1. 25..
//  Copyright © 2017년 mazdah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RESTConnectorDelegate {
    
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var passwdField: UITextField!
    
    var delegate: RESTConnectorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClicked(_ sender: Any) {
        print("button clicked")
        
        let restConnector: RESTConnector! = RESTConnector()
        restConnector.delegate = self
        
        let idStr = self.idField.text
        let passwdStr = self.passwdField.text
        
        print("input id = \(idStr)")
        print("input password = \(passwdStr)")
        
        restConnector.callApi(withURLStr: "/users/search/findByUserIdAndPassword?userId=\(idStr)&password=\(passwdStr)", method: "GET", param: "")
    }
    
    /*
     RESTConnectorDelegate 메소드
    */
//    func receiveResponseDataToDictionary (_ jsonDic: Dictionary<String, AnyObject>!) {
//        print("received data is : \(jsonDic)")
//    }
    
    public func receiveResponseData(to jsonDic: [AnyHashable : Any]!) {
        
        if (jsonDic == nil) {
            print("jsonDic is nil")
            return
        }
        
        let jsonResult = jsonDic as? Dictionary<String, AnyObject>
        
        print("received data is : \(jsonResult)\n\n")
        
        print("jsonDic.profile : \(jsonResult?["profile"])\n\n")
        
        print("jsonDic.profile.introduction : \(jsonResult?["profile"]?["introduction"])\n\n")
    }

}

