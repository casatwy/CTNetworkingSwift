//
//  Service.CTMediator.Extension.swift
//  CTNetworkingSwift
//
//  Created by casa on 2020/2/28.
//  Copyright © 2020 casa. All rights reserved.
//

import CTMediator

extension CTMediator {
    func fetchCTNetworkingService(identifier:String, moduleName:String) -> CTNetworkingService? {
        let params = [kCTMediatorParamsKeySwiftTargetModuleName:moduleName]
        guard let service = performTarget(identifier, action: identifier, params: params, shouldCacheTarget: true) as? CTNetworkingService else { return nil }
        return service
    }
}
