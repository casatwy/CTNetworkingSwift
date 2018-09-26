//
//  LifeCycle.ViewController.extension.swift
//  CTNetworking.Swift_Example
//
//  Created by casa on 2018/9/20.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import SwiftHandyFrame

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.ct_fill()
    }
}
