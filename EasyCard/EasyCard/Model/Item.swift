//
//  Item.swift
//  EasyCard
//
//  Created by 史雅楠 on 2021/4/14.
//

import SwiftUI
import Combine

struct Item:Codable,Identifiable{
    var id = UUID()
    var title:String
    var isDone:Bool = false
    var background:String
    var time:String = formatter.string(from: Date())
    var icon:String
    
}


var defaultItems:[Item] = []

class UserData: ObservableObject {
    let objectWillChange = PassthroughSubject<UserData,Never>()
    
    @UserDefaultPlus(key: "items", defaultValue: defaultItems)
    var items:[Item]{
        didSet{
            objectWillChange.send(self)
        }
    }
    
    var unCom:[Item]{
        items.filter{!$0.isDone}
    }
    
}



