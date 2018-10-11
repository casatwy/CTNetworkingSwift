//
//  TestService.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/26.
//  Copyright © 2018 casa. All rights reserved.
//

import UIKit
import Alamofire

class TestService: NSObject, CTNetworkingService {
    func request(params: ParamsType?, methodName: String, requestType: HTTPMethod) -> DataRequest {
        return sessionManager.request("https://casatwy.com")
    }
    
    var apiEnvironment : CTNetworkingAPIEnvironment = .Release
    let sessionManager: SessionManager = SessionManager()

    func handleCommonError(_ apiManager:CTNetworkingBaseAPIManager) -> Bool {
        return true
    }
}
