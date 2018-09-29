//
//  Debug.Response.Extension.swift
//  CTNetworkingSwift
//
//  Created by casa on 2018/9/28.
//  Copyright © 2018 casa. All rights reserved.
//

import Foundation
import Alamofire

extension DefaultDataResponse {
    public func logString() -> String {
        
        guard let response = response else { return "No Response" }
        guard let request = request else { return "No Request" }

        var logString = "\n\n=========================================\nAPI Response\n=========================================\n\n"
        logString += "Status:\t\(response.statusCode)\t\(HTTPURLResponse.localizedString(forStatusCode: response.statusCode))\n\n"
        
        if let data = data {
            logString += "Content:\n\t\(String(data: data, encoding: .utf8) ?? "Can not parse response data")\n\n"
        } else {
            logString += "Content:\n\tNo Data Available\n\n"
        }
        
        if let error = error {
            logString += error.localizedDescription
        }
        
        logString += "\n---------------  Related Request Content  --------------\n"
        logString += request.descriptionLogString()
        logString += "\n\n=========================================\nResponse End\n=========================================\n\n"
        return logString
    }
}
