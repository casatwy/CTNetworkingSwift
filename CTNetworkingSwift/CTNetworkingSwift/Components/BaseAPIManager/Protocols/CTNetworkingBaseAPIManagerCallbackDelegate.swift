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
}
