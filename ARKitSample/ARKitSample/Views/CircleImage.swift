//
//  CircleImage.swift
//  Landmarks
//
//  Created by Emiliano Labarthe on 5/12/24.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("UCU_backdoor")
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
            .frame(width: 200, height: 200)
    }
}

#Preview {
    CircleImage()
}
