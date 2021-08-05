//
//  ContentModel.swift
//  ATXBS App
//
//  Created by Ada on 8/4/21.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        
        // Set content model as the delegate of the location manager
        locationManager.delegate = self
        
        //request permission from user
        locationManager.requestWhenInUseAuthorization()
        
        //start geolocating
    }
    // MARK - Location manager delegate methods
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse {
            //start geolocating user
            locationManager.startUpdatingLocation()
        }
        else if locationManager.authorizationStatus == .denied {
            
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //Give location of user
        let userLocation = locations.first
        
        if userLocation != nil {
            //stop request and pass to yelp API
            locationManager.stopUpdatingLocation()
            
            //if we have coordinates for user, send to yelp API
            getYelpInfo(category: "bikeshop", location: userLocation!)
//            getYelpInfo(category: "bikerentals", location: userLocation!)
//            getYelpInfo(category: "bicyclepaths", location: userLocation!)
            
        }
    }
    
    // MARK : YELP API METHODS
    func getYelpInfo(category: String, location: CLLocation) {
        
        // create URL
        var urlComponents = URLComponents(string: "https://api.yelp.com/v3/businesses/search")
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
        ]
        var url = urlComponents?.url
        
        if let url = url {
            
            //create URL request
            
            //get URL session
            
            //create Data Task
            
            //Start data Task
            
        }
        
    }
}
