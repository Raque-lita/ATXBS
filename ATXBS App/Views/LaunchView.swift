//
//  ContentView.swift
//  ATXBS App
//
//  Created by Ada on 8/4/21.
//

import SwiftUI
import CoreLocation


struct LaunchView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        //detect geolocating status
        // detet authorization status of geolocating the user
        if model.authorizationState == .notDetermined {
        //if undetermined, show onboarding
        }
        else if model.authorizationState == .authorizedAlways || model.authorizationState == .authorizedWhenInUse {
            HomeView()
        }
    }
    
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
