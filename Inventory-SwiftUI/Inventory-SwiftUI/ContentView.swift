//
//  ContentView.swift
//  Inventory-SwiftUI
//
//  Created by Safar Safarov on 18/09/22.
//
import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftUI



struct ContentView: View {
    
    @FirestoreQuery(collectionPath: "inventories") private var items: [InventoryItem]
    private let db = Firestore.firestore().collection("inventories")
    var body: some View {
        VStack {
            if let error = $items.error {
                Text(error.localizedDescription)
            }
            
            if items.count > 0 {
                List(items) { item in
                    TextField("Name", text: Binding<String>(
                        get: { item.name },
                        set: { updateItem(item, data: ["name": $0]) }))
                }
            }
        }
    }
    
    private func updateItem(_ item: InventoryItem, data: [String: Any]) {
        guard let id = item.id else { return }
        var _data = data
        _data["updatedAt"] = FieldValue.serverTimestamp()
        db.document(id).updateData(_data)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
