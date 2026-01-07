//
//  ListRow.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 07/01/26.
//

import SwiftUI

struct ListRow: View {
    let donor: Donor
    var body: some View {
        VStack{
            HStack{
                Text(donor.name)
                    .font(.custom("Ubuntu-Bold", size: 14))
                Spacer()
                Button {
                    
                } label: {
                    Image(.info)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                }
                
                Button {
                    
                } label: {
                    Image(.call)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                }
            }
            Image(.line)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ListRow(donor: Donor(id: "D001", name: "MABEL PETERSON", bloodType: "B+", age: 22, phoneNumber: "1234567898", address: "3891 Ranchview Dr. Richardson, California 62639", donatedCount: 20, donationRequestedCount: 2, isAvailableForDonation: true))
}
