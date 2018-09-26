//
//  LifeCycle.WebViewController.extension.swift
//  CTNetworking.Swift_Example
//
//  Created by casa on 2018/9/25.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import Foundation
import SwiftHandyFrame

extension WKWebViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webview)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        webview.ct_fill()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        guard let url = URL(string: "https://casatwy.com") else {
//            return
//        }
        guard let url = URL(string: "mogo://casatwy.com") else {
            return
        }
        let request = URLRequest(url: url)
        webview.load(request)
    }
}
