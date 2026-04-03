//
//  Item.swift
//  ucihousing
//
//  Created by Alejandro Olivares-Lopez on 4/3/26.
//
import Foundation
import SwiftData

@Model
class Item: Identifiable {
    @Attribute(.unique) var id: UUID = UUID()
    var timestamp: Date

    init(timestamp: Date = Date()) {
        self.timestamp = timestamp
    }
}
