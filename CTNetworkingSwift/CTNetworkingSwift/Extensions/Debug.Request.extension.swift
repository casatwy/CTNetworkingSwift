//
//  Debug.Request.extension.swift
//  CTNetworkingSwift
//
//  Created by casa on 2018/9/28.
//  Copyright © 2018 casa. All rights reserved.
//

import Foundation

extension URLRequest {
    public func logString(apiName:String, service: CTNetworkingService) -> String {
        
        var logString = "\n\n***********************\nRequest Start\n***********************\n\n"
        
        logString += "API Name:\t\t\(apiName)"
        logString += "Method:\t\t\(httpMethod ?? "N/A")"
        logString += "Service:\t\t\(type(of: service))"
        
        var environmentString = ""
        switch service.apiEnvironment {
        case .Develop:
            environmentString = "Develop"
        case .preRelease:
            environmentString = "preRelease"
        case .Release:
            environmentString = "Release"
        }
        logString += "Environment:\t\t\(environmentString)"
        logString += descriptionLogString()
        
        return logString
    }
    
    public func descriptionLogString() -> String {
        var result = ""
        
        result += "\n\nHTTP URL:\n\t\(url?.absoluteString ?? "N/A")"

        var headerString = ""
        if let httpHeaders = allHTTPHeaderFields {
            result += "\n\nHTTP Header:\n\t\(dictionaryToJsonString(dictionary: httpHeaders))"
            for (headerKey, headerValue) in httpHeaders.enumerated() {
                headerString += " -H \"\(headerKey):\(headerValue)\""
            }
        }

        var bodyString = ""
        if let bodyData = httpBody {
            bodyString += String(data: bodyData, encoding: .utf8) ?? ""
            result += "\n\nHTTP Body:\n\t\(bodyString)"
        }
        
        result += "\n\nCURL:\n\t curl -X \(httpMethod ?? "Get") \(headerString) -d \'\(bodyString)\' \(url?.absoluteString ?? "")"

        return result
    }
    
    func dictionaryToJsonString(dictionary:[AnyHashable:Any]) -> String {
        guard let data = try? JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted) else { return "" }
        let result = String(data: data, encoding: .utf8) ?? ""
        return result
    }
}
