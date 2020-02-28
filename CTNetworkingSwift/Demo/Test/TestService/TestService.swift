//
//  TestService.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/26.
//  Copyright © 2018 casa. All rights reserved.
//

import UIKit
import Alamofire

class TestService {
    static let sharedInstance: CTNetworkingService = TestService()
    lazy var _session: Session = Session.default
}

extension TestService : CTNetworkingService {
    var session: Session {
        return _session
    }
    
    static var shared: CTNetworkingService {
        return TestService.sharedInstance
    }
    
    func request(params: ParamsType?, methodName: String, requestType: HTTPMethod) -> URLRequest? {
        // need return DataRequest
        guard let url = URL(string: "https://dual-https.casatwy.com/sample") else { return nil }
        let request = URLRequest(url: url)
        return request
    }
    
    func handleCommonError(_ apiManager: CTNetworkingBaseAPIManager) -> Bool {
        return true
    }
}
