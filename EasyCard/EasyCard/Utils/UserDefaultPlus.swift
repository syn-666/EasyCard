//
//  SwiftUIView.swift
//  EasyCard
//
//  Created by 史雅楠 on 2021/4/14.
//

import SwiftUI

@propertyWrapper
struct UserDefaultPlus<Value:Codable> {
    let key:String
    let defaultValue:Value
    
    var wrappedValue:Value{
        get{
            let data = UserDefaults.standard.data(forKey: key)
            let value = data.flatMap{try? JSONDecoder().decode(Value.self, from: $0)}
            return value ?? defaultValue
        }
        set{
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
}
