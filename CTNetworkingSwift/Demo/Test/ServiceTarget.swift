//
//  ServiceTarget.swift
//  CTNetworkingSwift
//
//  Created by casa on 2020/2/28.
//  Copyright © 2020 casa. All rights reserved.
//

import Foundation

@objc class Target_TestService: NSObject {
    @objc func Action_TestService(_ params:NSDictionary) -> Any {
        return TestService.shared
    }
}
