//
//  CTNetworkingBaseAPIManagerChild.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import Alamofire
import AnyCodable

public protocol CTNetworkingAPIManagerChild : CTNetworkingAPIManager {
    var identifier : String { get }
    var moduleName : String { get }
    var isPagable : Bool { get }
    var methodName : String { get }
    var requestType : HTTPMethod { get }
    func reformParams(_ params:[String:AnyEncodable]?) -> [String:AnyEncodable]?
}

public extension CTNetworkingAPIManagerChild {
    func reformParams(_ params:[String:AnyEncodable]?) -> [String:AnyEncodable]? {
        return params
    }
}
