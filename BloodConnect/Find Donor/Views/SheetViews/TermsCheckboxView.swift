//
//  TermsCheckboxView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 05/01/26.
//

import SwiftUI

struct TermsCheckboxView: View {
    @State private var isChecked = false

    var body: some View {
        Button {
            isChecked.toggle()
        } label: {
            HStack(spacing: 10) {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .font(.system(size: 20))
                    .foregroundStyle(isChecked ? .appPrimary : .secondary)

                Text("I AGREE ALL TERMS & CONDITIONS")
                    .font(.custom("Ubuntu-Bold", size: 16))
                    .foregroundStyle(.primary)

                Spacer()
            }
        }
        .buttonStyle(.plain)
    }
}


#Preview {
    TermsCheckboxView()
}
