//
//  Callback.ViewController.extension.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/26.
//  Copyright © 2018 casa. All rights reserved.
//

import Foundation

extension ViewController : CTNetworkingAPIManagerCallbackDelegate {
    func requestDidSuccess(_ apiManager: CTNetworkingAPIManager) {
        print("success")
        guard let result = apiManager.fetchAsDictionary() else { return }
        debugPrint(result)
        debugPrint(result["hello"])
    }
    
    func requestDidFailed(_ apiManager: CTNetworkingAPIManager) {
        print("fail")
    }
}
