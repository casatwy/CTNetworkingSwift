//
//  ParamSource.ViewController.extension.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/26.
//  Copyright © 2018 casa. All rights reserved.
//

import Foundation
import AnyCodable

extension ViewController : CTNetworkingAPIManagerParamSource {
    func params(for apiManager: CTNetworkingAPIManager) -> [String:AnyEncodable]? {
        return nil
    }
}
