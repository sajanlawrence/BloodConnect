//
//  NotificationRowView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 09/01/26.
//

import SwiftUI

struct NotificationRowView: View {
    let notification: Notification
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 0){
                Image(systemName: "info.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(notification.isLatest ? .appPrimary : .black)
                    .padding(.trailing)
                Text(makeText())
                    .multilineTextAlignment(.leading)
                    .frame(width: 334, height: 40, alignment: .leading)
                Spacer()
            }
            .frame(height: 40, alignment: .leading)
            .frame(maxWidth: .infinity)
            .padding(.leading, 15)
            Image(.line)
        }
    }
    
    func makeText() -> AttributedString {
        var text = AttributedString("BLOOD TYPE \(notification.bloodGrp) REQUIRED NEARBY YOUR LOCATION")
        text.foregroundColor = .black
        text.font = .custom("Ubuntu-Regular", size: 14)

        if let range = text.range(of: notification.bloodGrp) {
            text[range].foregroundColor = .appPrimary
            text[range].font = .custom("Ubuntu-Bold", size: 14)
        }
        return text
    }
}

#Preview {
    NotificationRowView(notification: Notification(bloodGrp: "B+", isLatest: true))
}
