//
//  private.CTNetworkingAPIManager.extension.swift
//  CTNetworkingSwift
//
//  Created by casa on 2020/3/18.
//  Copyright © 2020 casa. All rights reserved.
//

import CTMediator

extension CTNetworkingAPIManager {
    func apiCallingProcess(_ child:CTNetworkingAPIManagerChild) {
        let params = child.transformParams(paramSource?.params(for: self))

        guard validator?.isCorrect(manager: self, params: params) == CTNetworkingErrorType.Params.correct else {
            fail()
            return
        }
        
        guard shouldCallAPI(self, params: params) else { return }
        guard let service = CTMediator.sharedInstance().fetchCTNetworkingService(identifier: child.serviceIdentifier, moduleName: child.moduleName) else { return }
        guard let request = service.request(params: params, methodName: child.methodName, requestType: child.requestType) else {
            return
        }
        self.request = request
        
        #if DEBUG
        print(request.logString(apiName: child.methodName, service: service))
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