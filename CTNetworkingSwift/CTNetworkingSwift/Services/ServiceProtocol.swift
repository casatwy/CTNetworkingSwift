//
//  ServiceProtocol.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import Foundation
import Alamofire
import AnyCodable

public protocol CTNetworkingService {
    var session : Session { get }
    func request(params:[String:AnyEncodable]?, methodName:String, requestType:HTTPMethod) -> URLRequest?
    func handleCommonError(_ apiManager:CTNetworkingAPIManager) -> Bool
}
