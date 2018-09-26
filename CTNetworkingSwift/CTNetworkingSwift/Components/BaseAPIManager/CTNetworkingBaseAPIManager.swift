//
//  CTNetworkingBaseAPIManager.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import UIKit
import Alamofire

@objc
class CTNetworkingBaseAPIManager: NSObject {
    public weak var delegate : CTNetworkingBaseAPIManagerCallbackDelegate? = nil
    public weak var paramSource : CTNetworkingBaseAPIManagerParamSource? = nil
    public weak var validator : CTNetworkingBaseAPIManagerValidator? = nil
    public weak var interceptor : CTNetworkingAPIManagerInterceptor? = nil
    public weak var child : CTNetworkingBaseAPIManagerChild? = nil
    
    weak var service : CTNetworkingService? = nil
    public var response : DefaultDataResponse? = nil
    public var request : Request? = nil
    
    public var isLoading : Bool = false
}









