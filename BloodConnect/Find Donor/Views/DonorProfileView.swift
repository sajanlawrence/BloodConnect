//
//  DonorProfileView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 07/01/26.
//

import SwiftUI

struct DonorProfileView: View {
    let donor: Donor
    var body: some View {
        ZStack {
            Color(red: 246/255.0, green: 246/255.0, blue: 246/255.0)
                .ignoresSafeArea()
            VStack{
                Text("DONOR PROFILE")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom("Ubuntu-Bold", size: 20))
                    .padding(.top)
                    .padding(.leading)
                Image(.userPhoto)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 130)
                    .padding()
                Text(donor.name.uppercased())
                    .font(.custom("Ubuntu-Bold", size: 20))
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 374, height: 44)
                        .foregroundStyle(Color(red: 139/255.0, green: 195/255.0, blue: 74/255.0))
                    HStack{
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.white)
                        Text("AVAILABLE FOR DONATE")
                            .font(.custom("Ubuntu-Bold", size: 16))
                            .foregroundStyle(.white)
                    }
                    
                }
                
                HStack(spacing: 28){
                    stackView(heading: donor.bloodType, subHeading: "BLOOD TYPE")
                    stackView(heading: donor.donatedCount < 10 ?  "0\(donor.donatedCount)" : "\(donor.donatedCount)", subHeading: "DONATED")
                    stackView(heading: donor.donationRequestedCount < 10 ? "0\(donor.donationRequestedCount)" : "\(donor.donationRequestedCount)", subHeading: "REQUESTED")
                }
                .padding(.vertical, 30)
                
                
                VStack{
                    Image(.location)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 19, height: 24)
                    Text(donor.address)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 297, height: 76)
                VStack(spacing: 30){
                    Button {
                        
                    } label: {
                        Image(.chatNow)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 50)
                    }
                    
                    Button {
                        
                    } label: {
                        Image(.callNow)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 50)
                    }
                }
                .padding()
                Spacer()
            }
        }
    }
}

extension DonorProfileView{
    func stackView(heading: String, subHeading: String) -> some View{
        VStack{
            Text(heading)
                .font(.custom("Ubuntu-Bold", size: 30))
                .foregroundStyle(.appPrimary)
            Text(subHeading)
                .font(.custom("Ubuntu-Regular", size: 14))
        }
    }
}

#Preview {
    DonorProfileView(donor: Donor(id: "D001", name: "MABEL PETERSON", bloodType: "B+", age: 22, phoneNumber: "1234567898", address: "3891 Ranchview Dr. Richardson, California 62639", donatedCount: 20, donationRequestedCount: 5, isAvailableForDonation: true))
}
