//
//  LocationsViewModel.swift
//  MapAppSwiftUI
//
//  Created by Islam Aldarabea on 19/11/2023.
//

import Foundation

class LocationsViewModel:ObservableObject {
    
    @Published var locations:[Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
