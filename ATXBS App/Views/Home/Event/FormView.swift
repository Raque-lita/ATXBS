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
    @State var eventDescription: String = ""
    @Binding var showingSheet: Bool 
    var model: ContentModel
    
    var body: some View {
        NavigationView {
            
            Form {
                Section(header: Text("Event Information")) {
                    TextField("Event Name", text: $eventName)
                    TextField("Description", text: $eventDescription)
                    TextField("Event Date", text: $eventDate)
                    TextField("Event Address", text: $eventAddress)
                    
                    Button("Post Event") {
                        model.postMethod(title: eventName, description: eventDescription, location: eventAddress, date: eventDate) {result in 
                            print(result)
                            if result == true {
                                showingSheet = false
                            }
                            model.getEventInfo()
                        }
                    }
                    Button("Cancel"){
                        showingSheet = false
                    }
                }
            }.navigationBarTitle("Bike Event!")
        }
    }
}
