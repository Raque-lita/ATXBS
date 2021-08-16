//
//  EventDetail.swift
//  ATXBS App
//
//  Created by Ada on 8/16/21.
//

import SwiftUI

struct EventDetail: View {
    var event: Event
    
    var body: some View {
        VStack (alignment: .leading) {
            
            VStack (alignment: .leading, spacing: 0) {
                GeometryReader() { geometry in
                
            
            Image("AustinBike")
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipped()
                    
                }
                .ignoresSafeArea(.all, edges: .top)
                
            ZStack (alignment: .leading ){

                

            }
            Group {
                Text(event.title!)
                    .font(.largeTitle)
                    .padding()

                    }
            }
                
                Divider()
                HStack{
                    Text("Event Date")
                        .bold()
                    Text(event.date!)
                    Spacer()
    
                }
                .padding()
                
                Divider()
                
                HStack {
                    Text("Location")
                        .bold()
                    Text(event.location!)
                    Spacer()
                    
                }
                .padding()
                Divider()
            HStack {
                Text("Description")
                    .bold()
                Text(event.description!)
            }
        
        }
    }
}




