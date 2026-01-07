//
//  BottomTabBar.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 04/01/26.
//

import SwiftUI

struct BottomTabBar: View {
    @Environment(TabRouter.self) private var tabRouter
    @Binding var showSheet: Bool
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 52)
                .foregroundStyle(.white)
            HStack{
                Button {
                    tabRouter.selectedTab = .home
                } label: {
                    Image(systemName: "house.fill")
                        .foregroundStyle(tabRouter.selectedTab == .home ? .appPrimary : .black)
                }
                .padding(.leading, 50)
                Spacer()
                
                Button {
                    showSheet.toggle()
                } label: {
                    Image(tabRouter.selectedTab == .donate ? .donateSelected : .donate)
                }
                
                Spacer()
                
                Button {
                    tabRouter.selectedTab = .profile
                } label: {
                    Image(systemName: "person.fill")
                        .foregroundStyle(tabRouter.selectedTab == .profile ? .appPrimary : .black)
                }
                .padding(.trailing, 50)
            }
        }
    }
}

#Preview {
    BottomTabBar(showSheet: .constant(true))
        .environment(TabRouter())
}
