//
//  MealView.swift
//  Rosh restarant
//
//  Created by Abdulloh Bahromjonov on 4/4/21.
//

import SwiftUI
import UIKit

struct MealView: View {
    var meal: Meal
    
    @State private var presented = false
    
    var body: some View {
        
        Button(action: {
            presented = true
            
        }) {
            ZStack {
                Rectangle()
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .frame(width: 200, height: 250)
                    .foregroundColor(Color(#colorLiteral(red: 0.9568627451, green: 0.9725490196, blue: 0.9882352941, alpha: 0.7047035531)))
                
                VStack {
                    HStack(alignment: .center, spacing: 6) {
                        Image(uiImage: #imageLiteral(resourceName: "calories"))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 18)
                        
                        Text("\(meal.calories) Calories")
                            .font(.custom("Avenir", size: 12))
                            .foregroundColor(.black)
                        
                        Spacer()
                            .frame(width: 40)
                        
                        Image(systemName: "heart.fill")
                            .foregroundColor(.gray)
                        
                    }
                    
                    
                    meal.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(height: 120)
                    
                    VStack(alignment: .leading) {
                        Text(meal.title)
                            .font(.custom("Avenir", size: 16))
                            .fontWeight(.black)
                            .foregroundColor(.black)
                        
                        Text(meal.description)
                            .font(.custom("Avenir", size: 14))
                            .lineLimit(1)
                            .foregroundColor(.black)
                        
                        Text(meal.price)
                            .font(.custom("Avenir", size: 18))
                            .fontWeight(.black)
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal, 20)
                    
                }
                
                
                
                
            }
            .frame(width: 200, height: 250)
            .fullScreenCover(isPresented: $presented) {
                DetailView(isPresented: $presented, image: meal.image, title: meal.title, description: meal.description, price: meal.price)
            }
        }
       
    }
}


struct MealView_Previews: PreviewProvider {
    
    static var previews: some View {
        MealView(meal: pizza[0])
    }
}
