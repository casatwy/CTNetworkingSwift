//
//  Debug.Log.CTMediator.Extension.swift
//  CTNetworkingSwift
//
//  Created by 景鹏博 on 2020/11/19.
//  Copyright © 2020 casa. All rights reserved.
//

import CTMediator

extension CTMediator {
    func customHandleLogMessage(identifier: String, moduleName: String, message: String) -> Bool {
        let params = [
            "message": message,
            kCTMediatorParamsKeySwiftTargetModuleName: moduleName
        ]
        guard let customHandle = performTarget(identifier, action: identifier, params: params, shouldCacheTarget: true) as? Bool else { return false }
        return customHandle
    }
}
