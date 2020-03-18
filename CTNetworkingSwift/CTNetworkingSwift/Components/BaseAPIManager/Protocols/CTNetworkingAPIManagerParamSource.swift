//
//  CTNetworkingBaseAPIManagerParamSource.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import Foundation
import Alamofire

public protocol CTNetworkingAPIManagerParamSource : AnyObject {
    func params(for apiManager:CTNetworkingAPIManager) -> Parameters?
}
