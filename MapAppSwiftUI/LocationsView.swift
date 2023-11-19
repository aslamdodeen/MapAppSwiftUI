//
//  LocationsView.swift
//  MapAppSwiftUI
//
//  Created by Islam Aldarabea on 19/11/2023.
//

import SwiftUI

struct LocationsView: View {
    
    @EnvironmentObject private var vm:LocationsViewModel
    
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                
                Text(location.name)
                    .font(.title2)
            }
        }
        .navigationTitle("LocationsView")

    }
}

#Preview {
    NavigationStack {
        LocationsView()
            .environmentObject(LocationsViewModel())
            .navigationTitle("LocationsView")
    }

}
