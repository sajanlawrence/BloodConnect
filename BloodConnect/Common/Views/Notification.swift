//
//  Notification.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 09/01/26.
//

import Foundation

struct Notification: Identifiable{
    let id = UUID()
    let bloodGrp: String
    let isLatest: Bool
}
