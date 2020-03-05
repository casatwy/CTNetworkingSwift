//
//  Reformer.BaseAPIManager.extension.swift
//  Alamofire
//
//  Created by casa on 2018/9/20.
//

import Foundation
import SwiftyJSON

public protocol CTNetworkingAPIManagerFetchable {
    func fetch(with responseTransformer:CTNetworkingResponseTransformer?) -> Any?
    func fetchAsData() -> Data?
    func fetchAsString() -> String?
    func fetchAsJSON() -> JSON?
}

extension CTNetworkingAPIManager : CTNetworkingAPIManagerFetchable {
    public func fetch(with responseTransformer:CTNetworkingResponseTransformer?) -> Any? {
        guard let data = self.response?.data else { return nil }
        guard let transformer = responseTransformer else {
            if let result = try? JSON(data: data) {
                return result
            } else if let result = String(data: data, encoding: .utf8) {
                return result
            } else {
                return data
            }
        }
        return transformer.transformResponse(from: self)
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
