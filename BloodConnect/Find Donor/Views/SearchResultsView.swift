//
//  SearchResultsView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 07/01/26.
//

import SwiftUI

struct SearchResultsView: View {
    @Environment(SearchResultsViewModel.self) var searchVM
    var body: some View {
        NavigationStack {
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
                        Text("\(searchVM.matchingDonors().count) RESULT(S) FOUND FOR BLOOD TYPE")
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
                        ForEach(searchVM.matchingDonors()) { donor in
                            NavigationLink {
                                DonorProfileView(donor: donor)
                                    .navigationBarBackButtonHidden()
                            } label: {
                                ListRow(donor: donor)
                            }
                            
                            
                        }
                    }
                    .scrollIndicators(.hidden)
                    .padding(.horizontal)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    SearchResultsView()
        .environment(SearchResultsViewModel())
}
