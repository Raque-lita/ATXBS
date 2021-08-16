//
//  OnboardingView.swift
//  ATXBS App
//
//  Created by Ada on 8/12/21.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var showingSheet = false
    var body: some View {
        
        VStack{
            Image("AustinBike")
                .resizable()
                .scaledToFit()
                .padding()
            Text("Austin Texas Bike Stuff")
                .bold()
                .font(.title)
                .padding()
            Text("ATXBS helps users aggregate bike info, and create events")
        }
        
        Button("See List of Bike Info") {
            model.requestGeolocationsPermision()
            print("hello world")
        }
        Button("Create Bike Event"){
            showingSheet = true
        }
        .sheet(isPresented: $showingSheet) {
            FormView(showingSheet: $showingSheet, model: model)
        }
        
        
    }
    
}
