//
//  CTNetworkingBaseAPIManager.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import UIKit
import Alamofire
import CTMediator

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
    public let managerIdentifier = UUID().uuidString
    
    open func loadData() {
        guard let child = child else { return }
        
        if child.isAPINeedLoginInfo {
            guard let loginService = CTMediator.sharedInstance().fetchCTNetworkingLoginService(identifier: child.loginServiceIdentifier, moduleName: child.moduleName) else { return }
            if loginService.isCurrentLoggedIn() == false {
                loginService.doLoginProcess(success: {
                    loginService.loginSuccessOperation(apiManager: self)
                }, fail: {
                    loginService.loginFailOperation(apiManager: self)
                }) {
                    loginService.loginCancelOperation(apiManager: self)
                }
            } else {
                apiCallingProcess(child)
            }
        } else {
            apiCallingProcess(child)
        }
    }
}
