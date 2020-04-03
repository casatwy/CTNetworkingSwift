//
//  ServiceProtocol.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import Foundation
import Alamofire

public protocol CTNetworkingService {
    var session : SessionManager { get }
    func request(params:Parameters?, methodName:String, requestType:HTTPMethod) -> URLRequest?
    func handleCommonError(_ apiManager:CTNetworkingAPIManager) -> Bool
}


