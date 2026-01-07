//
//  AddressView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 05/01/26.
//

import SwiftUI

struct RequirementView: View {
    @State private var selectedDate: Date? = nil
    @State private var selectedOption: String? = nil
    @Binding var date: String
    @Binding var purpose: String
    @Environment(\.dismiss) var dismiss
    @Environment(SheetRouter.self) private var sheetRouter
    @Environment(TabRouter.self) private var tabRouter
    var body: some View {
        VStack(alignment: .leading) {
            Text("REQUIREMENT")
                .font(.custom("Ubuntu-Bold", size: 16))
                .padding(.leading, 5)
                .padding(.bottom, 5)
            DateTextField(selectedDate: $selectedDate)
            DropdownTextField(selectedOption: $selectedOption)
                .padding(.bottom)
            TermsCheckboxView()
                .padding(.bottom)

            HStack{
                Button {
                    sheetRouter.selectedSheet = .addressSheet
                } label: {
                    Text("PREVIOUS")
                        .font(.custom("Ubuntu-Bold", size: 14))
                        .foregroundStyle(.gray)
                        .frame(width: 160, height: 50)
                }
                Spacer()
                Button {
                    date = selectedDateText
                    purpose = selectedOptionText
                    tabRouter.selectedTab = .donate
                    dismiss()
                } label: {
                    Text("SUBMIT")
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
    
    private var selectedDateText: String {
        if let date = selectedDate {
            return date.formatted(date: .abbreviated, time: .omitted).uppercased()
        } else {
            return "DATE"
        }
    }
    private var selectedOptionText: String {
        if let option = selectedOption {
            return option
        } else {
            return ""
        }
    }
}

#Preview {
    RequirementView(date: .constant(""), purpose: .constant(""))
        .environment(SheetRouter())
        .environment(TabRouter())
}
