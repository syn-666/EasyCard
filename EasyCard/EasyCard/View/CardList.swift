//
//  CardList.swift
//  EasyCard
//
//  Created by 史雅楠 on 2021/4/15.
//

import SwiftUI

struct CardList: View {
    @State var tapFlag:Bool = false
    @State var isEdit:Bool = false
    @State var moveFlage:Bool = false
    @EnvironmentObject var user:UserData

    var body: some View {
        
        
            ZStack() {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)), Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]), startPoint: .top, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                //卡片显示
//                NavigationView{
//                        .navigationTitle("待办事项🌞")
//                        .navigationBarItems(trailing:
//                                Button(action: {self.isEdit.toggle()}, label: {
//                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
//                                        .foregroundColor(.black)
//                                        .overlay(
//                                            Text("添加")
//                                                .font(.subheadline)
//                                                .foregroundColor(.white)
//                                        )
//
//                                        .blur(radius: moveFlage ? 20 : 0)
//                                })
//                                .sheet(isPresented: $isEdit, content: {
//                                    EditView(tapFlag:$isEdit)
//                                })
//                                .frame(width: 100, height: 40)
//                                                .padding(.top)
//                        )
//                }
                VStack{
                    HStack {
                        Text("待办事项🌞")
                            .font(.system(size: 30, weight: .bold))
                            .blur(radius: moveFlage ? 20 : 0)
                        Spacer()
                        Button(action: {self.isEdit.toggle()}, label: {
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .foregroundColor(.black)
                                .overlay(
                                    Text("添加卡片")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                )
                                
                                .blur(radius: moveFlage ? 20 : 0)
                        })
                        .sheet(isPresented: $isEdit, content: {
                            EditView(tapFlag:$isEdit)
                        })
                        .frame(width: 100, height: 40)
                    }
                    Spacer()
                }.padding()
                
                if user.unCom.count > 0{
                    CardForHome(moveFlag: $moveFlage)
                        .onTapGesture {
                            self.tapFlag = true
                        }
                        .scaleEffect(tapFlag ? 0.3 : 1)
                        .animation(.spring())
                }else{
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [10,10]))
                        .frame(width: 300, height: 200)
                        .overlay(
                            Text("添加卡片")
                                .font(.system(size: 18, weight: .bold,design:.rounded))
                        )
                        .onTapGesture {
                            self.isEdit = true
                        }
                        
                }
                
                
                
                if tapFlag{
                        WatchCard(tapFlag:$tapFlag)
                        
                }
                
//                VStack{
//                    Spacer()
//                    Button(action: {
//                        UserDefaults.standard.removeObject(forKey: "items")
//                    }, label: {
//                        Text("Clear")
//                    })
//                }
            }
        }
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList().environmentObject(UserData())
    }
}

struct CardForHome: View {
    @EnvironmentObject var user:UserData
    @State var viewState:CGSize = .zero
    @Binding var moveFlag:Bool
    
    var body: some View {
        let reverse = user.unCom.count-1
        
        return
            ForEach(user.unCom.indices,id:\.self){ index in
                Card(item: user.unCom[reverse-index], color: colors[index % colors.count],reverse:reverse,index:index,viewState:$viewState,moveFlag:$moveFlag)
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
            .background(
                Color.clear.blur(radius: moveFlag ? 20 : 0)
            )
            .padding(.top,CGFloat((user.items.count-3) * 20))
        
//        if user.unCom.isEmpty{
//            RoundedRectangle(cornerRadius: 20, style: .continuous)
//        }
    }
}
