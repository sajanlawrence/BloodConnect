//
//  BloodConnectApp.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 03/01/26.
//

import SwiftUI

@main
struct BloodConnectApp: App {
    @State private var showHome: Bool = false
    @State private var tabRouter = TabRouter()
    @State private var sheetRouter = SheetRouter()
    var body: some Scene {
        WindowGroup {
            if showHome{
                TabBarContainerView()
                    .environment(tabRouter)
                    .environment(sheetRouter)
            }else{
                RootView(showHome: $showHome)
            }
            
        }
    }
}
