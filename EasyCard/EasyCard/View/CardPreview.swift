//
//  CardPreview.swift
//  EasyCard
//
//  Created by 史雅楠 on 2021/4/16.
//

import SwiftUI

struct CardPreview: View {
    @Binding var title:String
    @Binding var imageName:String
    @Binding var iconName:String
    @Binding var time:Date
    @Binding var color:Color
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10.0){
                    Text(title)
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(Color.white)
                        .lineLimit(2)
                        .font(.caption)
                    Text(formatter.string(from: time))
                        .font(.caption)
                }
                Spacer()
                Image(iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
            }
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 100)
            
        }
        .padding(.horizontal)
        .frame(width: 300, height: 180)
        .background(color)
        .cornerRadius(25)
    }
}

//struct CardPreview_Previews: PreviewProvider {
//    static var previews: some View {
//        CardPreview()
//    }
//}
