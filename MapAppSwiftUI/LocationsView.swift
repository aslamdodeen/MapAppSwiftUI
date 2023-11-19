//
//  LocationsView.swift
//  MapAppSwiftUI
//
//  Created by Islam Aldarabea on 19/11/2023.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm:LocationsViewModel
    
    var body: some View {
        
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
        }
        .ignoresSafeArea()
       

    }
}

#Preview {
    NavigationStack {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }

}
