//
//  Callback.ViewController.extension.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/26.
//  Copyright © 2018 casa. All rights reserved.
//

import Foundation

extension ViewController : CTNetworkingBaseAPIManagerCallbackDelegate {
    func requestDidSuccess(_ apiManager: CTNetworkingBaseAPIManager) {
        print("success")
        guard let result = apiManager.fetchAsJSON() else { return }
        debugPrint(result)
        debugPrint(result["hello"])
    }
    
    func requestDidFailed(_ apiManager: CTNetworkingBaseAPIManager) {
        print("fail")
    }
}
