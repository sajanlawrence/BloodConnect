//
//  AddressView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 06/01/26.
//

import SwiftUI

struct AddressView: View {
    @State var location: String = ""
    @State var state: String = ""
    @State var address: String = ""
    @State var hospitalName: String = ""
    @Environment(SheetRouter.self) private var sheetRouter
    @Environment(SearchResultsViewModel.self) private var searchVM
    var body: some View {
        VStack(alignment: .leading) {
            Text("LOCATION")
                .font(.custom("Ubuntu-Bold", size: 16))
                .padding(.leading, 5)
                .padding(.bottom, 5)
            
            
            HStack{
                customTextField(text: $location, placeholder: "LOCATION", width: 182, height: 50)
                Spacer()
                customTextField(text: $state, placeholder: "STATE", width: 182, height: 50)
            }
            .padding(.bottom, 5)
            customTextField(text: $address, placeholder: "ADDRESS", width: 375, height: 50)
                .padding(.bottom, 5)
            customTextField(text: $hospitalName, placeholder: "HOSPITAL NAME", width: 375, height: 50)
                .padding(.bottom)

            HStack{
                Button {
                    sheetRouter.selectedSheet = .bloodGropSheet
                } label: {
                    Text("PREVIOUS")
                        .font(.custom("Ubuntu-Bold", size: 14))
                        .foregroundStyle(.gray)
                        .frame(width: 160, height: 50)
                        
                        
                }
                Spacer()
                Button {
                    searchVM.location = location
                    searchVM.state = state
                    searchVM.address = address
                    searchVM.hospital = hospitalName
                    sheetRouter.selectedSheet = .requirementSheet
                } label: {
                    Text("NEXT")
                        .font(.custom("Ubuntu-Bold", size: 14))
                        .foregroundStyle(.white)
                        .frame(width: 160, height: 50)
                        .background(RoundedRectangle(cornerRadius: 30))
                        .foregroundStyle(.appPrimary)
                        
                }
            }
        }
        .frame(height: 320)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.white)
    }
}

extension AddressView{
    func customTextField(text: Binding<String>, placeholder: String, width: Double, height: Double) -> some View{
        HStack{
            TextField(
                "",
                text: text,
                prompt: Text(placeholder)
                    .font(.custom("Ubuntu-Bold", size: 16))
                    .foregroundColor(.gray)
            )
            .padding(.leading)
            .font(.custom("Ubuntu-Bold", size: 16))
            .frame(width: width, height: height, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(red: 243/255.0, green: 243/255.0, blue: 243/255.0))
            )
                
        }
    }
}

#Preview {
    AddressView()
        .environment(SheetRouter())
        .environment(SearchResultsViewModel())
}
