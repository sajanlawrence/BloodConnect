//
//  SheetContainerView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 05/01/26.
//

import SwiftUI

enum sheetTypes: CaseIterable, Identifiable{
    case bloodGropSheet
    case addressSheet
    case requirementSheet
    
    var id: Self { self }
}

struct SheetContainerView: View {
    @Environment(SheetRouter.self) private var sheetRouter
    @Environment(TabRouter.self) private var tabRouter
    @State var requiredBloodGrp: String = ""
    @State var location: String = ""
    @State var state: String = ""
    @State var address: String = ""
    @State var hospital: String = ""
    @State var date: String = ""
    @State var purpose: String = ""
    var body: some View {
        switch sheetRouter.selectedSheet{
        case .bloodGropSheet:
            BloodGrpSelectionView(requiredBloodGrp: $requiredBloodGrp)
        case .addressSheet:
            AddressView(location: $location, state: $state, address: $address, hospitalName: $hospital)
        case .requirementSheet:
            RequirementView(date: $date, purpose: $purpose)
        }
    }
}

#Preview {
    SheetContainerView()
        .environment(SheetRouter())
        .environment(TabRouter())
}
