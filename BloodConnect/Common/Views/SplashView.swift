//
//  SplashView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 03/01/26.
//

import SwiftUI

struct SplashView: View {
    let imageName: String
    let title1: String
    let title2: String
    let btnTitle: String
    let showSkipBtn: Bool
    let onNext: () -> Void
    let onSkip: () -> Void
    var body: some View {
        VStack{
            Image(imageName)
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
            Spacer()
            VStack(alignment: .center){
                Text(title1.uppercased())
                    .font(.custom("Ubuntu-Regular", size: 14))
                    .foregroundStyle(Color(red: 102/255, green: 102/255, blue: 102/255))
                Text(title2.uppercased())
                    .font(.custom("Ubuntu-Medium", size: 20))
                    .foregroundStyle(Color(red: 102/255, green: 102/255, blue: 102/255))
            }
            .frame(height: 54)
            .frame(maxWidth: .infinity)
            
            Button {
                onNext()
            } label: {
                Text(btnTitle)
                    .font(.custom("Ubuntu-Bold", size: 14))
                    .foregroundStyle(.white)
                    .frame(width: 200, height: 50)
                    .background(Color("AppPrimary"))
                    .clipShape(.buttonBorder)
            }
            
            Button {
                onSkip()
            } label: {
                Text(showSkipBtn ? "SKIP TO HOME" : "")
                    .font(.custom("Ubuntu-Bold", size: 14))
                    .foregroundStyle(.gray)
                    .frame(width: 200, height: 50)
                    .disabled(!showSkipBtn)
            }
            
            

        }
    }
}

#Preview {
    SplashView(imageName: "splashScreen1", title1: Constants.splashScreen1Title, title2: Constants.splashScreen1SubTitle, btnTitle: Constants.next, showSkipBtn: true){} onSkip: {}
}
