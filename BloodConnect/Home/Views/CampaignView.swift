//
//  CampaignView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 08/01/26.
//

import SwiftUI

struct CampaignView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            Color(red: 246/255.0, green: 246/255.0, blue: 246/255.0)
                .ignoresSafeArea()
            Image(.speaker)
                .resizable()
                .scaledToFit()
                .frame(width: 156, height: 118)
            VStack(alignment: .center, spacing: 10){
                HStack(alignment: .center){
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.custom("Ubuntu-Bold", size: 20))
                            .frame(width: 10, height: 30)
                            .foregroundStyle(.black)
                            
                    }
                    Text("CAMPAIGNS")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.custom("Ubuntu-Bold", size: 20))
                    Spacer()
                    Image(.notificationIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    
                }
                .padding()
                HStack(){
                    Text("WE HAVE TOTAL")
                        .font(.custom("Ubuntu-Regular", size: 14))
                        .foregroundStyle(Color(red: 153/255.0, green: 153/255.0, blue: 153/255.0))
                    Text("04 ACTIVE CAMPAIGNS")
                        .foregroundStyle(.appPrimary)
                        .font(.custom("Ubuntu-Bold", size: 14))
                    Spacer()
                }
                .padding(.leading)
                .padding(.bottom)
                ScrollView{
                    ForEach(0..<4) { _ in
                        CampaignRow(date: "DECEMBER, 25 2022")
                    }
                }
               Spacer()
            }
        }
    }
}



#Preview {
    CampaignView()
}
