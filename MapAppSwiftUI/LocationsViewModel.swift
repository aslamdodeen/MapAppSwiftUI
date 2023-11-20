//
//  LocationsViewModel.swift
//  MapAppSwiftUI
//
//  Created by Islam Aldarabea on 19/11/2023.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel:ObservableObject {
    
    // All loaded locations
    @Published  var locations:[Location]
    
    // Current location on the map.
    @Published var mapLocation:Location {
        
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion:MKCoordinateRegion = MKCoordinateRegion()
    // Show list locations
    @Published var showLocationList:Bool = false
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    func updateMapRegion(location:Location) {
        
        withAnimation(.easeOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    
     func toggleLocationList() {
         withAnimation(.easeInOut(duration: 0.44)) {
            showLocationList = !showLocationList
        }
    }
    
    func showNextLocation(location:Location) {
        withAnimation(.easeOut) {
            mapLocation = location
            showLocationList = false
        }
    }
}
