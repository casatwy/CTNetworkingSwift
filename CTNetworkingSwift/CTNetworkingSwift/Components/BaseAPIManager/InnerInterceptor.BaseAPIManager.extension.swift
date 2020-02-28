//
//  InnerInterceptor.BaseAPIManager.extension.swift
//  CTNetworkingSwift
//
//  Created by casa on 2018/9/29.
//  Copyright © 2018 casa. All rights reserved.
//

import Foundation

extension CTNetworkingBaseAPIManager {
    func beforePerformSuccess(_ apiManager:CTNetworkingBaseAPIManager) -> Bool {
        let result = interceptor?.beforePerformSuccess(self) ?? true
        return result
    }
    func afterPerformSuccess(_ apiManager:CTNetworkingBaseAPIManager) {
        interceptor?.afterPerformSuccess(self)
    }
    
    func beforePerformFail(_ apiManager:CTNetworkingBaseAPIManager) -> Bool {
        let result = interceptor?.beforePerformFail(self) ?? true
        return result
    }
    func afterPerformFail(_ apiManager:CTNetworkingBaseAPIManager) {
        interceptor?.afterPerformFail(self)
    }
    
    func shouldCallAPI(_ apiManager:CTNetworkingBaseAPIManager, params:ParamsType?) -> Bool {
        let result = interceptor?.shouldCallAPI(self, params: params) ?? true
        return result
    }
    func afterAPICalling(_ apiManager:CTNetworkingBaseAPIManager, params:ParamsType?) {
        interceptor?.afterAPICalling(self, params: params)
    }
    func didReceiveResponse(_ apiManager:CTNetworkingBaseAPIManager) {
        interceptor?.didReceiveResponse(self)
    }
}
