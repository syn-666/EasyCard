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

var defaultItems = [
    Item(title: "聚餐", background: "Card1", icon: "Logo1"),
    Item(title: "看电影", background: "Card2", icon: "Logo2"),
    Item(title: "学习", background: "Card3", icon: "Logo3")
]

class UserData: ObservableObject {
    let objectWillChange = PassthroughSubject<UserData,Never>()
    
    @UserDefaultPlus(key: "items", defaultValue: defaultItems)
    var items:[Item]{
        didSet{
            objectWillChange.send(self)
        }
    }
    
//    @Published var islog:Bool = UserDefaults.standard.bool(forKey: "log"){
//        didSet{
//            UserDefaults.standard.set(islog, forKey: "log")
//        }
//    }
    
}



