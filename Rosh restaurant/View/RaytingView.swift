//
//  RaytingView.swift
//  Rosh restarant
//
//  Created by Abdulloh Bahromjonov on 3/23/21.
//

import SwiftUI

struct RaytingView: View {
    var bounds: GeometryProxy
        
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .frame(width: bounds.size.width/3.5, height: bounds.size.height/22)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 7)
            Image(uiImage: #imageLiteral(resourceName: "person2"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: bounds.size.width/17, height: bounds.size.height/32)
                .overlay(
                    Image(uiImage: #imageLiteral(resourceName: "person1"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: bounds.size.width/17, height: bounds.size.height/32)
                        .offset(x: -13)
                )
                .offset(x: bounds.size.width/(-16))
            Text("4.9")
                .offset(x: 8)
                .foregroundColor(.black)
            Image(uiImage: #imageLiteral(resourceName: "star"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: bounds.size.width/20, height: bounds.size.height/40)
                .offset(x: 40)
        }
    }
}

