//
//  BusinessList.swift
//  ATXBS App
//
//  Created by Ada on 8/5/21.
//

import SwiftUI

struct BusinessList: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView (showsIndicators: false) {
            LazyVStack (alignment: .leading, pinnedViews:[.sectionHeaders]) {
                BusinessSection(title: "Bike Shops", businesses: model.bikerentals)
                }
            
        }
    }
    }
    
struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}

