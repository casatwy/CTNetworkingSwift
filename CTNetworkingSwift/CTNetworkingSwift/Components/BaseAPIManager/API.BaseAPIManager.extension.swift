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
    public func loadData() {

        let params = paramSource?.params(for: self)
        
        guard validator?.isCorrect(manager: self, params: params) == CTNetworkingErrorType.Params.correct else {
            fail()
            return
        }
        
        guard shouldCallAPI(self, params: params) else { return }

        guard let _child = child else { return }
        guard let request = _child.service.request(params: params, methodName: _child.methodName, requestType: _child.requestType) else {
            return
        }
        self.request = request
        
        #if DEBUG
        print(request.logString(apiName: _child.methodName, service: _child.service))
        #endif

        isLoading = true
        
        _child.service.session.request(request).response { (response) in
            #if DEBUG
            print(response.logString())
            #endif
            
            self.isLoading = false
            self.response = response
            self.interceptor?.didReceiveResponse(self)

            guard _child.service.handleCommonError(self) else { return }

            if response.error == nil {
                if self.validator?.isCorrect(manager: self) != CTNetworkingErrorType.Response.correct {
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
