//
//  TableView.ViewController.extension.swift
//  CTNetworking.Swift_Example
//
//  Created by casa on 2018/9/20.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import Alamofire

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.text = dataSource[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // do nothing
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            testAPIManager.loadData()
        }
    }
}
