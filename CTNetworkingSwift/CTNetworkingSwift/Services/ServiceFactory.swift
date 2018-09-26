//
//  ServiceFactory.swift
//  CTNetworking.Swift
//
//  Created by casa on 2018/9/21.
//

import Foundation
import CTMediator

class CTNetworkingServiceFactory {
    
    static let sharedInstance = CTNetworkingServiceFactory()
    var serviceStorage : [String:CTNetworkingService] = [:]
    
    func service(_ identifier:String, namespace:String) -> CTNetworkingService {
        if let service = serviceStorage[identifier+namespace] {
            return service
        }
        
        guard let service = newService(identifier, namespace: namespace) else {
            return CTNetworkingDefaultService()
        }
        
        serviceStorage[identifier+namespace] = service
        return service
    }

    func newService(_ identifier:String, namespace:String) -> CTNetworkingService? {
        guard let service = CTMediator.sharedInstance()?.performTarget(identifier, action: identifier, params: [kCTMediatorParamsKeySwiftTargetModuleName:namespace], shouldCacheTarget: false) as? CTNetworkingService else {
            return nil
        }
        return service
    }
}
