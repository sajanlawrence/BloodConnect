//
//  BloodGrpSelectionView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 05/01/26.
//

import SwiftUI

struct BloodGrpSelectionView: View {
    let bloodGroups: [String] = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]
    @State private var selectedBtnIndex: Int? = nil
    @Environment(SheetRouter.self) private var sheetRouter
    @Environment(SearchResultsViewModel.self) private var searchVM
    var body: some View {
        VStack(alignment: .leading) {
            Text("BLOOD TYPE")
                .font(.custom("Ubuntu-Bold", size: 16))
                .padding(.leading, 5)
            VStack(spacing: 30){
                HStack(spacing: 30){
                    ForEach(0..<4) { index in
                        Button {
                            selectedBtnIndex = index
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(selectedBtnIndex == index ? .appPrimary : Color(red: 243/255.0, green: 243/255.0, blue: 243/255.0))
                                    .frame(width: 72, height: 54)
                                Text(bloodGroups[index])
                                    .font(.custom("Ubuntu-Bold", size: 23))
                                    .foregroundStyle(selectedBtnIndex == index ? .white : .appPrimary)
                                
                            }
                        }
                    }
                }
                HStack(spacing: 30){
                    ForEach(4..<8) { index in
                        Button {
                            selectedBtnIndex = index
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(selectedBtnIndex == index ? .appPrimary : Color(red: 243/255.0, green: 243/255.0, blue: 243/255.0))
                                    .frame(width: 72, height: 54)
                                Text(bloodGroups[index])
                                    .font(.custom("Ubuntu-Bold", size: 23))
                                    .foregroundStyle(selectedBtnIndex == index ? .white : .appPrimary)
                            }
                        }
                    }
                }
            }
            .padding(.top)
            .padding(.bottom, 50)
            HStack{
                Spacer()
                Button {
                    if let index = selectedBtnIndex{
                        searchVM.requiredBloodGrp = bloodGroups[index]
                    }
                    sheetRouter.selectedSheet = .addressSheet
                } label: {
                    Text("NEXT")
                        .font(.custom("Ubuntu-Bold", size: 14))
                        .foregroundStyle(.white)
                        .frame(width: 160, height: 50)
                        .background(RoundedRectangle(cornerRadius: 30))
                        .foregroundStyle(.appPrimary)
                        
                }
            }
            .frame(alignment: .trailing)

        }
        .frame(height: 320)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.white)
        
        
    }
}

#Preview {
    BloodGrpSelectionView()
        .environment(SheetRouter())
        .environment(SearchResultsViewModel())
}
