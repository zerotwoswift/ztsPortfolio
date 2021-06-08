//
//  EditItemView.swift
//  zts portfolio
//
//  Created by Hubert Leszkiewicz on 08/06/2021.
//

import SwiftUI

struct EditItemView: View {
    var item: Item
    
    @EnvironmentObject var dataController: DataController
    
    @State private var title: String
    @State private var detail: String
    @State private var priority: Int
    @State private var completed: Bool
    
    init(item: Item) {
        self.item = item
        
        _title = State(wrappedValue: item.itemTitle)
        _detail = State(wrappedValue: item.itemDetail)
        _priority = State(wrappedValue: Int(item.priority))
        _completed = State(wrappedValue: item.completion)
    }
    var body: some View {
        Form {
            Section(header: Text("Basic Settings")) {
                TextField("Item Name", text: $title)
                TextField("Item Description", text: $detail)
            }
            
            Section(header: Text("Priority")) {
                Picker("Priority", selection: $priority) {
                    Text("Low").tag(1)
                    Text("Medium").tag(2)
                    Text("High").tag(3)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section {
                Toggle("Mark completed", isOn: $completed)
            }
        }
        .navigationTitle("Edit Item")
        .onDisappear(perform: update)
    }
    
    func update() {
        item.project?.objectWillChange.send()
        
        item.title = title
        item.detail = detail
        item.priority = Int16(priority)
        item.completion = completed
    }
}

struct EditItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditItemView(item: Item.example)
    }
}
