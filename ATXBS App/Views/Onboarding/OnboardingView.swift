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
            Text("ATXBS helps users Create and Find Bike Resources. Click Create Event to create a ride event, or See Bike Info for local bike shops and rides happening near you")
                .bold()
                .font(.subheadline)
                .padding()
        }
        
        Button("See List of Bike Info") {
            model.requestGeolocationsPermision()
            print("hello world")
        }
        Button("Create Event"){
            showingSheet = true
        }
        .sheet(isPresented: $showingSheet) {
            FormView(showingSheet: $showingSheet, model: model)
        }
        
        
    }
    
}
