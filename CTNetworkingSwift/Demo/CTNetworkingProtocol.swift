//
//  CTNetworkingProtocol.swift
//  CTNetworking.Swift_Example
//
//  Created by casa on 2018/9/25.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import Foundation

class CTNetworkingProtocol : URLProtocol {
    override class func canInit(with request: URLRequest) -> Bool {
        return false
    }
}
