//
//  MapAppSwiftUIApp.swift
//  MapAppSwiftUI
//
//  Created by Islam Aldarabea on 19/11/2023.
//

import SwiftUI

@main
struct MapAppSwiftUIApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                LocationsView()
                    .environmentObject(vm)
            }
            .navigationTitle("App 1")
        }
    }
}
