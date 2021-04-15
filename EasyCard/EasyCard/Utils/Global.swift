//
//  Global.swift
//  EasyCard
//
//  Created by 史雅楠 on 2021/4/14.
//

import SwiftUI

//一个具体的UIFeedbackGenerator子类，创建触觉来传达成功、失败和警告。
func haptic(type:UINotificationFeedbackGenerator.FeedbackType) {
    UINotificationFeedbackGenerator().notificationOccurred(type)
}

//一个具体的UIFeedbackGenerator子类，它创建触觉来模拟物理影响。
func impact(style:UIImpactFeedbackGenerator.FeedbackStyle) {
    UIImpactFeedbackGenerator(style: style).impactOccurred()
}

//通知此对象，已要求它放弃其窗口中的第一个响应程序的状态。关闭键盘
func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}

//日期格式
var formatter:DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy年M月d日-HH点mm分"
    return formatter
}()

//屏幕尺寸对象
let bounds = UIScreen.main.bounds

//全局url
let global_url = ""

//卡片背景
var images = ["Card1","Card2","Card3","Card4","Card5","Card6"]

//卡片背景颜色
var colors:[UIColor] = [#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1),#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1),#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)]

//icon
var icons = ["Logo1","Logo2","Logo3"]
