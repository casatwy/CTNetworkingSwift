//
//  ParamSource.ViewController.extension.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/26.
//  Copyright © 2018 casa. All rights reserved.
//

import Foundation
import Alamofire

extension ViewController : CTNetworkingAPIManagerParamSource {
    func params(for apiManager: CTNetworkingAPIManager) -> Parameters? {
        return nil
    }
}
