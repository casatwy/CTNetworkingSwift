//
//  InnerInterceptor.BaseAPIManager.extension.swift
//  CTNetworkingSwift
//
//  Created by casa on 2018/9/29.
//  Copyright © 2018 casa. All rights reserved.
//

import Foundation
import Alamofire
import AnyCodable

extension CTNetworkingAPIManager {
    func beforePerformSuccess(_ apiManager:CTNetworkingAPIManager) -> Bool {
        let result = interceptor?.beforePerformSuccess(self) ?? true
        return result
    }
    func afterPerformSuccess(_ apiManager:CTNetworkingAPIManager) {
        interceptor?.afterPerformSuccess(self)
    }
    
    func beforePerformFail(_ apiManager:CTNetworkingAPIManager) -> Bool {
        let result = interceptor?.beforePerformFail(self) ?? true
        return result
    }
    func afterPerformFail(_ apiManager:CTNetworkingAPIManager) {
        interceptor?.afterPerformFail(self)
    }
    
    func shouldCallAPI(_ apiManager:CTNetworkingAPIManager, params:[String:AnyEncodable]?) -> Bool {
        let result = interceptor?.shouldCallAPI(self, params: params) ?? true
        return result
    }
    func afterAPICalling(_ apiManager:CTNetworkingAPIManager, params:[String:AnyEncodable]?) {
        interceptor?.afterAPICalling(self, params: params)
    }
    func didReceiveResponse(_ apiManager:CTNetworkingAPIManager) {
        interceptor?.didReceiveResponse(self)
    }
}
