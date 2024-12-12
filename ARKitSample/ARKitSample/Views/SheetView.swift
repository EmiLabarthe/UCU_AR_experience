//
//  SheetView.swift
//  ARKitSample
//
//  Created by Jose Alberto Echague Guzman on 9/12/24.
//

import SwiftUI

struct SheetView: View {
    @Binding var isPresented: Bool
    @State var modelName: String = "UCU_campus2"

    var body: some View {
        ZStack(alignment: .topTrailing) {
            ARViewContainer(modelName: $modelName)
                .ignoresSafeArea(edges: .all)

            Button {
                isPresented.toggle()
            } label: {
                Image(systemName: "xmark.circle")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
            }
            .padding(24)
        }
    }
}

#Preview {
    SheetView(isPresented: .constant(true))
}
