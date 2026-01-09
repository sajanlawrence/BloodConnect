//
//  ListRow.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 07/01/26.
//

import SwiftUI

struct ListRow: View {
    let donor: Donor
    @State private var showCallAlert = false
    var body: some View {
        VStack{
            HStack{
                Text(donor.name.uppercased())
                    .font(.custom("Ubuntu-Bold", size: 14))
                    .foregroundStyle(.black)
                Spacer()
                Image(.info)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                
                Button {
                    showCallAlert = true
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
        .alert("Call Donor?", isPresented: $showCallAlert) {
            Button("Call", role: .destructive) {
                callNumber(donor.phoneNumber)
            }
            Button("Cancel", role: .cancel) { }
        }
    }
    
    func callNumber(_ phoneNumber: String) {
        let cleanedNumber = phoneNumber.replacingOccurrences(of: " ", with: "")
        if let url = URL(string: "tel://\(cleanedNumber)"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    ListRow(donor: Donor(id: "D001", name: "MABEL PETERSON", bloodType: "B+", age: 22, phoneNumber: "1234567898", address: "3891 Ranchview Dr. Richardson, California 62639", donatedCount: 20, donationRequestedCount: 2, isAvailableForDonation: true))
}
