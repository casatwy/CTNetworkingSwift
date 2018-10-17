//
//  Reformer.BaseAPIManager.extension.swift
//  Alamofire
//
//  Created by casa on 2018/9/20.
//

import Foundation
import SwiftyJSON

public protocol CTNetworkingAPIManagerFetchable : CTNetworkingAPIManager {
    func fetchData(reformer:CTNetworkingReformer?) -> Any?
}

extension CTNetworkingBaseAPIManager : CTNetworkingAPIManagerFetchable {
    public func fetchData(reformer:CTNetworkingReformer?) -> Any? {
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
}
