//
//  Button.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 12/7/24.
//

import SwiftUI

struct CustomButton: View{
    let title: String
    let backgroundColor: Color
    let textColor: Color
    let action: ()-> Void
    
    var body: some View{
        Button(action: action){
            Text(title)
                .font(.headline)
                .foregroundColor(textColor)
                .padding()
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .cornerRadius(8)
        }
    }
}
