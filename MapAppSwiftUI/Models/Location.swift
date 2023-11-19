//
//  Location.swift
//  MapAppSwiftUI
//
//  Created by Islam Aldarabea on 19/11/2023.
//

//  name: "Eiffel Tower",


import Foundation
import MapKit

struct Location {
    
    var name:String
    var cityName:String
    var coordinates:CLLocationCoordinate2D
    var description:String
    var imageNames:[String]
    var link:String

    
    init(name: String, cityName: String, coordinates: CLLocationCoordinate2D, description: String,imageNames:[String],link:String) {
        self.name = name
        self.cityName = cityName
        self.coordinates = coordinates
        self.description = description
        self.imageNames = imageNames
        self.link = link
    }
}
