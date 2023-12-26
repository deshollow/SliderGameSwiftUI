//
//  UISliderViewRepresentation.swift
//  SliderGameSwiftUI
//
//  Created by deshollow on 24.12.2023.
//

import SwiftUI

struct UISliderViewRepresentation: UIViewRepresentable {
    
    @Binding var value: Int
    
    let alpha: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
    
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(context.coordinator,
                         action:#selector(Coordinator.didChooseValue),
                         for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = .red.withAlphaComponent(CGFloat(alpha) / 100)
        
    }
    
    //typealias UIViewType = UISlider
}

extension UISliderViewRepresentation {
    class Coordinator: NSObject {
        @Binding var value: Int
        
        init(value: Binding<Int>) {
            self._value = value
        }
        
        @objc func didChooseValue(_ sender: UISlider) {
            value = Int(sender.value)
        }
    }
}

#Preview {
    UISliderViewRepresentation(value: .constant(50), alpha: 2)
}
