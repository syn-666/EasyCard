//
//  CardItem.swift
//  EasyCard
//
//  Created by 史雅楠 on 2021/4/15.
//

import SwiftUI

struct CardItem: View {
    var item:Item
    var color:UIColor
    @State var viewState:CGSize = .zero
    @EnvironmentObject var user:UserData

    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10.0){
                    Text(item.title)
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(Color.white)
                        .lineLimit(2)
                        .font(.caption)
                    Text(item.time)
                        .font(.caption)
                }
                Spacer()
                Image(item.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
            }
            Image(item.background)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 100)
            
        }
        .padding(.horizontal,20)
        .frame(width: 340, height: 220)
        .background(Color(color))
        .cornerRadius(25)
        .offset(x: viewState.width)
        .gesture(
            DragGesture().onChanged({ (value) in
                viewState.width = value.translation.width
            }).onEnded({ (value) in
                if viewState.width > bounds.width/2{
                    guard let index = user.items.firstIndex(where: {$0.id == item.id}) else{
                        return
                    }
                    user.items[index].isDone = true
                    viewState = .zero
                }else{
                    viewState = .zero
                }
            })
        )

    }
}

struct CardItema:PreviewProvider {
    static var previews: some View {
        CardItem(item: defaultItems[0], color: colors[0]).environmentObject(UserData())
    }
}
