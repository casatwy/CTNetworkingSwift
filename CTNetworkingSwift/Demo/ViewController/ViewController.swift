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
    ]
    
    lazy var sessionManager : Session = {
        
        var certificates:[SecCertificate] = Bundle.main.af.certificates
        let manager = ServerTrustManager(evaluators: ["*":PinnedCertificatesTrustEvaluator(acceptSelfSignedCertificates:true)])
        
        let configuration = URLSessionConfiguration.default
        var protocolClasses = configuration.protocolClasses
        protocolClasses?.insert(CTNetworkingProtocol.self, at: 0)
        configuration.protocolClasses = protocolClasses
        let sessionManager = Session(configuration: configuration, serverTrustManager: manager)
        return sessionManager
    }()
    
    lazy var testAPIManager : TestAPIManager = {
        let _testAPIManager = TestAPIManager()
        _testAPIManager.delegate = self
        _testAPIManager.mockDataFileURL = Bundle.main.url(forResource: "test", withExtension: "json")
        return _testAPIManager
    }()

}

