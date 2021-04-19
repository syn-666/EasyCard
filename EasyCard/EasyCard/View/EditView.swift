//
//  EditView.swift
//  EasyCard
//
//  Created by 史雅楠 on 2021/4/16.
//

import SwiftUI

struct EditView: View {
    @State var title = ""
    @State var imageName = "Card1"
    @State var iconName = "Logo1"
    @State var time = Date()
    @State var color = Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
    @State var empty:Bool = false
    @Binding var tapFlag:Bool
    @EnvironmentObject var user:UserData
    
    func add(){
        
        user.items.append(Item(title: title, isDone: false, background: imageName, time: formatter.string(from: time), icon: iconName))
        self.tapFlag = false
        
    }
    
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Button(action: {self.tapFlag = false}, label: {
                    Text("取消")
                })
                Spacer()
                Button(action: {
                    if !title.isEmpty{
                        self.add()
                    }else{
                        self.empty = true
                    }
                }, label: {
                    Text("完成")
                })
            }
            .alert(isPresented: $empty, content: {
                Alert(title: Text("Error"), message: Text("事件不能为空"), dismissButton: .cancel())
            })
            .padding(.horizontal)
            .padding(.top)
            List{
                HStack{
                    Text("事件")
                        .bold()
                    TextField("请输入事件", text: $title)
                        .frame(width: 230, height: 40)
                        .frame(width: 245, height: 40)
                        .foregroundColor(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
                        )
                }
                .padding(.horizontal)
                VStack{
                    HStack {
                        Text("背景")
                            .bold()
                        Spacer()
                    }
                    Picker("背景", selection: $imageName) {
                        ForEach(images,id:\.self) { image in
                            Image(image).tag(image)
                                .background(Color.white)
                        }
                    }
                    .pickerStyle(InlinePickerStyle())
                }.padding(.horizontal)
                HStack{
                    DatePicker(selection: $time, label: { Text("时间").bold() })
                }
                .padding(.horizontal)
                VStack{
                    ColorPicker(selection: $color, label: {
                        Text("颜色")
                            .bold()
                    })
                        
                }.padding(.horizontal)
                //logo选择
                VStack{
                    HStack {
                        Text("Logo")
                            .bold()
                        Spacer()
                    }
                    Picker("Logo", selection: $iconName) {
                        ForEach(icons,id:\.self) { icon in
                            Image(icon).tag(icon)
                                .background(Color.white)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                .padding(.horizontal)
                
            }
            .listStyle(InsetListStyle())
            .frame(maxHeight:550)
            
            Divider()
            CardPreview(title: $title, imageName: $imageName, iconName: $iconName, time: $time, color: $color)
                .offset(x: (bounds.width-300)/2)
            
            Spacer()
        }.onTapGesture {
            hideKeyboard()
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(tapFlag: .constant(true))
    }
}


