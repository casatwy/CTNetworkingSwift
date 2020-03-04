//
//  TestService.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/26.
//  Copyright © 2018 casa. All rights reserved.
//

import UIKit
import Alamofire

class TestService : CTNetworkingService {
    static let shared: CTNetworkingService = TestService()
    
    lazy var session: Session = Session.default

    func request(params: Parameters?, methodName: String, requestType: HTTPMethod) -> URLRequest? {
        // need return DataRequest
        guard let url = URL(string: "https://dual-https.casatwy.com/sample") else { return nil }
        let request = URLRequest(url: url)
        return request
    }
    
    func handleCommonError(_ apiManager: CTNetworkingAPIManager) -> Bool {
        return true
    }
}
