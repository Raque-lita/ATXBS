//
//  HomeView.swift
//  ATXBS App
//
//  Created by Ada on 8/5/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    
    var body: some View {
        if model.bikerentals.count != 0 || model.events.count != 0 {
            
            //determine if we should show list or map
            if !isMapShowing{
                //show list
                VStack (alignment: .leading) {
                    HStack {
                        Image(systemName: "location")
                        Text("Austin")
                        Spacer()
                        Button("Switch to map view") {
                            self.isMapShowing = true
                        }
                    }
                    Divider()
                    BusinessList()
                    
                    
                }
            }
            else {
                //show map
                BusinessMap()
                    .ignoresSafeArea()
            }
            
        }
        else {
            //waiting for info, show spinner
        ProgressView()
       
    }
}
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
