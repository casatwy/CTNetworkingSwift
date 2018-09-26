//
//  Callback.BaseAPIManager.extension.swift
//  Alamofire
//
//  Created by casa on 2018/9/21.
//

import Foundation
import Alamofire

extension CTNetworkingBaseAPIManager {
    func success() {
        delegate?.requestDidSuccess(self)
    }
    
    func fail() {
        delegate?.requestDidFailed(self)
    }
}
