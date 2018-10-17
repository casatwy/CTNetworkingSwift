//
//  Reformer.BaseAPIManager.extension.swift
//  Alamofire
//
//  Created by casa on 2018/9/20.
//

import Foundation
import SwiftyJSON

public protocol CTNetworkingAPIManagerFetchable : CTNetworkingAPIManager {
    func fetch(reformer:CTNetworkingReformer?) -> Any?
    func fetchAsData() -> Data?
    func fetchAsString() -> String?
    func fetchAsJSON() -> JSON?
}

extension CTNetworkingBaseAPIManager : CTNetworkingAPIManagerFetchable {
    public func fetch(reformer:CTNetworkingReformer?) -> Any? {
        guard let data = self.response?.data else { return nil }
        guard let reformer = reformer else {
            if let result = try? JSON(data: data) {
                return result
            } else if let result = String(data: data, encoding: .utf8) {
                return result
            } else {
                return data
            }
        }
        return reformer.reform(apiManager: self)
    }
    
    public func fetchAsData() -> Data? {
        return self.response?.data
    }
    
    public func fetchAsString() -> String? {
        guard let data = self.response?.data else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    public func fetchAsJSON() -> JSON? {
        guard let data = self.response?.data else { return nil }
        let result = try? JSON(data: data)
        return result
    }
}
