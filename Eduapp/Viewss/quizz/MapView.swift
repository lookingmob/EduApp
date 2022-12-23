//
//  MapView.swift
//  Eduapp
//
//  Created by alaa gharbi on 22/12/2022.
//

import Foundation
import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
  func makeUIView(context: Context) -> MKMapView {
    let mapView = MKMapView()
    mapView.delegate = context.coordinator
    return mapView
  }

  func updateUIView(_ view: MKMapView, context: Context) {
    // update the view if necessary
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  class Coordinator: NSObject, MKMapViewDelegate {
    var parent: MapView

    init(_ parent: MapView) {
      self.parent = parent
    }

    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
      for view in views {
        // add a gesture recognizer to the annotation view
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(gestureRecognizer:)))
        view.addGestureRecognizer(gestureRecognizer)
      }
    }

    @objc func handleTap(gestureRecognizer: UITapGestureRecognizer) {
      // get the annotation view that was tapped
      let view = gestureRecognizer.view as! MKAnnotationView

      // get the annotation and its location
      let annotation = view.annotation
      let location = annotation?.coordinate

      // add a new pin to the map at the location
      let pin = MKPointAnnotation()
      //  pin.coordinate = location
 //     mapView.addAnnotation(pin)
    }
  }
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
