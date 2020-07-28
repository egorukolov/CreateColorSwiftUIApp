//
//  ColorSlider.swift
//  CreateColorSwiftUIApp
//
//  Created by Egor Ukolov on 28.07.2020.
//  Copyright © 2020 Egor Ukolov. All rights reserved.
//

import SwiftUI

struct ColorSlider: View {
    
    @Binding var sliderValue: Double
    @State var textValue: String
    @State private var showAlert = false
    
    var color: Color
    
    var body: some View {
        HStack {
            SliderValueLabel(value: sliderValue)
            
            Slider(value: $sliderValue, in: 0...255, step: 1) { _ in
                self.textValue = "\(lround(self.sliderValue))"
            }
            .accentColor(color)
            
            SliderValueTF(showAlert: $showAlert,
                          textValue: $textValue,
                          value: $sliderValue)
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
            self.sliderValue = Double(self.textValue) ?? 0
        }
    }
}

struct SliderValueLabel: View {
    
    let value: Double
    
    var body: some View {
        Text("\(lround(value))")
            .frame(width: 35, alignment: .leading)
            .foregroundColor(.white)
    }
}

struct SliderValueTF: View {
    
    @Binding var showAlert: Bool
    @Binding var textValue: String
    @Binding var value: Double
    
    var body: some View {
        
        TextField("", text: $textValue) {
            if let doubleValue = Double(self.textValue) {
                self.value = Double(lround(doubleValue))
            } else {
                self.showAlert = true
            }
        
        }
        .frame(width: 55, alignment: .trailing)
        .multilineTextAlignment(.trailing)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .keyboardType(.decimalPad)
        .alert(isPresented: .constant(showAlert)) {
            Alert(
                title: Text("Wrong Format"),
                message: Text("Please enter value from 0 to 255"),
                dismissButton: .cancel {
                    self.textValue = ""
                }
            )
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(sliderValue: .constant(100), textValue: "100", color: .red)
    }
}
