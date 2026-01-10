//
//  SuccessView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 10/01/26.
//

import SwiftUI

struct SuccessView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(spacing: 20){
            Text("THANK YOU")
                .font(.custom("Ubuntu-Bold", size: 16))
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
            
            Text("We’ll keep you informed once the donation date is finalized.")
                .font(.custom("Ubuntu-Regular", size: 16))
                .multilineTextAlignment(.center)
            
            Button {
               dismiss()
            } label: {
                Text("GO TO HOME")
                    .font(.custom("Ubuntu-Bold", size: 14))
                    .foregroundStyle(.white)
                    .frame(width: 160, height: 50)
                    .background(RoundedRectangle(cornerRadius: 30))
                    .foregroundStyle(.appPrimary)
                    
            }
        }
        .frame(width: 414)
    }
}

#Preview {
    SuccessView()
        .environment(TabRouter())
}
