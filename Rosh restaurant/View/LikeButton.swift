//
//  LikeButton.swift
//  Rosh restarant
//
//  Created by Abdulloh Bahromjonov on 3/23/21.
//

import SwiftUI

struct LikeButton: View {
    @State var press = false
    
    var body: some View {
        
        Button(action: {
            press.toggle()
        }){
            ZStack {
                Image(systemName: "heart.fill")
                    .font(.system(size: 25))
                    .foregroundColor(press ? .red : .gray)
            }
            .frame(width: 40, height: 40)
            .background(
                ZStack {
                    Color(press ? #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
                    
                    Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
                    
                    Circle()
                        .foregroundColor(Color(press ? #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                        .blur(radius: 4)
                        .offset(x: -8, y: -8)
                    
                    Circle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .padding(2)
                        .blur(radius: 2)
                }
            )
            .clipShape(Circle())
            .shadow(color: Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1985231164)), radius: 10, x: 10, y: 10)
            .shadow(color: Color(press ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1993257705) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 10, x: -10, y: -10)
            
        }
    }
}

struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeButton()
    }
}
