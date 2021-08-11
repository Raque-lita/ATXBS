//
//  Business Section.swift
//  ATXBS App
//
//  Created by Ada on 8/6/21.
//

import SwiftUI

struct BusinessSection: View {
    var title: String
    var businesses: [BikeInfo]
    
    var body: some View {
        Section (header: BusinessSectionHeader(title: title)){
            ForEach(businesses) { business in
            BusinessRow(business: business)
            }
        }
    }
}

