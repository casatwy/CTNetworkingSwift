//
//  CTNetworkingAPIManagerInterceptor.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import Foundation
import Alamofire
import AnyCodable

public protocol CTNetworkingBaseAPIManagerInterceptor : AnyObject {
    func beforePerformSuccess(_ apiManager:CTNetworkingAPIManager) -> Bool
    func afterPerformSuccess(_ apiManager:CTNetworkingAPIManager)
    
    func beforePerformFail(_ apiManager:CTNetworkingAPIManager) -> Bool
    func afterPerformFail(_ apiManager:CTNetworkingAPIManager)
    
    func shouldCallAPI(_ apiManager:CTNetworkingAPIManager, params:[String:AnyEncodable]?) -> Bool
    func afterAPICalling(_ apiManager:CTNetworkingAPIManager, params:[String:AnyEncodable]?)
    func didReceiveResponse(_ apiManager:CTNetworkingAPIManager)
}

public extension CTNetworkingBaseAPIManagerInterceptor {
    func beforePerformSuccess(_ apiManager:CTNetworkingAPIManager) -> Bool {
        return true
    }
    
    func afterPerformSuccess(_ apiManager:CTNetworkingAPIManager) {
        // do nothing
    }
    
    func beforePerformFail(_ apiManager:CTNetworkingAPIManager) -> Bool {
        return true
    }
    
    func afterPerformFail(_ apiManager:CTNetworkingAPIManager) {
        // do nothing
    }
    
    func shouldCallAPI(_ apiManager:CTNetworkingAPIManager, params:[String:AnyEncodable]?) -> Bool {
        return true
    }
    
    func afterAPICalling(_ apiManager:CTNetworkingAPIManager, params:[String:AnyEncodable]?) {
        // do nothing
    }
    
    func didReceiveResponse(_ apiManager:CTNetworkingAPIManager) {
        // do nothing
    }
}
