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
    var body: some View {
        switch sheetRouter.selectedSheet{
        case .bloodGropSheet:
            BloodGrpSelectionView()
        case .addressSheet:
            AddressView()
        case .requirementSheet:
            RequirementView()
        }
    }
}

#Preview {
    SheetContainerView()
        .environment(SheetRouter())
        .environment(TabRouter())
}
