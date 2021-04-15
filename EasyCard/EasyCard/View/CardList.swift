//
//  CardList.swift
//  EasyCard
//
//  Created by 史雅楠 on 2021/4/15.
//

import SwiftUI

struct CardList: View {
    @EnvironmentObject var user:UserData
    @State var viewState:CGSize = .zero
    @State var moveFlag:Bool = false
    
    var body: some View {
        let reverse = user.items.count-1

        return ZStack() {
            ForEach(user.items.indices,id:\.self){ index in
                if index == user.items.count-1{
                    Card(item: user.items[reverse-index], color: colors[index % colors.count],reverse:reverse,index:index,viewState:$viewState,moveFlag:$moveFlag)
                }else{
                    Card(item: user.items[reverse-index], color: colors[index % colors.count],reverse:reverse,index:index,viewState:$viewState,moveFlag:$moveFlag)
                        .blendMode(.hardLight)
                }
                    
            }
            .gesture(
                DragGesture().onChanged({ (value) in
                    moveFlag = true
                    viewState = value.translation
                }).onEnded({ (value) in
                    moveFlag = false
                    viewState = .zero
                })
            )
            
        }
    }
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList().environmentObject(UserData())
    }
}
