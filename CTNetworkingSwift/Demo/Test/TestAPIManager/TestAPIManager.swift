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
    var service : CTNetworkingService {
        get {
            return CTNetworkingServiceFactory.sharedInstance.service("TestServiceIdentifier", namespace: "CTNetworkingSwift")
        }
    }
    
    func methodName() -> String {
        return ""
    }
    
    func requestType() -> CTNetworkingRequestType {
        return .get
    }
}
