//
//  InnerInterceptor.BaseAPIManager.extension.swift
//  CTNetworkingSwift
//
//  Created by casa on 2018/9/29.
//  Copyright © 2018 casa. All rights reserved.
//

import Foundation

extension CTNetworkingBaseAPIManager {
    @objc open func beforePerformSuccess(_ apiManager:CTNetworkingBaseAPIManager) -> Bool {
        let result = interceptor?.beforePerformSuccess(self) ?? true
        return result
    }
    @objc open func afterPerformSuccess(_ apiManager:CTNetworkingBaseAPIManager) {
        interceptor?.afterPerformSuccess(self)
    }
    
    @objc open func beforePerformFail(_ apiManager:CTNetworkingBaseAPIManager) -> Bool {
        let result = interceptor?.beforePerformFail(self) ?? true
        return result
    }
    @objc open func afterPerformFail(_ apiManager:CTNetworkingBaseAPIManager) {
        interceptor?.afterPerformFail(self)
    }
    
    @objc open func shouldCallAPI(_ apiManager:CTNetworkingBaseAPIManager, params:ParamsType?) -> Bool {
        let result = interceptor?.shouldCallAPI(self, params: params) ?? true
        return result
    }
    @objc open func afterAPICalling(_ apiManager:CTNetworkingBaseAPIManager, params:ParamsType?) {
        interceptor?.afterAPICalling(self, params: params)
    }
    @objc open func didReceiveResponse(_ apiManager:CTNetworkingBaseAPIManager) {
        interceptor?.didReceiveResponse(self)
    }
}
