//
//  CTNetworkingAPIManagerInterceptor.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import Foundation
import Alamofire

public protocol CTNetworkingBaseAPIManagerInterceptor : AnyObject {
    func beforePerformSuccess(_ apiManager:CTNetworkingBaseAPIManager) -> Bool
    func afterPerformSuccess(_ apiManager:CTNetworkingBaseAPIManager)
    
    func beforePerformFail(_ apiManager:CTNetworkingBaseAPIManager) -> Bool
    func afterPerformFail(_ apiManager:CTNetworkingBaseAPIManager)
    
    func shouldCallAPI(_ apiManager:CTNetworkingBaseAPIManager, params:ParamsType?) -> Bool
    func afterAPICalling(_ apiManager:CTNetworkingBaseAPIManager, params:ParamsType?)
    func didReceiveResponse(_ apiManager:CTNetworkingBaseAPIManager)
}

public extension CTNetworkingBaseAPIManagerInterceptor {
    func beforePerformSuccess(_ apiManager:CTNetworkingBaseAPIManager) -> Bool {
        return true
    }
    
    func afterPerformSuccess(_ apiManager:CTNetworkingBaseAPIManager) {
        // do nothing
    }
    
    func beforePerformFail(_ apiManager:CTNetworkingBaseAPIManager) -> Bool {
        return true
    }
    
    func afterPerformFail(_ apiManager:CTNetworkingBaseAPIManager) {
        // do nothing
    }
    
    func shouldCallAPI(_ apiManager:CTNetworkingBaseAPIManager, params:ParamsType?) -> Bool {
        return true
    }
    
    func afterAPICalling(_ apiManager:CTNetworkingBaseAPIManager, params:ParamsType?) {
        // do nothing
    }
    
    func didReceiveResponse(_ apiManager:CTNetworkingBaseAPIManager) {
        // do nothing
    }
}
