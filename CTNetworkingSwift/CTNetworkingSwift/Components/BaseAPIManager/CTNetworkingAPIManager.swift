//
//  CTNetworkingBaseAPIManager.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import UIKit
import Alamofire

@objc
open class CTNetworkingAPIManager : NSObject {
    public weak var delegate : CTNetworkingAPIManagerCallbackDelegate? = nil
    public weak var paramSource : CTNetworkingAPIManagerParamSource? = nil
    public weak var validator : CTNetworkingAPIManagerValidator? = nil
    public weak var interceptor : CTNetworkingBaseAPIManagerInterceptor? = nil
    public weak var child : CTNetworkingAPIManagerChild? = nil

    public var request : URLRequest? = nil
    public var response : AFDataResponse<Data?>? = nil

    public var isLoading : Bool = false
    public var isAPINeedLoginInfo : Bool = false
    public let managerIdentifier = UUID().uuidString
}
