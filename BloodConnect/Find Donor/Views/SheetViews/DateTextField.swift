//
//  DateTextField.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 05/01/26.
//

import SwiftUI

struct DateTextField: View {
    @Binding var selectedDate: Date?
    @State private var showPicker = false

    var body: some View {
        Button {
            showPicker = true
        } label: {
            HStack {
                Text(selectedDateText)
                    .foregroundStyle(selectedDate == nil ? .secondary : .primary)
                    .font(.custom("Ubuntu-Bold", size: 16))

                Spacer()

                Image(systemName: "calendar")
                    .foregroundStyle(.appPrimary)
            }
            .padding()
            .background(Color(red: 243/255.0, green: 243/255.0, blue: 243/255.0))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .buttonStyle(.plain)
        .sheet(isPresented: $showPicker) {
            VStack(spacing: 20) {
                DatePicker(
                    "Select Date",
                    selection: Binding(
                        get: { selectedDate ?? Date() },
                        set: { selectedDate = $0 }
                    ),
                    displayedComponents: .date
                )
                .datePickerStyle(.graphical)

                Button("Done") {
                    showPicker = false
                }
                .bold()
            }
            
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 30)
            }
            .presentationDetents([.height(400)])
            .padding()
            .background(.white)
        }
    }

    private var selectedDateText: String {
        if let date = selectedDate {
            return date.formatted(date: .abbreviated, time: .omitted).uppercased()
        } else {
            return "DATE"
        }
    }
}


#Preview {
    DateTextField(selectedDate: .constant(Date()))
}
