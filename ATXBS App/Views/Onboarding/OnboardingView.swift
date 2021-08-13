//
//  OnboardingView.swift
//  ATXBS App
//
//  Created by Ada on 8/12/21.
//

import SwiftUI

struct OnboardingView: View {
    let launchview = LaunchView()
    @EnvironmentObject var model: ContentModel
    var body: some View {
        
        VStack{
            Image("AustinBike")
                .resizable()
                .scaledToFit()
            Text("Austin Texas Bike Stuff")
                .bold()
                .font(.title)
            Text("ATXBS helps users aggregate bike info, and create events")
        }
        
        Button("See List of Bike Info") {
            model.requestGeolocationsPermision()
            print("hello world")
        }
        Button("Create Bike Event"){
            FormView()
        }
        
        
}

}
