//
//  CTNetworkingDefaultService.swift
//  CTNetworkingSwift
//
//  Created by casa on 2018/9/27.
//  Copyright © 2018 casa. All rights reserved.
//

import Foundation
import Alamofire

class CTNetworkingDefaultService: NSObject, CTNetworkingService {
    
    var apiEnvironment: CTNetworkingAPIEnvironment = .release
    
    let sessionManager: SessionManager = {
        let _sessionManager = SessionManager()
        return _sessionManager
    }()
    
    func request(params: [String : Any]?, methodName: String, requestType: CTNetworkingRequestType) -> URLRequest? {
        let request = URLRequest(url: URL(fileURLWithPath: methodName))
        return request
    }
    
    func handleCommonError(_ apiManager: CTNetworkingBaseAPIManager) -> Bool {
        return true
    }
}
