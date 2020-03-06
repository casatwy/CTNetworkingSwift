//
//  Definitions.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import Foundation
import Alamofire

public enum CTNetworkingErrorType {
    
    case defaultStatus

    public enum Login {
        case needLogin
        case needRefreshAccessToken
        case loginCanceled
    }
    
    public enum Response {
        case noContent
        case missingInfomation
        case correct
    }
    
    public enum Params {
        case missingParams
        case correct
    }
    
    public enum Request {
        case noNetwork
        case timeout
        case cancel
        case success
    }
    
}

public protocol CTNetworkingResponseTransformer {
    func transformResponse(from apiManager:CTNetworkingAPIManager) -> Any?
}

public protocol CTNetworkingParamConvertible {
    func toParameters() -> Parameters
}

public extension CTNetworkingParamConvertible {
    func toParameters() -> Parameters {
        var result:Parameters = [:]
        let mirror = Mirror(reflecting: self)
        for property in mirror.children {
            guard let key = property.label else { continue }
            if case Optional<Any>.some(let value) = property.value {
                result[key] = value
            }
        }
        return result
    }
}
