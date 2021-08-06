//
//  BikeInfoSearch.swift
//  ATXBS App
//
//  Created by Ada on 8/5/21.
//

import Foundation

struct BikeInfoSearch: Decodable {
    
    var businesses = [BikeInfo]()
    var total = 0
    var region = Region()
    
}
struct Region: Decodable {
    var center = Coordinate()
}
