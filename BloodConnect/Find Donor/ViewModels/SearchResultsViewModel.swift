//
//  SearchResultsViewModel.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 09/01/26.
//

import Foundation

@Observable
class SearchResultsViewModel{
    var donors: [Donor] = []
    var requiredBloodGrp: String = ""
    var location: String = ""
    var state: String = ""
    var address: String = ""
    var hospital: String = ""
    var date: String = ""
    var purpose: String = ""
    
    init() {
        loadDonorsProfiles()
    }
    
    func loadDonorsProfiles(){
        guard let url = Bundle.main.url(forResource: "Donors", withExtension: "json") else {
            print("❌ Donors.json not found")
            return
        }
        
        do{
            let data = try Data(contentsOf: url)
            let decodedItems = try JSONDecoder().decode(Donors.self, from: data)
            donors = decodedItems.donors
        } catch{
            print("error\(error.localizedDescription)")
        }
    }
    
    func matchingDonors() -> [Donor]{
        donors.filter { donor in
            donor.bloodType == requiredBloodGrp && donor.isAvailableForDonation == true
        }
    }
}
