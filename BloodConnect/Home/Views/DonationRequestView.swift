//
//  DonationRequestView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 04/01/26.
//

import SwiftUI

struct DonationRequestView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("DONATION REQUEST")
                .font(.custom("Ubuntu-Bold", size: 16))
            ScrollView(.horizontal) {
                HStack{
                    Image(.request1)
                    Image(.request2)
                    Image(.request1)
                    Image(.request2)
                    Image(.request1)
                    Image(.request2)
                }
            }
            .frame(maxWidth: .infinity)
            .scrollIndicators(.hidden)
        }
        .padding(.leading)
    }
}

#Preview {
    DonationRequestView()
}
