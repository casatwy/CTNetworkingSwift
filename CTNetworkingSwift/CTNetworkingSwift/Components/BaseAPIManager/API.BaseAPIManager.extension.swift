//
//  API.BaseAPIManager.extension.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/21.
//

import Foundation
import Alamofire

extension CTNetworkingBaseAPIManager {
    @objc public func loadData() {
        guard let _child = child else { return }

        isLoading = true
        
        let params = paramSource?.params(for: self)
        request = _child.service.request(params: params, methodName: _child.methodName(), requestType: _child.requestType())

        if let request = request?.request {
            print(request.logString(apiName: _child.methodName(), service: _child.service))
        }

        request?.response { (response) in
            self.response = response
            self.isLoading = false
            
            guard _child.service.handleCommonError(self) else { return }
            
            print(response.logString())
            
            if response.error == nil {
                self.success()
            } else {
                self.fail()
            }
        }
    }
}
