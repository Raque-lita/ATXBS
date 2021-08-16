//
//  BusinessDetail.swift
//  ATXBS App
//
//  Created by Ada on 8/16/21.
//

import SwiftUI

struct BusinessDetail: View {
    
    var business: BikeInfo
    
    var body: some View {
        VStack (alignment: .leading) {
            
            VStack (alignment: .leading, spacing: 0) {
                GeometryReader() { geometry in
                
            let uiImage = UIImage(data: business.imageData ?? Data())
            Image(uiImage: uiImage ?? UIImage())
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipped()
                    
                }
                .ignoresSafeArea(.all, edges: .top)
                
            ZStack (alignment: .leading ){
                Rectangle()
                    .frame(height: 36)
                    .foregroundColor(business.isClose! ? .gray : .blue)
                
                Text(!business.isClose! ? "Closed" : "Open")
                    .foregroundColor(.white)
                    .bold()
                }
            }
            Group {
                Text(business.name!)
                    .font(.largeTitle)
                    .padding()
                if business.location?.displayAddress != nil {
                    ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                        Text(displayLine)
                            .padding(.horizontal)
                    }
                }
                
                Divider()
                HStack{
                    Text("Phone:")
                        .bold()
                    Text(business.displayPhone ?? "")
                    Spacer()
                    Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
                }
                .padding()
                
                Divider()
                
                HStack {
                    Text("Website:")
                        .bold()
                    //Text(business.url ?? "")
                    Spacer()
                    Link("Visit", destination: URL(string: "\(business.url ?? "")")!)
                }
                .padding()
                Divider()
            }
        
        }
    }
}

