//
//  CTNetworkingBaseAPIManagerParamSource.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import Foundation

public protocol CTNetworkingBaseAPIManagerParamSource : AnyObject {
    func params(for apiManager:CTNetworkingBaseAPIManager) -> ParamsType?
}
