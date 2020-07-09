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
    func request(params: Parameters?, extraURLParams: Parameters?, methodName: String, requestType: HTTPMethod) -> URLRequest? {
        guard let url = URL(string: "https://www.baidu.com") else { return nil }
        let request = URLRequest(url: url)
        return request
    }
    
    static let shared: CTNetworkingService = TestService()
    
    lazy var session: Session = Session.default

    func handleCommonError(_ apiManager: CTNetworkingAPIManager) -> Bool {
        return true
    }
}
