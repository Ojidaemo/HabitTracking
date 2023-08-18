//
//  Activity.swift
//  HabitTracking
//
//  Created by Vitali Martsinovich on 2023-08-17.
//

import SwiftUI

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount = 0

    static let example = Activity(title: "Example activity", description: "This is a test activity.")
}

