//
//  EventRow.swift
//  ATXBS App
//
//  Created by Ada on 8/10/21.
//

import SwiftUI

struct EventRow: View {
    
    //@ObservedObject var event: Event
    var event: Event
     
     var body: some View {
         
         VStack (alignment: .leading) {
             
             HStack {
                 //Image
//                 let uiImage = UIImage(data: business.imageData ?? Data())
//                 Image(uiImage: uiImage ?? UIImage())
//                     .resizable()
//                     .frame(width:58, height:58)
//                     .cornerRadius(5)
//                     .scaledToFit()
                 
                 //name and distance
                 VStack{
                     Text(event.title ?? "")
                         .bold()
                    Text(event.location ?? "")
                         .font(.caption)
     
                 }
                 Spacer()

             }
             Divider()
         }
    
     }

 }