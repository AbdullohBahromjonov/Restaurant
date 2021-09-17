//
//  CategoryButton.swift
//  Rosh restarant
//
//  Created by Abdulloh Bahromjonov on 4/4/21.
//

import SwiftUI

struct CategoryButton: View {
    let geometry: GeometryProxy
    
    @Binding var button1: Bool
    @Binding var button2: Bool
    @Binding var button3: Bool
    @Binding var button4: Bool
    @Binding var foodCategoryTitle: String
    @Binding var categorySelected: [Meal]
    
    var buttonID: Int
    
    var body: some View {
        Button(action: {
            button1 = true
            
            if button1 == true {
                button2 = false
                button3 = false
                button4 = false
                
                foodCategoryTitle = categoryData[buttonID].title
                
                if foodCategoryTitle == "All" {
                    categorySelected = all
                }
                else if foodCategoryTitle == "Pizza" {
                    categorySelected = pizza
                }
                else if foodCategoryTitle == "Burgers" {
                    categorySelected = burgers
                }
                else if foodCategoryTitle == "Deserts" {
                    categorySelected = deserts
                }
                
                
            } else {
                button1 = false
            }
            
            print(categoryData[buttonID].title)
        })
        {
            Rectangle()
                .clipShape(RoundedRectangle(cornerRadius: geometry.size.height/12, style: .continuous))
                .frame(width: geometry.size.width/4.8, height: geometry.size.height/6)
                .foregroundColor(button1 ? Color.orange : Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 15, x: 0, y: 0)
                .overlay(
                    VStack {
                        ZStack {
                            Circle()
                                .frame(height: geometry.size.height/13)
                                .foregroundColor(.white)
                            Circle()
                                .stroke(Color.black.opacity(0.2), style: StrokeStyle(lineWidth: 2))
                                .frame(height: geometry.size.height/13)
                            categoryData[buttonID].image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: geometry.size.height/26)
                            
                        }
                        .offset(y: -geometry.size.height/100)
                        
                        Text(categoryData[buttonID].title)
                            .foregroundColor(.black)
                            .font(.custom("Avenir bold", size: geometry.size.height/50))
                    }
                    
                )
        }
    }
}

