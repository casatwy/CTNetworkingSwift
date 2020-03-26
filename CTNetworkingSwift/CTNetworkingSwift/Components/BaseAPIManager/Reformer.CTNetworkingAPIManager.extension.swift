//
//  Reformer.BaseAPIManager.extension.swift
//  Alamofire
//
//  Created by casa on 2018/9/20.
//

import Foundation

public protocol CTNetworkingAPIManagerFetchable {
    func fetch(with responseTransformer:CTNetworkingResponseTransformer?) -> Any?
    func fetchAsData() -> Data?
    func fetchAsString() -> String?
    func fetchAsDictionary() -> [AnyHashable:Any]?
}

extension CTNetworkingAPIManager : CTNetworkingAPIManagerFetchable {
    public func fetch(with responseTransformer:CTNetworkingResponseTransformer?) -> Any? {
        guard let data = self.response?.data else { return nil }
        guard let transformer = responseTransformer else {
            if let result = try? JSONSerialization.jsonObject(with: data, options: []) as? [AnyHashable:Any] {
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
    
    public func fetchAsDictionary() -> [AnyHashable:Any]? {
        guard let data = self.response?.data else { return nil }
        let result = try? JSONSerialization.jsonObject(with: data, options: []) as? [AnyHashable:Any]
        return result
    }
}
