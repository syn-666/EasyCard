//
//  Card.swift
//  EasyCard
//
//  Created by 史雅楠 on 2021/4/14.
//

import SwiftUI

struct Card: View {
    var item:Item
    var color:UIColor
    var reverse:Int//控制顺序
    var index:Int//控制显示顺序
    @Binding var viewState:CGSize
    @Binding var moveFlag:Bool
    
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
        .padding(.horizontal)
        .frame(width: 340, height: 220)
        .background(Color(color))
        .cornerRadius(25)
        .shadow(color: Color(color).opacity(0.3), radius: 20, x: 0, y: 20)
        .rotationEffect(.degrees(moveFlag ? 0 : Double((reverse-index) * 5)))
        .offset(y: CGFloat(moveFlag ? -230 * (reverse-index) : -20 * (reverse-index)))
        .offset(x:viewState.width,y: viewState.height)
        .animation(.spring())
        
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(item: defaultItems[0],color: colors[0],reverse: 0,index: 0,viewState: .constant(.zero),moveFlag: .constant(false))
    }
}
