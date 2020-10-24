//
//  CheckListItem .swift
//  CheckList
//
//  Created by Данил Дубов on 22.10.2020.
//

import SwiftUI
import Foundation

struct CheckListItem:Identifiable, Codable{
    var id = UUID()
    var name: String
    var description: String
    var isChecked: Bool = false
    
    func textForChecked() -> Text {
        return Text(isChecked ? "🟢" : "🔴")
    }
}
