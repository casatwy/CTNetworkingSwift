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
    
    var apiEnvironment : CTNetworkingAPIEnvironment = .Release
    let sessionManager: SessionManager = {
        let _sessionManager = SessionManager()
        return _sessionManager
    }()
    let baseURL = URL(string: "https://casatwy.com")
    
    func request(params:[String:Any]?, methodName:String, requestType:CTNetworkingRequestType) -> URLRequest? {
        guard let url = baseURL else { return nil }
        let request = URLRequest(url: url)
        return request
    }
    
    func handleCommonError(_ apiManager:CTNetworkingBaseAPIManager) -> Bool {
        return true
    }
}
