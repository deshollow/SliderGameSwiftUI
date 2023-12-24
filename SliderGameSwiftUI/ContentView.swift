//
//  ContentView.swift
//  SliderGameSwiftUI
//
//  Created by deshollow on 24.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var targetValue = Int.random(in: 1..<100)
    @State var showAlert = false
    @State var currentValue = 0
    
    @State private var buttonCounter = 0
    
    
    var body: some View {
        VStack {
            Text("Подвинь слайдер, как можно ближе к: \(targetValue)")
            HStack{
                Text("0")
                UISliderViewRepresentation(value: $currentValue)
                
                Text("100")
            }.padding()
            VStack{
                Button("Проверь меня", systemImage: "person.fill.checkmark") {
                    self.showAlert = true
                    
                } .alert(isPresented: $showAlert) {
                    Alert(title: Text("Твой результат"),
                          message: Text("\(computeScore())"),
                          dismissButton: .default(Text("Ok")))
                }
                .font(.title2)
                .padding()
                Button("Начать заново", systemImage: "trash") {
                    targetValue = Int.random(in: 1..<100)
                    currentValue = 0
                    buttonCounter += 1
                }
                .symbolEffect(.bounce, value: buttonCounter)
                .font(.title2)
            }
        }
        .padding()
    }
    private func computeScore() -> Int {
        var result = 0
        let difference = abs(targetValue - lround(Double(currentValue)))
        let temp = 100 - difference
        result = temp
        return result
    }
}

#Preview {
    ContentView()
}
