//
//  MenueView.swift
//  Rosh restarant
//
//  Created by Abdulloh Bahromjonov on 3/27/21.
//

import SwiftUI

struct MenueView: View {
    @State var allPressed = true
    @State var pizzaPressed = false
    @State var burgersPressed = false
    @State var asianPressed = false
    @State var foodCategoryTitle = "All"
    @State var category = all
    @State var text = ""
    @State var show = false
    
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Spacer()
                        .frame(height: geometry.size.height/20)
                    
                    HStack {
                        Spacer()
                        
                    }
                    .frame(width: .infinity)
                    
                    VStack(alignment: .leading) {
                        
                        HStack {
                            if !self.show {
                                Text("Rosh")
                                    .font(.system(size: geometry.size.width/16, weight: .medium))
                                    .foregroundColor(Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)))
                                    
                                Text("restaurant")
                                    .font(.system(size: geometry.size.width/18, weight: .light))
                            }
                            
                            Spacer(minLength: 0)
                            
                            SearchBar(text: $text, show: $show)
                        }
                        
                        Text("Special For You")
                            .font(.custom("Avenir Next Medium", size: geometry.size.width/14))
                    }
                    
                   
                    
                    HStack {
                        CategoryButton(geometry: geometry, button1: $allPressed, button2: $pizzaPressed, button3: $burgersPressed, button4: $asianPressed, foodCategoryTitle: $foodCategoryTitle, categorySelected: $category, buttonID: 0)
                        CategoryButton(geometry: geometry, button1: $pizzaPressed, button2: $allPressed, button3: $burgersPressed, button4: $asianPressed, foodCategoryTitle: $foodCategoryTitle, categorySelected: $category, buttonID: 1)
                        CategoryButton(geometry: geometry, button1: $burgersPressed, button2: $allPressed, button3: $pizzaPressed, button4: $asianPressed, foodCategoryTitle: $foodCategoryTitle, categorySelected: $category, buttonID: 2)
                        CategoryButton(geometry: geometry, button1: $asianPressed, button2: $allPressed, button3: $pizzaPressed, button4: $burgersPressed, foodCategoryTitle: $foodCategoryTitle, categorySelected: $category, buttonID: 3)
                    }
                    
                    
                    Text(foodCategoryTitle)
                        .font(.custom("Avenir", size: 18))
                        .fontWeight(.medium)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            
                            ForEach(category.filter({"\($0)".contains(text) || text.isEmpty})) { item in
                                MealView(meal: item)
                                
                            }

                        }
                    }
                    
                    
                    Text("Popular")
                        .font(.custom("Avenir", size: 18))
                        .fontWeight(.medium)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(pizza) { item in
                                MealView(meal: item)
                            }
                        }
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .padding(.leading, 2)
            }
        }
    }
}

struct MenueView_Previews: PreviewProvider {
    @State static var pressed = false
    
    static var previews: some View {
        MenueView()
    }
}
