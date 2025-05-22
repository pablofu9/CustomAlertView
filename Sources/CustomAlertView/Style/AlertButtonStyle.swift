//
//  AlertButtonStyle.swift
//  CustomAlertView
//
//  Created by Pablo Fuertes on 22/5/25.
//

import Foundation
import SwiftUI

struct AlertButtonStyle: ButtonStyle {
    let background: Color
    let foreground: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .background(background.opacity(configuration.isPressed ? 0.6 : 1))
            .foregroundColor(foreground)
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
