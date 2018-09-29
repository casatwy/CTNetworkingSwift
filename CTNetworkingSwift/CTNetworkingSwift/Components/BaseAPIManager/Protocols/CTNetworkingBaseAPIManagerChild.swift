//
//  CTNetworkingBaseAPIManagerChild.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import Alamofire

public protocol CTNetworkingBaseAPIManagerChild : AnyObject, CTNetworkingAPIManager {
    var service : CTNetworkingService { get }
    var isPagable : Bool { get }
    var methodName : String { get }
    var requestType : HTTPMethod { get }
}
