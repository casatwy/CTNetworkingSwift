//
//  CTNetworkingBaseAPIManagerChild.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import Alamofire

public protocol CTNetworkingAPIManagerChild : CTNetworkingAPIManager {
    var serviceIdentifier : String { get }
    var loginServiceIdentifier : String { get }
    var moduleName : String { get }
    var isPagable : Bool { get }
    var methodName : String { get }
    var requestType : HTTPMethod { get }
    var isAPINeedLoginInfo : Bool { get }
    func transformParams(_ params:Parameters?) -> Parameters?
    func extraURLParams(_ params:Parameters?) -> Parameters?
    func mockDataFilePathURL() -> URL?
}

public extension CTNetworkingAPIManagerChild {
    func mockDataFilePathURL() -> URL? {
        return nil
    }

    func transformParams(_ params:Parameters?) -> Parameters? {
        return params
    }
    
    func extraURLParams(_ params:Parameters?) -> Parameters? {
        return nil
    }
}
