//
//  ContentView.swift
//  CheckList
//
//  Created by Данил Дубов on 21.10.2020.
//

import SwiftUI

struct CheckListView: View {
    
    @State var newChecklistItemIsVisible = false
    @ObservedObject var checklist = Cheklist()
    
    var body: some View {
        NavigationView(){
            Form{
                
                ForEach(checklist.items){index in
                    RowView(checklistItem: self.$checklist.items[index])
                }
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
                
             }
            .navigationBarTitle("CheckList", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {self.newChecklistItemIsVisible = true}){
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("Add task")
                    }
                },
                trailing: EditButton())
        }
        .onAppear(){
            self.checklist.saveListData()
        }
        .sheet(isPresented: $newChecklistItemIsVisible){
            NewChecklistItemView(cheklist: self.checklist)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CheckListView()
    }
}
