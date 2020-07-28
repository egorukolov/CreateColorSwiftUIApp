//
//  ContentView.swift
//  CreateColorSwiftUIApp
//
//  Created by Egor Ukolov on 24.07.2020.
//  Copyright © 2020 Egor Ukolov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var red = Double.random(in: 0...255)
    @State private var green = Double.random(in: 0...255)
    @State private var blue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0, green: 0.3765624762, blue: 0.7304599881, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                ColorView(red: red, green: green, blue: blue)
                
                VStack {
                    
                    ColorSlider(sliderValue: $red,
                                textValue: "\(lround(red))",
                                color: .red)
                    
                    ColorSlider(sliderValue: $green,
                                textValue: "\(lround(green))",
                                color: .green)
                    
                    ColorSlider(sliderValue: $blue,
                                textValue: "\(lround(blue))",
                                color: .blue)
                    
            }.frame(height: 150)
                 }
                .padding()
                
                Spacer()
            }
        }
        .onTapGesture {
        UIApplication.shared.endEditing()
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

