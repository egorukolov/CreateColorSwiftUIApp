//
//  ColorView.swift
//  CreateColorSwiftUIApp
//
//  Created by Egor Ukolov on 28.07.2020.
//  Copyright © 2020 Egor Ukolov. All rights reserved.
//

import SwiftUI

struct ColorView: View {
    
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Color(red: red / 255,
              green: green / 255,
              blue: blue / 255)
            
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.white, lineWidth: 4)
        )
            .frame(height: 130)
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: 100, green: 100, blue: 100)
    }
}
