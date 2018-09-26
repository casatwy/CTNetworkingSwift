//
//  SchemeHandler.swift
//  CTNetworking.Swift_Example
//
//  Created by casa on 2018/9/25.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import WebKit
import Alamofire

class SchemeHandler: NSObject, WKURLSchemeHandler {
    
    func webView(_ webView: WKWebView, start urlSchemeTask: WKURLSchemeTask) {
        let urlStringToRequest = "https://" + (urlSchemeTask.request.url?.host ?? "casatwy.com") + (urlSchemeTask.request.url?.path ?? "")
        guard let url = URL(string: urlStringToRequest) else {
            return
        }

        SessionManager.default.request(url).response { (response) in
            guard let _response = response.response else {
                return
            }
            guard let _data = response.data else {
                return
            }
            urlSchemeTask.didReceive(_response)
            urlSchemeTask.didReceive(_data)
            urlSchemeTask.didFinish()
        }
    }
    
    func webView(_ webView: WKWebView, stop urlSchemeTask: WKURLSchemeTask) {
    }
}
