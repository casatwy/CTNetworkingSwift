//
//  CTNetworkingAPIManagerPagable.swift
//  CTNetworkingSwift
//
//  Created by casa on 2018/9/29.
//  Copyright © 2018 casa. All rights reserved.
//

import Foundation

public protocol CTNetworkingAPIManagerPagable : AnyObject, CTNetworkingAPIManagerCallable, CTNetworkingAPIManagerFetchable {
    var pageSize : Int { get }
    var isLastPage : Bool { get }
    var isFirstPage : Bool { get }
    var currentPageNumber : Int { get }
    var totalCount : Int? { get }
    
    func loadNextPage()
}
