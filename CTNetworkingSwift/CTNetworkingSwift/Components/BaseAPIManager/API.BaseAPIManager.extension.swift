//
//  API.BaseAPIManager.extension.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/21.
//

import Alamofire
import CTMediator

public protocol CTNetworkingAPIManagerCallable {
    func loadData()
}

extension CTNetworkingAPIManager : CTNetworkingAPIManagerCallable {
    public func loadData() {
        
        guard let _child = child else { return }

        let params = _child.transformParams(paramSource?.params(for: self))

        guard validator?.isCorrect(manager: self, params: params) == CTNetworkingErrorType.Params.correct else {
            fail()
            return
        }
        
        guard shouldCallAPI(self, params: params) else { return }

        guard let service = CTMediator.sharedInstance().fetchCTNetworkingService(identifier: _child.identifier, moduleName: _child.moduleName) else { return }
        
        guard let request = service.request(params: params, methodName: _child.methodName, requestType: _child.requestType) else {
            return
        }
        self.request = request
        
        #if DEBUG
        print(request.logString(apiName: _child.methodName, service: service))
        #endif

        isLoading = true
        
        service.session.request(request).response { (response) in
            #if DEBUG
            print(response.logString())
            #endif
            
            self.isLoading = false
            self.response = response
            self.interceptor?.didReceiveResponse(self)

            guard service.handleCommonError(self) else { return }

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
