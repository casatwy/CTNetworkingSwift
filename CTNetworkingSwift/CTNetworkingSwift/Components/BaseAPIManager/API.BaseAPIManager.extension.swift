//
//  API.BaseAPIManager.extension.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/21.
//

import Alamofire

public protocol CTNetworkingAPIManagerCallable : CTNetworkingAPIManager {
    func loadData()
}

extension CTNetworkingBaseAPIManager : CTNetworkingAPIManagerCallable {
    @objc open func loadData() {

        let params = paramSource?.params(for: self)
        
        if validator?.isCorrect(manager: self, params: params) != CTNetworkingErrorType.Params.correct {
            fail()
            return
        }
        
        guard shouldCallAPI(self, params: params) else { return }

        guard let _child = child else { return }
        request = _child.service.request(params: params, methodName: _child.methodName, requestType: _child.requestType)
        
        if let request = request?.request {
            print(request.logString(apiName: _child.methodName, service: _child.service))
        }
        
        isLoading = true
        request!.response { (response) in
            self.response = response
            self.isLoading = false
            
            self.didReceiveResponse(self)

            guard _child.service.handleCommonError(self) else { return }
            
            print(response.logString())
            
            if response.error == nil {
                if self.validator?.isCorrect(manager: self, response: response) != CTNetworkingErrorType.Response.correct {
                    self.fail()
                } else {
                    self.success()
                }
            } else {
                self.fail()
            }
        }
        
        afterAPICalling(self, params: params)
    }
}
