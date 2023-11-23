//
//  LocationDetailView.swift
//  MapAppSwiftUI
//
//  Created by Islam Aldarabea on 22/11/2023.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                    .shadow(color: .black.opacity(0.3), radius: 20, x: 0.0, y: 10)
                VStack(alignment: .leading,spacing: 16, content: {
                    
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                })
                .frame(maxWidth: .infinity, alignment:.leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton,alignment: .topLeading)
        
    }
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
}


extension LocationDetailView {
    
    private var imageSection : some View {
        TabView {
            ForEach(location.imageNames,id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection : some View {
        
        VStack(alignment: .leading,spacing: 8){
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
    
    private var descriptionSection : some View {
        
        VStack(alignment: .leading,spacing: 8){
            Text(location.description)
                .font(.subheadline)
                .foregroundStyle(.gray)
            if let url = URL(string: location.link){
                Link("Read More", destination:url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
    }
    
    private var mapLayer : some View {
        
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: location.coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))),
            annotationItems: [location]) { location in
            
            MapAnnotation(coordinate: location.coordinates) {
                
                LocationMapAnnotationView()
                    .shadow(radius: 10)
            }

        }
            .allowsHitTesting(false)
            .aspectRatio(1,contentMode: .fit)
            .cornerRadius(30)
            .padding(4)
            .padding(.bottom,21)
    }
    
    private var backButton:some View {
        Button {
            vm.sheetLocation = nil
        }label: {
           Image(systemName: "xmark")
        }
        .font(.headline)
        .padding(16)
        .foregroundColor(.primary)
        .fontWeight(.bold)
        .background(.thinMaterial)
        .clipped()
        .cornerRadius(30)
        .shadow(radius: 4)
        .padding(12)

        
    }

}
