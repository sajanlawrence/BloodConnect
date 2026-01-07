//
//  AppTab.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 04/01/26.
//

import Foundation

enum AppTab: CaseIterable{
    case home
    case donate
    case profile
    
    var icon: String{
        switch self {
        case .home:
            return "home.fill"
        case .donate:
            return "Donate"
        case .profile:
            return "person.fill"
        }
    }
}
