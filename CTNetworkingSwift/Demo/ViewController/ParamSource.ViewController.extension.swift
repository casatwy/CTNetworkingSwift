//
//  ParamSource.ViewController.extension.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/26.
//  Copyright © 2018 casa. All rights reserved.
//

import Foundation

extension ViewController : CTNetworkingBaseAPIManagerParamSource {
    func params(for apiManager: CTNetworkingBaseAPIManager) -> ParamsType? {
        return nil
    }
}
