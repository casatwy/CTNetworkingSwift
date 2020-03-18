//
//  API.BaseAPIManager.extension.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/21.
//

import Alamofire
import CTMediator

public extension CTNetworkingAPIManager {
    func loadData() {
        guard let _child = child else { return }
        if isAPINeedLoginInfo {
            guard let loginService = CTMediator.sharedInstance().fetchCTNetworkingLoginService(identifier: _child.loginServiceIdentifier, moduleName: _child.moduleName) else { return }
            if loginService.isCurrentLoggedIn() == false {
                loginService.doLoginProcess(success: { (loginAPIManager:CTNetworkingAPIManager) in
                    loginService.loginSuccessOperation(apiManager: self, loginAPIManager: loginAPIManager)
                }, fail: { (loginAPIManager:CTNetworkingAPIManager) in
                    loginService.loginFailOperation(apiManager: self, loginAPIManager: loginAPIManager)
                }) { (loginAPIManager:CTNetworkingAPIManager) in
                    loginService.loginCancelOperation(apiManager: self, loginAPIManager: loginAPIManager)
                }
            } else {
                apiCallingProcess(_child: _child)
            }
        } else {
            apiCallingProcess(_child: _child)
        }
    }
}


