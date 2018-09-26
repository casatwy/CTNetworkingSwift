//
//  Target_Test.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/26.
//  Copyright © 2018 casa. All rights reserved.
//

import UIKit

@objc
class Target_TestServiceIdentifier : NSObject {
    @objc func Action_TestServiceIdentifier(_ params:[AnyHashable:Any]) -> NSObject {
        return TestService()
    }
}
