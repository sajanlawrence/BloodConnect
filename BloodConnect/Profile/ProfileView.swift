//
//  ProfileView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 08/01/26.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color(red: 246/255.0, green: 246/255.0, blue: 246/255.0)
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 10){
                HStack{
                    Text("PROFILE")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.custom("Ubuntu-Bold", size: 20))
                        .padding(.top)
                    Spacer()
                    Image(.notificationIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        
                }
                .padding()
                
                VStack {
                    Image(.profilePhoto)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 92, height: 92)
                    Text("FELIX GORDON")
                        .font(.custom("Ubuntu-Bold", size: 20))
                        .foregroundStyle(.appPrimary)
                }
                .padding(.bottom)
                
                VStack(alignment: .leading){
                    Divider()
                    settingsRowView(label: "SETTINGS & PREFERENCES", imageName: "gearshape.fill")
                    settingsRowView(label: "NOTIFICATIONS", imageName: "bell.circle.fill")
                    settingsRowView(label: "TERMS OF USE", imageName: "doc.text.fill")
                    settingsRowView(label: "PRIVACY POLICY", imageName: "lock.doc.fill")
                    
                    settingsRowView(label: "HELP & FAQS", imageName: "questionmark.circle.fill")
                    settingsRowView(label: "CONTACT US", imageName: "phone.circle.fill")
                    
                }
                .frame(width: 373, height: 348)
                
                Text("APP VERSION 4.5.42015")
                    .font(.custom("Ubuntu-Bold", size: 14))
                    .foregroundStyle(.gray.opacity(0.5))
                    .padding(.top, 50)
                Spacer()
            }
            
        }
    }
}

extension ProfileView{
    @ViewBuilder
    func settingsRowView(label: String, imageName: String) -> some View{
        VStack(alignment: .leading){
            HStack(alignment: .center){
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.black)
                    .frame(width: 28, height: 28)
                    .padding(.trailing, 20)
                Text(label)
                    .font(.custom("Ubuntu-Bold", size: 14))
                    .foregroundStyle(.black)
                    .frame(height: 28)
            }
        }
        .frame(height: 43, alignment: .center)
        Divider()
    }
}

#Preview {
    ProfileView()
}
