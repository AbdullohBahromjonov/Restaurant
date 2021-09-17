//
//  SearchBar.swift
//  Rosh restarant
//
//  Created by Abdulloh Bahromjonov on 4/18/21.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var show: Bool
    
    var body: some View {
        HStack {
            if show {
                Image(systemName: "magnifyingglass")
                    .padding(.horizontal, 8)
                    .foregroundColor(.gray)
                
                TextField("Search Food...", text: $text)
                
                Button(action: {
                    withAnimation {
                        self.text = ""
                        self.show.toggle()
                    }
                    
                }){
                    Image(systemName: "xmark.circle")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 8)
            }
            else {
                Button(action: {
                    withAnimation{
                        self.show.toggle()
                    }
                }){
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(10)
                }
            }
        }
        .padding(self.show ? 10 : 0)
        .background(Color(.systemGray6))
        .cornerRadius(20)
    }
}

struct SearchBar_Previews: PreviewProvider {
    @State static var text = ""
    @State static var show = false
    
    static var previews: some View {
        SearchBar(text: $text, show: $show)
    }
}
