//
//  Callback.BaseAPIManager.extension.swift
//  Alamofire
//
//  Created by casa on 2018/9/21.
//

import Alamofire

public extension CTNetworkingAPIManager {
    func success() {
        guard beforePerformSuccess(self) else { return }
        delegate?.requestDidSuccess(self)
        afterPerformSuccess(self)
    }
    
    func fail() {
        guard beforePerformFail(self) else { return }
        delegate?.requestDidFailed(self)
        afterPerformFail(self)
    }
}
