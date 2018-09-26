//
//  CTNetworkingBaseAPIManagerChild.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/20.
//

import Foundation

protocol CTNetworkingBaseAPIManagerChild : AnyObject {
    func methodName() -> String
    func serviceIdentifier() -> String
    func namespace() -> String
    func requestType() -> CTNetworkingRequestType
}
