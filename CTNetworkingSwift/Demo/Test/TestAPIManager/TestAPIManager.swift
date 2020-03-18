//
//  TestAPIManager.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/26.
//  Copyright © 2018 casa. All rights reserved.
//

import UIKit
import Alamofire

class TestAPIManager: CTNetworkingAPIManager {
    override init() {
        super.init()
        child = self
        validator = self
    }
}

extension TestAPIManager: CTNetworkingAPIManagerValidator{}

extension TestAPIManager : CTNetworkingAPIManagerChild {
    var serviceIdentifier: String {
        return "TestService"
    }
    
    var loginServiceIdentifier: String {
        return "TestService"
    }
    
    var isPagable: Bool {
        return false
    }
    
    var methodName: String {
        return ""
    }
    
    var requestType: HTTPMethod {
        return .get
    }
    
    var moduleName: String {
        return "CTNetworkingSwift"
    }
}
