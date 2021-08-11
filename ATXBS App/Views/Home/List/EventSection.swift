//
//  EventSection.swift
//  ATXBS App
//
//  Created by Ada on 8/10/21.
//

import SwiftUI

struct EventSection: View {
    var title: String
    var events: [Event]
    
    var body: some View {
        Section (header: BusinessSectionHeader(title: title)) {
            ForEach(events) { event in
                Text(event.title ?? "")
                Divider()
            }
        }


    }
}
