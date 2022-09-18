//
//  InventoryItem.swift
//  Inventory-SwiftUI
//
//  Created by Safar Safarov on 18/09/22.
//

import Foundation
import FirebaseFirestoreSwift

struct InventoryItem: Identifiable, Codable {
    
    @DocumentID var id: String?
    
    @ServerTimestamp var createdAt: Date?
    @ServerTimestamp var updatedAt: Date?
    
    var name: String
    var quantity: Int
}
