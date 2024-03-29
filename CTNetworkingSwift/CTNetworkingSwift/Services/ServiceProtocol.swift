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
    
    // 支持headers设置的request方法，建议实现该request方法
    func request(params:Parameters?, extraURLParams:Parameters?, methodName:String, requestType:HTTPMethod, headers:HTTPHeaders?) -> URLRequest?
    
    // 该request方法与上面request方法只有设置headers的区别，必须实现其中一个，若同时两个都实现，只有支持headers的方法生效
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
