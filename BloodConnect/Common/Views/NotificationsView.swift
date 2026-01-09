//
//  NotificationsView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 09/01/26.
//

import SwiftUI

struct NotificationsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var viewModel = NotificationViewModel()
    var body: some View {
        ZStack {
            Color(red: 246/255.0, green: 246/255.0, blue: 246/255.0)
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 10){
                HStack(alignment: .center){
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.custom("Ubuntu-Bold", size: 20))
                            .frame(width: 10, height: 30)
                            .foregroundStyle(.black)
                        
                    }
                    Text("NOTIFICATIONS")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.custom("Ubuntu-Bold", size: 20))
                }
                .padding(.horizontal)
                .padding(.top)
                HStack{
                    Text(viewModel.newNotificationsCount < 10 ? "0\(viewModel.newNotificationsCount)" : "\(viewModel.newNotificationsCount)")
                        .foregroundStyle(.appPrimary)
                        .font(.custom("Ubuntu-Bold", size: 14))
                    Text("NEW NOTIFICATIONS")
                        .font(.custom("Ubuntu-Regular", size: 14))
                        .foregroundStyle(Color(red: 153 / 255.0, green: 153 / 255.0, blue: 153 / 255.0))
                    Spacer()
                }
                .padding(.leading)
                .padding(.bottom)
                ScrollView{
                    ForEach(viewModel.notifications) { notification in
                        NotificationRowView(notification: notification)
                    }
                }
            }
        }
    }
}

#Preview {
    NotificationsView()
}
