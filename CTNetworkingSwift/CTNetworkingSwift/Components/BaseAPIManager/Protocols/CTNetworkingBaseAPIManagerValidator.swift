//
//  CTNetworkingBaseAPIManagerValidator.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import Foundation
import Alamofire

protocol CTNetworkingBaseAPIManagerValidator : AnyObject {
    func isCorrect(manager:CTNetworkingBaseAPIManager, params:ParamsType?) -> CTNetworkingErrorType.Params
    func isCorrect(manager:CTNetworkingBaseAPIManager, response: DefaultDataResponse) -> CTNetworkingErrorType.Response
}

extension CTNetworkingBaseAPIManagerValidator {
    func isCorrect(params:ParamsType?, manager:CTNetworkingBaseAPIManager) -> CTNetworkingErrorType.Params {
        return .correct
    }
    
    func isCorrect(manager:CTNetworkingBaseAPIManager, response: DefaultDataResponse) -> CTNetworkingErrorType.Response {
        return .correct
    }
}
