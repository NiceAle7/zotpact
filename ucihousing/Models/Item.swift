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

