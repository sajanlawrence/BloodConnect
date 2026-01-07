//
//  Donors.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 07/01/26.
//

import Foundation

struct Donors: Codable {
    let donors: [Donor]
}

struct Donor: Codable, Identifiable {
    let id, name, bloodType: String
    let age: Int
    let phoneNumber, address: String
    let donatedCount, donationRequestedCount: Int
    let isAvailableForDonation: Bool
}
