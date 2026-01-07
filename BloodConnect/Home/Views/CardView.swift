//
//  CardView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 03/01/26.
//

import SwiftUI

struct CardView: View {
    let imageName: ImageResource
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 325, height: 200)
    }
}

#Preview {
    CardView(imageName: .sliderImage1)
}
