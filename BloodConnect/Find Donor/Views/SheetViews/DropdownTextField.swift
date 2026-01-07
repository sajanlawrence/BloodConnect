//
//  DropdownTextField.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 05/01/26.
//

import SwiftUI

struct DropdownTextField: View {
    let placeholder: String = "BLOOD USED FOR"
    let options: [String] = [
        "Accident / Trauma",
        "Surgery",
        "Cancer Treatment",
        "Childbirth",
        "Anemia",
        "Emergency",
        "Other"
    ]

    @Binding var selectedOption: String?
    @State private var showOptions = false

    var body: some View {
        Button {
            showOptions = true
        } label: {
            HStack {
                Text(selectedOption ?? placeholder)
                    .foregroundStyle(selectedOption == nil ? .secondary : .primary)
                    .font(.custom("Ubuntu-Bold", size: 16))

                Spacer()

                Image(systemName: "chevron.down")
                    .foregroundStyle(.black)
                    .bold()
            }
            .padding()
            .background(Color(red: 243/255.0, green: 243/255.0, blue: 243/255.0))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .buttonStyle(.plain)
        .sheet(isPresented: $showOptions) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text(placeholder)
                        .font(.custom("Ubuntu-Bold", size: 16))
                    
                    ForEach(options, id: \.self) { option in
                        Button {
                            selectedOption = option.uppercased()
                            showOptions = false
                        } label: {
                            HStack {
                                Text(option)
                                    .foregroundStyle(.black)
                                    .font(.custom("Ubuntu-Regular", size: 16))
                                Spacer()
                                if option == selectedOption {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(.blue)
                                }
                            }
                            .padding()
                        }
                        .background(Color(red: 243/255.0, green: 243/255.0, blue: 243/255.0))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    Spacer()
                }
                .safeAreaInset(edge: .top) {
                    Color.clear.frame(height: 30)
                }
                .presentationDetents([.height(400)])
                .padding()
            }
            .background(.white)
        }
    }
}


#Preview {
    DropdownTextField(selectedOption: .constant(""))
}
