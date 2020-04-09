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
    func doLoginProcess(success:(()->Void)?, fail:(()->Void)?, cancel:(()->Void)?)
    func loginSuccessOperation(apiManager:CTNetworkingAPIManager)
    func loginFailOperation(apiManager:CTNetworkingAPIManager)
    func loginCancelOperation(apiManager:CTNetworkingAPIManager)
}
