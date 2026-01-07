//
//  RootView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 03/01/26.
//

import SwiftUI

struct RootView: View {
    @Binding var showHome: Bool
    @State private var currentStep = 1
    var body: some View {
        ZStack {
            if currentStep == 1 {
                SplashView(
                    imageName: Constants.splashScreen1Image,
                    title1: Constants.splashScreen1Title,
                    title2: Constants.splashScreen1SubTitle,
                    btnTitle: Constants.next,
                    showSkipBtn: true
                ) {
                    withAnimation(.easeInOut(duration: 0.4)) {
                        currentStep = 2
                    }
                } onSkip: {
                    withAnimation {
                        showHome = true
                    }
                }
                .transition(.move(edge: .leading))
            }

            if currentStep == 2 {
                SplashView(
                    imageName: Constants.splashScreen2Image,
                    title1: Constants.splashScreen2Title,
                    title2: Constants.splashScreen2SubTitle,
                    btnTitle: Constants.start,
                    showSkipBtn: false
                ) {
                    withAnimation {
                        showHome = true
                    }
                } onSkip: {}
                .transition(.move(edge: .trailing))
            }
        }
    }
}


#Preview {
    RootView(showHome: .constant(false))
}
