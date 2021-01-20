//
//  CTNetworkingBaseAPIManager.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

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
    public var mockDataFileURL : URL? = nil
    public var session : Session? = nil

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
                }, cancel: {
                    loginService.loginCancelOperation(apiManager: self)
                }, apiManager: self)
            } else {
                apiCallingProcess(child)
            }
        } else {
            apiCallingProcess(child)
        }
    }
    
    public func setupCachedResponse(cachedData:Data) {
        let result = Result<Data?, AFError>.success(cachedData)
        let httpResponse = HTTPURLResponse(url: request?.url ?? URL(fileURLWithPath: "cached response"), statusCode: 200, httpVersion: "1.1", headerFields: response?.response?.headers.dictionary)
        let response = AFDataResponse<Data?>(request: request, response: httpResponse, data: cachedData, metrics: nil, serializationDuration: 10, result: result)
        self.response = response
    }
}
