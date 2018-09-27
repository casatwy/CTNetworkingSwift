//
//  Definitions.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import Foundation

public typealias ParamsType = [String:Any]

public enum CTNetworkingAPIEnvironment : Int {
    case Develop = 0
    case preRelease = 1
    case Release = 2
}

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

public protocol CTNetworkingReformer {
    func reform(apiManager:CTNetworkingBaseAPIManager) -> Any?
}
