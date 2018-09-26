//
//  TestAPIManager.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/26.
//  Copyright © 2018 casa. All rights reserved.
//

import UIKit

class TestAPIManager: CTNetworkingBaseAPIManager {
    override init() {
        super.init()
        child = self
    }
}

extension TestAPIManager : CTNetworkingBaseAPIManagerChild {
    func methodName() -> String {
        return ""
    }
    
    func serviceIdentifier() -> String {
        return "TestServiceIdentifier"
    }
    
    func namespace() -> String {
        return "CTNetworkingSwift"
    }
    
    func requestType() -> CTNetworkingRequestType {
        return .get
    }
}
