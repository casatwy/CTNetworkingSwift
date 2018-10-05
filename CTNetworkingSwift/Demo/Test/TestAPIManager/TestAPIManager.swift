//
//  TestAPIManager.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/26.
//  Copyright © 2018 casa. All rights reserved.
//

import UIKit
import Alamofire

class TestAPIManager: CTNetworkingBaseAPIManager {
    override init() {
        super.init()
        child = self
    }
}

extension TestAPIManager : CTNetworkingBaseAPIManagerChild {
    var isPagable: Bool {
        return false
    }
    
    var methodName: String {
        return ""
    }
    
    var requestType: HTTPMethod {
        return .get
    }
    
    var service : CTNetworkingService {
        get {
            return TestService()
        }
    }
}
