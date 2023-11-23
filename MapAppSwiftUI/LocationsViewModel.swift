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
    
  // show location detail via sheet
    
    @Published var sheetLocation:Location? = nil
    
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
    
    func nextButtonPressed() {
          
        guard  let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else {
            print("Could not found current insex in locations array!")
            return
        }
        
        // Check if the currntIndex is vaild
        
        let nextIndex = currentIndex + 1
        
        guard locations.indices.contains(nextIndex) else {
            // if not faild restart to 0 index
            guard    let firstLoction = locations.first else {
                return
            }
            showNextLocation(location: firstLoction)
            return
        }

        let nextLocation = locations[nextIndex]
        
        showNextLocation(location: nextLocation)
    }
}
