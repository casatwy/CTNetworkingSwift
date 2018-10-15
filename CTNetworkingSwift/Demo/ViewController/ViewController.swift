//
//  ViewController.swift
//  CTNetworking.Swift
//
//  Created by Casa Taloyum on 09/20/2018.
//  Copyright (c) 2018 Casa Taloyum. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    lazy var tableView : UITableView = {
        let _tableView = UITableView(frame: .zero, style: .plain)
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        _tableView.tableFooterView = UIView()
        return _tableView
    }()
    
    lazy var dataSource = [
        "API Manager",
        "WKWebView",
    ]
    
    lazy var sessionManager : SessionManager = {
        let serverTrustPolicyManager = ServerTrustPolicyManager(policies: ["*":.pinCertificates(certificates: ServerTrustPolicy.certificates(), validateCertificateChain: true, validateHost: true)])
        let configuration = URLSessionConfiguration.default
        var protocolClasses = configuration.protocolClasses
        protocolClasses?.insert(CTNetworkingProtocol.self, at: 0)
        configuration.protocolClasses = protocolClasses
        let sessionManager = SessionManager(configuration: configuration, delegate: SessionDelegate(), serverTrustPolicyManager: serverTrustPolicyManager)
        return sessionManager
    }()
    
    lazy var testAPIManager : TestAPIManager = {
        let _testAPIManager = TestAPIManager()
        _testAPIManager.delegate = self
        return _testAPIManager
    }()

}

