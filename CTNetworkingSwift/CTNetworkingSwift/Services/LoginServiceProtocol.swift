//
//  LoginServiceProtocol.swift
//  CTNetworkingSwift
//
//  Created by casa on 2020/3/18.
//  Copyright © 2020 casa. All rights reserved.
//

import Foundation

public protocol CTNetworkingLoginService {
    func isCurrentLoggedIn() -> Bool
    func doLoginProcess(success:((CTNetworkingAPIManager)->Void)?, fail:((CTNetworkingAPIManager)->Void)?, cancel:((CTNetworkingAPIManager)->Void)?)
    func loginSuccessOperation(apiManager:CTNetworkingAPIManager, loginAPIManager:CTNetworkingAPIManager)
    func loginFailOperation(apiManager:CTNetworkingAPIManager, loginAPIManager:CTNetworkingAPIManager)
    func loginCancelOperation(apiManager:CTNetworkingAPIManager, loginAPIManager:CTNetworkingAPIManager)
}
