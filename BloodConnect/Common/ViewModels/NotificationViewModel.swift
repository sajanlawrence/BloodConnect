//
//  NotificationViewModel.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 09/01/26.
//

import Foundation


class NotificationViewModel{
    let notifications: [Notification] = [
            Notification(bloodGrp: "B+", isLatest: true),
            Notification(bloodGrp: "O+", isLatest: false),
            Notification(bloodGrp: "AB+", isLatest: true),
            Notification(bloodGrp: "B-", isLatest: true),
            Notification(bloodGrp: "B+", isLatest: true),
            Notification(bloodGrp: "AB+", isLatest: false),
            Notification(bloodGrp: "A+", isLatest: false),
            Notification(bloodGrp: "O-", isLatest: false),
            Notification(bloodGrp: "O-", isLatest: true),
            Notification(bloodGrp: "B+", isLatest: false),
            Notification(bloodGrp: "A-", isLatest: true),
    ].sorted {
        $0.isLatest && !$1.isLatest
    }
    
    var newNotificationsCount: Int{
        notifications.filter({$0.isLatest == true}).count
    }
}
