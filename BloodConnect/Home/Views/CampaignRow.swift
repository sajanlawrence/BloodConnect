//
//  CampaignRow.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 08/01/26.
//

import SwiftUI

struct CampaignRow: View {
    let date: String
    @State private var changeIcon: Bool = false
    var body: some View {
        VStack{
            HStack{
                Text(date)
                    .font(.custom("Ubuntu-Bold", size: 16))
                    .foregroundStyle(.appPrimary)
                Spacer()
            }
            .padding(.leading)
            .padding(.bottom, 5)
            Text("INVITE YOUR FRIENDS AND COLLEGUES FOR NEW BLOOD DONATION CAMPAIGN.")
                .font(.custom("Ubuntu-Regular", size: 14))
                .foregroundStyle(.black.opacity(0.5))
            HStack{
                Button {
                    changeIcon.toggle()
                } label: {
                    Label("I AM IN", systemImage: changeIcon ? "checkmark.circle.fill" : "circle")
                        .font(.custom("Ubuntu-Bold", size: 14))
                        .foregroundStyle(changeIcon ? Color(red: 139/255.0, green: 195/255.0, blue: 74/255.0) : .gray)
                }
                Spacer()
                Label("VIEW LOCATION", image: .location)
                    .font(.custom("Ubuntu-Bold", size: 14))
                    .frame(width: 145, height: 16)
            }
            .padding()
            Image(.line)
                .resizable()
                .scaledToFit()
        }
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    CampaignRow(date: "DECEMBER, 23 2025")
}
