//
//  ContentView.swift
//  Landmarks
//
//  Created by Emiliano Labarthe on 4/12/24.
//

import SwiftUI


struct UCUInfoView: View {
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .center) {
                Text("Universidad Católica del Uruguay")
                    .font(.title)
                    .multilineTextAlignment(.center)
                HStack {
                    Text("Universidad")
                        .font(.subheadline)
                    Spacer()
                    Text("Montevideo")
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
            }
            .padding()
            Divider()
            Button {
                isPresented.toggle()
            } label: {
                Label("Mira la UCU paaa", systemImage: "arkit")
            }.buttonStyle(BorderedProminentButtonStyle())
                .padding(24)
        }
        .padding()
        .fullScreenCover(isPresented: $isPresented, content: {
            SheetView(isPresented: $isPresented)
        })
    }
}


#Preview {
    UCUInfoView()
}
