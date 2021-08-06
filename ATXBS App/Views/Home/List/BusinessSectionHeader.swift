//
//  BusinessSectionHeader.swift
//  ATXBS App
//
//  Created by Ada on 8/6/21.
//

import SwiftUI

struct BusinessSectionHeader: View {
    var title: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            Text(title)
                .font(.headline)
        }
    }
}

struct BusinessSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        BusinessSectionHeader(title: "Shops")
    }
}
