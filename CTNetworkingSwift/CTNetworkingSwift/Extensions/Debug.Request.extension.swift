//
//  Debug.Request.extension.swift
//  CTNetworkingSwift
//
//  Created by casa on 2018/9/28.
//  Copyright © 2018 casa. All rights reserved.
//

import Foundation
import Alamofire

extension URLRequest {
    public func logString(apiName:String, service: CTNetworkingService) -> String {
        
        var logString = "\n\n***********************\nRequest Start\n***********************\n\n"

        var environmentString = ""
        switch service.apiEnvironment {
        case .Develop:
            environmentString = "Develop"
        case .preRelease:
            environmentString = "preRelease"
        case .Release:
            environmentString = "Release"
        }
        
        logString += "Environment:\t\(environmentString)\n"
        logString += "API Name:\t\t\(apiName)\n"
        logString += "Method:\t\t\t\(httpMethod ?? "N/A")\n"
        logString += "Service:\t\t\(type(of: service))\n"
        logString += descriptionLogString()
        
        logString += "\n\n***********************\nRequest End\n***********************\n\n"
        
        return logString
    }
    
    func descriptionLogString() -> String {
        var result = ""
        
        result += "\n\nHTTP URL:\n\t\(url?.absoluteString ?? "N/A")"

        var headerString = ""
        if let httpHeaders = allHTTPHeaderFields {
            result += "\n\nHTTP Header:"
            
            httpHeaders.forEach { (key, value) in
                result += "\n\t\(key):\(value)"
                headerString += " -H \"\(key):\(value)\""
            }
        }

        var bodyString = ""
        if let bodyData = httpBody {
            if let _bodyString = String(data: bodyData, encoding: .utf8) {
                bodyString += " -d \'\(_bodyString)\'"
            }
            result += "\n\nHTTP Body:\n\t\(bodyString)"
        }
        
        result += "\n\nCURL:\n\t curl -X \(httpMethod ?? "Get")\(headerString)\(bodyString) \(url?.absoluteString ?? "")"

        return result
    }
    
    func dictionaryToJsonString(dictionary:[AnyHashable:Any]) -> String {
        guard let data = try? JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted) else { return "" }
        let result = String(data: data, encoding: .utf8) ?? ""
        return result
    }
}
