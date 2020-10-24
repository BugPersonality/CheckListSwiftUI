//
//  NewChecklistItemView.swift
//  CheckList
//
//  Created by Данил Дубов on 23.10.2020.
//

import SwiftUI

struct NewChecklistItemView: View {
    
    var cheklist: Cheklist
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var showErrorMessage = false
    @State var newItemIsChecked = true
    @State var newItemName = ""
    @State var newItemDiscription = ""
    
    var body: some View {
        VStack{
            Form{
                TextField("Name: ", text: $newItemName)
                TextField("Discription: ", text: $newItemDiscription)
                Toggle(isOn: $newItemIsChecked, label: {
                    Text("State")
                })
                Button(action: {
                    
                    let newCheklistItem = CheckListItem(name: newItemName,
                                                        description: newItemDiscription,
                                                        isChecked: newItemIsChecked)
                    
                    if newItemDiscription == ""{
                        self.showErrorMessage = true
                    }
                    else{
                        self.cheklist.items.append(newCheklistItem)
                        self.cheklist.saveListData()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }){
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("add task")
                    }
                }
                .disabled(newItemName.count == 0)
                .alert(isPresented: $showErrorMessage){
                    Alert(title: Text("Error"),
                          message: Text("discription doesn't exist"),
                          primaryButton: .default(Text("Set discription")),
                          secondaryButton:  .destructive(Text("Without it")){
                            let newCheklistItem = CheckListItem(name: newItemName,
                                                                description: newItemDiscription,
                                                                isChecked: newItemIsChecked)
                            self.cheklist.items.append(newCheklistItem)
                            self.cheklist.saveListData()
                            self.presentationMode.wrappedValue.dismiss()
                        })
                }
            }
        }
    }
}

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView(cheklist: Cheklist())
    }
}
