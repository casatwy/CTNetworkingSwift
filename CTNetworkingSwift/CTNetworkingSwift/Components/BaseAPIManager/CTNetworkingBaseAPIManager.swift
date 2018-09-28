//
//  CTNetworkingBaseAPIManager.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import UIKit
import Alamofire

@objc
open class CTNetworkingBaseAPIManager: NSObject {
    public weak var delegate : CTNetworkingBaseAPIManagerCallbackDelegate? = nil
    public weak var paramSource : CTNetworkingBaseAPIManagerParamSource? = nil
    public weak var validator : CTNetworkingBaseAPIManagerValidator? = nil
    public weak var interceptor : CTNetworkingBaseAPIManagerInterceptor? = nil
    public weak var child : CTNetworkingBaseAPIManagerChild? = nil
    
    public var response : DefaultDataResponse? = nil
    public var request : URLRequest? {
        get {
            return response?.request
        }
    }
    
    public var isLoading : Bool = false
    public var isPagable : Bool = false
    
}









