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
        for location in model.events {
       DispatchQueue.main.async {
        
        if let locay = location.location, let title = location.title {
           //loop through calling add antoation get coordinate
                mapView.addAnnotation(getCoordinate(addressString: locay, titleString: title))
       }
       }
       
   }
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
    func getCoordinate( addressString : String, titleString: String) -> MKPointAnnotation {
        var events = model.events
        let geocoder = CLGeocoder()
        var annotations2 = [CLPlacemark]()
        var a = MKPointAnnotation()
        DispatchQueue.main.async {
            geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            if error == nil {
                if (placemarks?[0]) != nil {
                    var location1 = placemarks! as [CLPlacemark]
                    print(location1)
                    var lat = location1[0].location?.coordinate.latitude
                    var long = location1[0].location?.coordinate.longitude
        
                    a.coordinate = CLLocationCoordinate2D(latitude: lat!, longitude: long!)
                    a.title = titleString
                }
            }
            print(error ?? "")
            }
        }
        return a
        }
    
}
