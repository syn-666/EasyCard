//
//  WatchCard.swift
//  EasyCard
//
//  Created by 史雅楠 on 2021/4/15.
//

import SwiftUI

struct WatchCard: View {
    @EnvironmentObject var user:UserData
    @Binding var tapFlag:Bool
    
    
    var body: some View {
         ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))]), startPoint: .top, endPoint: .bottom)
            if user.unCom.count > 0 {
                ScrollView(showsIndicators:false) {
                    VStack{
                        ForEach(user.unCom.indices,id:\.self){ index in
                            VStack(alignment: .center, spacing: -20.0) {
                                GeometryReader { geo in
                                    CardItem(item: user.unCom[index], color: colors[index%6])
                                        .rotation3DEffect(
                                            .degrees(Double((geo.frame(in: .global).minY - 20)/20)),
                                            axis: (x: 1.0, y: 0.0, z: 0.0)
                                        )
                                        .offset(x: tapFlag ? 0 : bounds.width)
                                        
                                }.frame(width:400,height:220)
                            }
                        }.padding(.top,55)
                    }.offset(x:30)
                    
                }.animation(.spring())
            }
            VStack{
                HStack {
                    Spacer()
                    Button(action: {self.tapFlag = false}, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.black,lineWidth: 4)
                            )
                            .shadow(color: Color.black.opacity(0.5), radius: 20, x: 0, y: 20)
                    })
                    .padding(.top)
                    .padding()
                    
                }
                Spacer()
            }.padding()

        }
         .ignoresSafeArea()
        
    }
}

struct WatchCard_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            WatchCard(tapFlag: .constant(true)).environmentObject(UserData())
        }
    }
}
