//
//  CTNetworkingAPIManagerPagable.swift
//  CTNetworkingSwift
//
//  Created by casa on 2018/9/29.
//  Copyright © 2018 casa. All rights reserved.
//

import Foundation

public protocol CTNetworkingAPIManagerPagable : CTNetworkingAPIManager {
    var pageSize : Int { get }
    var isLastPage : Bool { get }
    var isFirstPage : Bool { get }
    var currentPageNumber : Int { get }
    var totalCount : Int? { get }
    var nextStep : Int? { get }

    func loadNextPage()
    func loadPreviousPage()
    func load(page:Int)
    func refreshCurrentPage(page:Int)
}

public extension CTNetworkingAPIManagerPagable {
    func loadNextPage() {}
    func loadPreviousPage() {}
    func load(page:Int) {}
    func refreshCurrentPage(page:Int) {}
}
