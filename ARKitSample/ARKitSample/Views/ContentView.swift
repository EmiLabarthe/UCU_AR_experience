//
//  ContentView.swift
//  ARKitSample
//
//  Created by Jose Alberto Echague Guzman on 9/12/24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView{
            VStack {
                Image("UCU")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.tint)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                    .padding(24)
                
                Text("UCU AR experience")
                    .font(.title)
                    .bold()
                
                NavigationLink(destination: UCUInfoView()) {
                    Text("Presioná para continuar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
