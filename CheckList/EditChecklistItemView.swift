//
//  EditChecklistItemView.swift
//  CheckList
//
//  Created by Данил Дубов on 23.10.2020.
//

import SwiftUI

struct EditChecklistItemView: View {
    
    @Binding var cheklistItem: CheckListItem
    
    var body: some View {
        Form{
            TextField("Name: ", text: $cheklistItem.name)
            
            TextField("Discription: ", text: $cheklistItem.description)
            
            Toggle(isOn: $cheklistItem.isChecked, label: {
                Text("Completed")
            })
        }
    }
}

struct EditChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditChecklistItemView(cheklistItem: .constant(CheckListItem(name: "Sample item",
                                                          description: "Sample discription")))
    }
}
