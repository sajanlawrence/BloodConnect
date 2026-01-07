//
//  SearchResultsView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 07/01/26.
//

import SwiftUI

struct SearchResultsView: View {
    var body: some View {
        ZStack {
            Color(red: 246/255.0, green: 246/255.0, blue: 246/255.0)
                .ignoresSafeArea()
            VStack{
                Text("SEARCH")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom("Ubuntu-Bold", size: 20))
                    .padding(.top)
                    .padding(.leading)
                HStack{
                    Text("\(20) RESULT(S) FOUND FOR BLOOD TYPE")
                        .font(.custom("Ubuntu-Regular", size: 14))
                        .foregroundStyle(Color(red: 153/255.0, green: 153/255.0, blue: 153/255.0))
                    Text("B+")
                        .foregroundStyle(.appPrimary)
                        .font(.custom("Ubuntu-Bold", size: 14))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 28)
                .padding(.leading)
                ScrollView{
                    ForEach(0..<10) { i in
                        ListRow(donor: Donor(id: "D001", name: "MABEL PETERSON", bloodType: "B+", age: 22, phoneNumber: "1234567898", address: "3891 Ranchview Dr. Richardson, California 62639", donatedCount: 20, donationRequestedCount: 2, isAvailableForDonation: true))
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}

#Preview {
    SearchResultsView()
}
