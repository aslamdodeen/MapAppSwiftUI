//
//  LocationsListView.swift
//  MapAppSwiftUI
//
//  Created by Islam Aldarabea on 19/11/2023.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject private var vm:LocationsViewModel
    var body: some View {
        
        List {
            ForEach(vm.locations) { location in
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                .padding(.vertical,4)
                .listRowBackground(Color.clear)

            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}

extension LocationsListView {
    
    private func listRowView(location:Location) -> some View {
        
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .frame(width: 45,height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading, content: {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
            })
            .frame(maxWidth:.infinity,alignment:.leading)
        }
    }
    
    
}

