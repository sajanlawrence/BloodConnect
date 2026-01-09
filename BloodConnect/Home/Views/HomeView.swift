//
//  HomeView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 03/01/26.
//

import SwiftUI

struct HomeView: View {
    let images: [ImageResource] = [.sliderImage1, .sliderImage2]
    @Binding var showDonationSheet: Bool
    var body: some View {
        NavigationStack {
            VStack(alignment: .center){
                HStack(alignment: .center){
                    VStack(alignment: .leading){
                        Text("WELCOME")
                            .font(.custom("Ubuntu-Regular", size: 14))
                        Text("SAJAN LAWRENCE")
                            .font(.custom("Ubuntu-Bold", size: 18))
                    }
                    Spacer()
                    Image(.notificationIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(images, id: \.self) { image in
                            CardView(imageName: image)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .padding()
                
                ZStack{
                    Rectangle()
                        .foregroundStyle(.gray.opacity(0.1))
                        .ignoresSafeArea()
                    VStack{
                        HStack(alignment: .top){
                            NavigationLink {
                                CampaignView()
                                    .navigationBarBackButtonHidden(true)
                            } label: {
                                ActionCardView(imageName: .campaign, title: "CAMPAIGNS")
                            }
                            
                            Button {
                                
                            } label: {
                                ActionCardView(imageName: .bloodBag, title: "DONATE")
                            }
                            
                            Button {
                                showDonationSheet = true
                            } label: {
                                ActionCardView(imageName: .findDonor, title: "FIND DONOR")
                            }
                        }
                        .padding(.bottom)
                        .padding(.top, -30)
                        DonationRequestView()
                        InviteFriendView()
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView(showDonationSheet: .constant(false))
}
