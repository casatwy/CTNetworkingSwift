//
//  ServiceProtocol.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import Foundation
import Alamofire

public protocol CTNetworkingService {
    var apiEnvironment : CTNetworkingAPIEnvironment { get set }
    var sessionManager : SessionManager { get set }
    static var sharedInstance : CTNetworkingService { get }
    func request(params:ParamsType?, methodName:String, requestType:HTTPMethod) -> DataRequest
    func handleCommonError(_ apiManager:CTNetworkingBaseAPIManager) -> Bool
}
