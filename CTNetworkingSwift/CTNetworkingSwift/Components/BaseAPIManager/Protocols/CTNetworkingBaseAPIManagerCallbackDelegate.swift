//
//  CTNetworkingBaseAPIManagerCallbackDelegate.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import Foundation

public protocol CTNetworkingBaseAPIManagerCallbackDelegate : AnyObject {
    func requestDidSuccess(_ apiManager:CTNetworkingBaseAPIManager)
    func requestDidFailed(_ apiManager:CTNetworkingBaseAPIManager)
}
