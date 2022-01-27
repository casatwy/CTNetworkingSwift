//
//  ServiceProtocol.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import Foundation
import Alamofire

public protocol CTNetworkingService {
    var session : Session { get }
    func request(params:Parameters?, extraURLParams:Parameters?, methodName:String, requestType:HTTPMethod, headers:HTTPHeaders?) -> URLRequest?
    func request(params:Parameters?, extraURLParams:Parameters?, methodName:String, requestType:HTTPMethod) -> URLRequest?
    func handleCommonError(_ apiManager:CTNetworkingAPIManager) -> Bool
}

public extension CTNetworkingService {
    func request(params:Parameters?, extraURLParams:Parameters?, methodName:String, requestType:HTTPMethod, headers:HTTPHeaders?) -> URLRequest? {
        return self.request(params: params, extraURLParams: extraURLParams, methodName: methodName, requestType: requestType)
    }
    func request(params:Parameters?, extraURLParams:Parameters?, methodName:String, requestType:HTTPMethod) -> URLRequest?{
        return nil
    }
}
