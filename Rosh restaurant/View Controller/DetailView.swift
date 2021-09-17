//
//  Content.swift
//  Rosh restarant
//
//  Created by Abdulloh Bahromjonov on 3/22/21.
//

import SwiftUI

struct DetailView: View {
    @State var quantity = 1
    
    @Binding var isPresented: Bool
    
    var image: Image
    var title: String
    var description: String
    var price: String
    
    var body: some View {
        
        GeometryReader { bounds in
            VStack {
                
                HStack {
                    Button(action: {
                        isPresented = false
                    }){
                        Image(uiImage: #imageLiteral(resourceName: "arrow_left"))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: bounds.size.width/17)
                            
                    }
                    .offset(y: bounds.size.height/15)
                    .padding(.leading, 15)
                    
                    ZStack {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: bounds.size.width/1.2, height: bounds.size.height/2.3)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white, style: StrokeStyle(lineWidth: 10))
                                    .frame(width: bounds.size.width/1.2, height: bounds.size.height/2.3)
                                    
                            )
                            .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
                    }
                    .frame(height: 0)
                    .offset(x: bounds.size.width/3.5, y: bounds.size.height/6)
                }
                
                
                Spacer()
                
                HStack {
                    LikeButton()
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.bottom, bounds.size.height/35)
                
                HStack {
                    RaytingView(bounds: bounds)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 30)
                
                Spacer()
                    .frame(height: bounds.size.height/20)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .font(.custom("Avenir", size: bounds.size.width/18))
                        .padding(.bottom, 30)
                    
                    Text(description)
                        .fontWeight(.light)
                        .foregroundColor(.black)
                        .font(.custom("Avenir", size: bounds.size.width/26.4))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding(.horizontal, 30)
                .frame(alignment: .center)
                    
                Spacer()
                    .frame(height: bounds.size.height/16)
                
                VStack(alignment: .leading) {
                    Text("Quantity")
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .font(.custom("Avenir", size: bounds.size.width/18))
                    
                    HStack {
                        QuantityButton(bounds: bounds, quantity: $quantity, sign: "minus.circle")
                        QuantityButton(bounds: bounds, quantity: $quantity, sign: "plus.circle")
                        
                        Text("\(quantity)")
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .font(.custom("Avenir", size: bounds.size.width/16.5))
                            .padding(.leading, 15)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                }
                .padding(.horizontal, 30)
                
                Spacer()
                    .frame(height: bounds.size.height/6)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Price")
                            .font(.custom("Avenir", size: bounds.size.width/23))
                            .foregroundColor(.gray)
                        
                        Text(price)
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .font(.custom("Avenir", size: bounds.size.width/16.5))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }){
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color.black)
                                .clipShape(RoundedRectangle(cornerRadius: bounds.size.height/25))
                                .frame(width: bounds.size.width/4, height: bounds.size.height/14)
                                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
                            
                            Image(systemName: "bag.circle")
                                .font(.system(size: bounds.size.height/20, weight: .light))
                                .foregroundColor(.white)
                                .background(Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)))
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            
                        }
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
                .edgesIgnoringSafeArea(.top)
                .frame(alignment: .bottom)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(#colorLiteral(red: 0.9729209397, green: 1, blue: 0.9132303108, alpha: 0.09556934932)))
            .edgesIgnoringSafeArea(.all)
        }
         
        
    }
}



struct DetailView_Previews: PreviewProvider {
    
    @State static var presented = true
    
    static var previews: some View {
        DetailView(isPresented: $presented, image: pizza[0].image, title: pizza[0].title, description: pizza[0].description, price: pizza[0].price)
    }
}
