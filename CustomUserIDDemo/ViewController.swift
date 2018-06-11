//
//  ViewController.swift
//  CustomUserIDDemo
//
//  Created by Mason on 2018/6/11.
//  Copyright © 2018年 Mason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        GAManager.createCustomScreenEventWith("ViewController")
        let event1Button = UIButton(type: .roundedRect)
        event1Button.frame = CGRect(x: 50, y: 50, width: 100, height: 30)
        event1Button.setTitle("Event 1", for: [])
        event1Button.addTarget(self, action: #selector(self.event1Tap(_:)), for: .touchUpInside)
        view.addSubview(event1Button)
        
        let event2Button = UIButton(type: .roundedRect)
        event2Button.frame = CGRect(x: 50, y: event1Button.frame.maxY, width: 100, height: 30)
        event2Button.setTitle("Event 2", for: [])
        event2Button.addTarget(self, action: #selector(self.event2Tap(_:)), for: .touchUpInside)
        view.addSubview(event2Button)
    }
    
    @IBAction func event1Tap(_ sender: AnyObject) {
        GAManager.createCustomEventWith(category: "ViewController",
                                        action: "Tap.event1",
                                        label: "event1",
                                        value: 1)
    }

    @IBAction func event2Tap(_ sender: AnyObject) {
        GAManager.createCustomEventWith(category: "ViewController",
                                        action: "Tap.event2",
                                        label: "event2",
                                        value: 1)
    }
}

