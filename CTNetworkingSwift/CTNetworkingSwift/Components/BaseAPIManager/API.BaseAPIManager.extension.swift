//
//  API.BaseAPIManager.extension.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/21.
//

import Foundation

extension CTNetworkingBaseAPIManager {
    func loadData() {
        guard let serviceIdentifier = self.child?.serviceIdentifier() else { return }
        guard let namespace = self.child?.namespace() else { return }
        guard let methodname = self.child?.methodName() else { return }
        guard let requestType = self.child?.requestType() else { return }

        isLoading = true
        
        let params = paramSource?.params(for: self)
        let service = CTNetworkingServiceFactory.sharedInstance.service(serviceIdentifier, namespace: namespace)
        guard let request = service.request(params: params, methodName: methodname, requestType: requestType) else {
            return
        }
        
        service.sessionManager.request(request).response { (response) in
            self.isLoading = false
            self.response = response
            guard service.handleCommonError(self) else {
                return
            }

            guard response.error != nil else {
                self.success()
                return
            }
            
            self.fail()
        }
    }
}
