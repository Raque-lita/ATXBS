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
    
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    @Published var bikerentals = [BikeInfo]()
    @Published var bikepaths = [BikeInfo]()
    @Published var events = [Event]()
    
    override init() {
        super.init()
        
        // Set content model as the delegate of the location manager
        locationManager.delegate = self
        
        //start geolocating
    }
    func requestGeolocationsPermision(){
        //request permission from user
        locationManager.requestWhenInUseAuthorization()
    }
    // MARK - Location manager delegate methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        //update the authorizationState property
        authorizationState = locationManager.authorizationStatus
        
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
//            getYelpInfo(category: "restaurants", location: userLocation!)
            getEventInfo()
            getYelpInfo(category: Constants.bikerentalsKey, location: userLocation!)
         //   getYelpInfo(category: Constants.bicyclepathsKey, location: userLocation!)
            
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
        let url = urlComponents?.url
        
        if let url = url {
            
            //create URL request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.addValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
            //get URL session
            let session = URLSession.shared
            
            //create Data Task
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                if error == nil {
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(BikeInfoSearch.self, from: data!)
                        
                        //sort businesses
                        var businesses = result.businesses
                        businesses.sort { (b1, b2) -> Bool in
                            return b1.distance ?? 0 < b2.distance ?? 0
                        }
                        
                        //call get image function of businesses
                        for b in businesses {
                            b.getImageData()
                        }
                        
                                DispatchQueue.main.async {
                                    print(result)
    
                                    switch category {
                                    
                                    case Constants.bikerentalsKey:
                                        self.bikerentals = businesses
                                    case Constants.bicyclepathsKey:
                                        self.bikepaths = businesses
                                        
                                    default:
                                        break
                                      
                                    }
                    }
                }
                    catch {
                        print(error)
                    }
                }
                
            }
            
            //Start data Task
            dataTask.resume()
            
        }
        
    }
    
    func getEventInfo() {
    
        let url = URL(string: "http://localhost:5000/events")
        if let url = url {
                
                //create URL request
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        request.httpMethod = "GET"
                //request.addValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
                //get URL session
        let session = URLSession.shared
                
                //create Data Task
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                print("I am here")
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([Event].self, from: data!)
                    
                    DispatchQueue.main.async {
                    //assign event to property
                    self.events = result
                    //print(result)
        
                    }
                }
                catch {
                    print(error)
                }

            }
        }
            dataTask.resume()
        }
    }
}
