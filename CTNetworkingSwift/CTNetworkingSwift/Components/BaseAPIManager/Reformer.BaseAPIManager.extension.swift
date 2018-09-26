//
//  Reformer.BaseAPIManager.extension.swift
//  Alamofire
//
//  Created by casa on 2018/9/20.
//

import Foundation


protocol CTNetworkingReformer {
    func reform(apiManager:CTNetworkingBaseAPIManager) -> Any?
}

extension CTNetworkingBaseAPIManager {
    public func fetchData(reformer:CTNetworkingReformer?) -> Any? {
        guard let reformer = reformer else {
            return self.response?.data
        }
        
        return reformer.reform(apiManager: self)
    }
}
