//
//  CTNetworkingBaseAPIManagerValidator.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import Foundation
import Alamofire
import AnyCodable

public protocol CTNetworkingAPIManagerValidator : AnyObject {
    func isCorrect(manager:CTNetworkingAPIManager, params:[String:AnyEncodable]?) -> CTNetworkingErrorType.Params
    func isCorrect(manager:CTNetworkingAPIManager) -> CTNetworkingErrorType.Response
}

extension CTNetworkingAPIManagerValidator {
    func isCorrect(manager:CTNetworkingAPIManager, params:[String:AnyEncodable]?) -> CTNetworkingErrorType.Params {
        return .correct
    }
    
    func isCorrect(manager:CTNetworkingAPIManager) -> CTNetworkingErrorType.Response {
        return .correct
    }
}
