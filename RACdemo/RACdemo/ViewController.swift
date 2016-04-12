//
//  ViewController.swift
//  RACdemo
//
//  Created by Tobias Robert Brysiewicz on 4/11/16.
//  Copyright © 2016 TRBO. All rights reserved.
//

import UIKit
import ReactiveCocoa

class ViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    
    // -----
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textSignal: RACSignal = usernameTextField.rac_textSignal()
        
        textSignal.subscribeNext { (text: AnyObject!) in
            let textString = text as! String
            print(textString)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

