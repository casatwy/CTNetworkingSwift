//
//  WKWebViewController.swift
//  CTNetworking.Swift_Example
//
//  Created by casa on 2018/9/25.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewController: UIViewController {
    let webview : WKWebView = {
        let configuration = WKWebViewConfiguration()
        let handler = SchemeHandler()
        configuration.setURLSchemeHandler(handler, forURLScheme: "mogo")
        let _webview = WKWebView(frame: .zero, configuration: configuration)
        return _webview
    }()
}
