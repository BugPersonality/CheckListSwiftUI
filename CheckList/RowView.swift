//
//  RowView.swift
//  CheckList
//
//  Created by Данил Дубов on 23.10.2020.
//

import SwiftUI

struct RowView: View {
    
    @Binding var checklistItem: CheckListItem
    
    var body: some View {
        NavigationLink(destination: EditChecklistItemView(cheklistItem: $checklistItem)){
            HStack{
                Text("\(checklistItem.name)")
                
                Spacer()
                
                checklistItem.textForChecked()
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(checklistItem: .constant(CheckListItem(name: "Sample item",
                                             description: "Sample discription")))
    }
}
