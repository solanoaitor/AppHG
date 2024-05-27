//
//  ContentViewModel.swift
//  AppHG
//
//  Created by Aitor Solano on 21/5/24.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var progress: Double = 0.35
    @Published var currentDate: String = ""
    @Published var nextYearDate: Date = Date().addingYears(1) ?? Date()

    var user: User = User(name: "BIEL BULBENA", balance: 0.00, joinDate: Date(), level: "Legend")
    var rewards: [Reward] = [
        Reward(imageName: "cake", title: "Free \nMonthly \nSweet", isUsed: true),
        Reward(imageName: "cake", title: "Free \nMonthly \nSweet", isUsed: false)
    ]

    init() {
        self.currentDate = Date().formatted(as: "dd/MM/yyyy")
    }
}
