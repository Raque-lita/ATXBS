//
//  ATXBSApp.swift
//  ATXBS App
//
//  Created by Ada on 8/4/21.
//

import SwiftUI

@main
struct ATXBSApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
