//
//  ServiceProtocol.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import Foundation
import Alamofire

protocol CTNetworkingService : NSObjectProtocol {
    var apiEnvironment : CTNetworkingAPIEnvironment { get set }
    var sessionManager : SessionManager { get }
    func request(params:[String:Any]?, methodName:String, requestType:CTNetworkingRequestType) -> URLRequest?
    func handleCommonError(_ apiManager:CTNetworkingBaseAPIManager) -> Bool
}
