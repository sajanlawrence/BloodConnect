//
//  ActionCardView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 04/01/26.
//

import SwiftUI

struct ActionCardView: View {
    let imageName: ImageResource
    let title: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 111, height: 111, alignment: .center)
                .background(.clear)
                .foregroundStyle(.white)
            VStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 42, height: 42, alignment: .center)
                    .padding(.bottom, 5)
                Text(title)
                    .font(.custom("Ubuntu-Bold", size: 13))
            }
        }
        .padding(.horizontal, 5)
    }
}

#Preview {
    ActionCardView(imageName: .campaign, title: "CAMPAIGNS")
}
