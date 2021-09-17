//
//  QuantityButton.swift
//  Rosh restarant
//
//  Created by Abdulloh Bahromjonov on 3/24/21.
//

import SwiftUI

struct QuantityButton: View {
    var bounds: GeometryProxy
    @Binding var quantity: Int
    var sign: String
    
    var body: some View {
        Button(action: {
            if sign == "plus.circle" {
                quantity += 1
            }
            else if sign == "minus.circle" {
                if quantity > 1 {
                    quantity -= 1
                }
            }
            
        }){
            Image(systemName: sign)
                .font(.system(size: bounds.size.width/10, weight: .light))
                .foregroundColor(Color(#colorLiteral(red: 0.5646018401, green: 0.5646018401, blue: 0.5646018401, alpha: 1)))
        }
    }
}



