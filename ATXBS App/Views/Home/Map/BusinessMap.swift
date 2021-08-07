//
//  BusinessMap.swift
//  ATXBS App
//
//  Created by Ada on 8/7/21.
//

import SwiftUI
import MapKit

struct BusinessMap: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    
    var locations: [MKPointAnnotation] {
        var annotations = [MKPointAnnotation]()
        
        for business in model.bikerentals {
            //if biz has a lat/long, create an mk point annotation for it
            if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude {
            //create a new annotation
                var a = MKPointAnnotation()
                a.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                a.title = business.name ?? ""
                annotations.append(a)
            
            }
        }
        return annotations
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        //make user show up on map
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        //set region
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        //remove all annotations
        uiView.removeAnnotations(uiView.annotations)
        //add ones based on the business
        //uiView.addAnnotations(self.locations)
        uiView.showAnnotations(self.locations, animated: true)
        
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        
    }
}
