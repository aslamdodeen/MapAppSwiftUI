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
    @Published var locations:[Location]
    
    // Current location on the map.
    @Published var mapLocation:Location {
        
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion:MKCoordinateRegion = MKCoordinateRegion()
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
}
