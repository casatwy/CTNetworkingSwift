//
//  ServiceProtocol.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import Foundation
import Alamofire

protocol CTNetworkingService : NSObjectProtocol {
    var apiEnvironment : CTNetworkingAPIEnvironment { get }
    var sessionManager : SessionManager { get }
    func request(params:[String:Any]?, methodName:String, requestType:CTNetworkingRequestType) -> URLRequest?
    func handleCommonError(_ apiManager:CTNetworkingBaseAPIManager) -> Bool
}

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
