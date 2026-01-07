//
//  InviteFriendView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 04/01/26.
//

import SwiftUI

struct InviteFriendView: View {
    @State private var showShareSheet = false

    private let inviteText = """
    Join me on BloodConnect
    A simple blood donation app where anyone can donate or find donors.

    Download the app:
    https://your-app-link.com
    """

    var body: some View {
        Image(.inviteFriend)
            .resizable()
            .scaledToFit()
            .frame(width: 374, height: 111)
            .padding()
        .contentShape(Rectangle())
        .onTapGesture {
            showShareSheet = true
        }
        .sheet(isPresented: $showShareSheet) {
            ShareSheet(items: [inviteText])
        }
    }
}


#Preview {
    InviteFriendView()
}
