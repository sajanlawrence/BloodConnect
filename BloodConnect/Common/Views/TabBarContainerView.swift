//
//  TabBarContainerView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 04/01/26.
//

import SwiftUI

struct TabBarContainerView: View {
    @State private var showTabBar: Bool = true
    @Environment(TabRouter.self) private var tabRouter
    @Environment(SheetRouter.self) private var sheetRouter
    @State private var showDonationSheet: Bool = false
    var body: some View {
        VStack(spacing: 0) {
            ZStack{
                switch tabRouter.selectedTab{
                case .home:
                    HomeView(showDonationSheet: $showDonationSheet, showTabBar: $showTabBar)
                case .donate:
                    SearchResultsView()
                case .profile:
                    ProfileView()
                }
            }
            .safeAreaInset(edge: .bottom) {
                if showTabBar{
                    BottomTabBar(showSheet: $showDonationSheet)
                        .padding(.horizontal)
                        .frame(height: 52)
                }
            }
        }
        .sheet(isPresented: $showDonationSheet, onDismiss: {
            showDonationSheet = false
            sheetRouter.selectedSheet = .bloodGropSheet
        }) {
            SheetContainerView()
                .safeAreaInset(edge: .top) {
                    Color.clear.frame(height: 35)
                }
                .presentationDetents([.height(320)])
        }
    }
}

#Preview {
    TabBarContainerView()
        .environment(TabRouter())
        .environment(SheetRouter())
}
