//
//  CTNetworkingBaseAPIManagerCallbackDelegate.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import Foundation

public protocol CTNetworkingAPIManagerCallbackDelegate : AnyObject {
    func requestDidSuccess(_ apiManager:CTNetworkingAPIManager)
    func requestDidFailed(_ apiManager:CTNetworkingAPIManager)
    func shouldContinueRequestAfterLogin(_ apiManager:CTNetworkingAPIManager) -> Bool
}

public extension CTNetworkingAPIManagerCallbackDelegate {
    func shouldContinueRequestAfterLogin(_ apiManager:CTNetworkingAPIManager) -> Bool {
        return true
    }
}
