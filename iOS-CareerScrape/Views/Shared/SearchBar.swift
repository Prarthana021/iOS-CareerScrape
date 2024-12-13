//
//  SearchBar.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 12/12/24.
//
import SwiftUI

struct SearchBar: View{
    @Binding var text:String
    var placeholder: String
    
    var body: some View{
        HStack{
            Image(systemName: "magnifyingglass").foregroundStyle(.black)
            TextField(placeholder, text: $text).textFieldStyle(PlainTextFieldStyle())
                .padding(8)
            
        }.background(Color(.systemGray6))
            .cornerRadius(8)
        
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Example"), placeholder: "search")

    }
}
