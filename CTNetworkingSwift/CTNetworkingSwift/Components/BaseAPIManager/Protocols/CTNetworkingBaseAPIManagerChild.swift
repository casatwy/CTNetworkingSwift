//
//  CTNetworkingBaseAPIManagerChild.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import Alamofire

public protocol CTNetworkingBaseAPIManagerChild : AnyObject {
    var service : CTNetworkingService { get }
    func methodName() -> String
    func requestType() -> HTTPMethod
}
