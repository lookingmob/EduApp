//
//  MapUIView.swift
//  Eduapp
//
//  Created by alaa gharbi on 20/12/2022.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapUIView: View {
    @State private var location: String = ""
      @State private var placemark: CLPlacemark?
    
    let locationManager = CLLocationManager()
  init(){
    //    locationManager.delegate = self
    }
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    var body: some View {
        Map(coordinateRegion: $region)
                   .frame(width: 400, height: 300)
        
    }
    func reverseGeocode(_ location: String) {
           let geocoder = CLGeocoder()
           let locationComponents = location.components(separatedBy: ",")
           let latitude = Double(locationComponents[0])!
           let longitude = Double(locationComponents[1])!
           let location = CLLocation(latitude: latitude, longitude: longitude)

           geocoder.reverseGeocodeLocation(location) { placemarks, error in
               if let error = error {
                   print("Error: \(error)")
                   return
               }
               if let placemarks = placemarks, !placemarks.isEmpty {
                   self.placemark = placemarks[0]
               }
           }
       }
}

struct MapUIView_Previews: PreviewProvider {
    static var previews: some View {
        MapUIView()
    }
}
//extension MapUIView: CLLocationManagerDelegate {
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else { return }
//
//        // Use the location to get the city name, etc.
//        let geocoder = CLGeocoder()
//        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
//            guard error == nil else { return }
//            guard let placemark = placemarks?.first else { return }
//
//            // The city name is in the `locality` property of the `placemark` object.
//            let city = placemark.locality
//            print(city)
//        }
//    }
//}
