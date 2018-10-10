//
//  CTNetworkingBaseAPIManager.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import UIKit
import Alamofire

@objc
open class CTNetworkingBaseAPIManager : NSObject, CTNetworkingAPIManager {
    public weak var delegate : CTNetworkingBaseAPIManagerCallbackDelegate? = nil
    public weak var paramSource : CTNetworkingBaseAPIManagerParamSource? = nil
    public weak var validator : CTNetworkingBaseAPIManagerValidator? = nil
    public weak var interceptor : CTNetworkingBaseAPIManagerInterceptor? = nil
    public weak var child : CTNetworkingBaseAPIManagerChild? = nil

    public var response : DefaultDataResponse? = nil
    public var request : DataRequest? = nil

    public var isLoading : Bool = false
    public let managerIdentifier = UUID().uuidString
}

public protocol CTNetworkingAPIManager {
    var delegate : CTNetworkingBaseAPIManagerCallbackDelegate? { get set }
    var paramSource : CTNetworkingBaseAPIManagerParamSource? { get set }
    var validator : CTNetworkingBaseAPIManagerValidator? { get set }
    var interceptor : CTNetworkingBaseAPIManagerInterceptor? { get set }
    var child : CTNetworkingBaseAPIManagerChild? { get set }
    
    var response : DefaultDataResponse? { get set }
    var request : DataRequest? { get set }
    
    var isLoading : Bool { get set }
}













