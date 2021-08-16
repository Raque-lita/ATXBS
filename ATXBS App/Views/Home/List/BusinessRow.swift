//
//   BuisnessRow.swift
//  ATXBS App
//
//  Created by Ada on 8/6/21.
//

import SwiftUI

struct BusinessRow: View {
   @ObservedObject var business: BikeInfo
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            HStack {
                //Image
                let uiImage = UIImage(data: business.imageData ?? Data())
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .frame(width:58, height:58)
                    .cornerRadius(5)
                    .scaledToFit()
                
                //name and distance
                VStack{
                    Text(business.name ?? "")
                        .bold()
                    Text(String(format:"%.1f km away", (business.distance ?? 0)/1000))
                        .font(.caption)
    
                }
                Spacer()

            }
            Divider()
        }
        .foregroundColor(.black)
   
    }

}
