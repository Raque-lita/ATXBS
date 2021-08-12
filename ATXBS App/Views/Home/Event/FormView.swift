//
//  FormView.swift
//  ATXBS App
//
//  Created by Ada on 8/12/21.
//

import SwiftUI

struct FormView: View {
    @State var eventName: String = ""
    @State var eventAddress: String = ""
    @State var eventDate: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Event Information")) {
                    TextField("Event Name", text: $eventName)
                    TextField("Event Date", text: $eventDate)
                    TextField("Event Address", text: $eventAddress)
                }
            }.navigationBarTitle("Bike Event!")
        }
    }
}
