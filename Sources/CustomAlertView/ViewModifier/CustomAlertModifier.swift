//
//  CustomAlertModifier.swift
//  CustomAlertView
//
//  Created by Pablo Fuertes on 22/5/25.
//

import SwiftUI

// MARK: - Modifier for simpler use

public struct CustomAlertModifier: ViewModifier {
    
    @Binding var isPresented: Bool
    let image: Image?
    let title: String?
    let message: String
    let confirmText: String
    let cancelText: String?
    let confirmButtonBackground: Color
    let confirmButtonForeground: Color
    let cancelButtonBackground: Color
    let cancelButtonForeground: Color
    let shadowColor: Color
    let shadowRadius: CGFloat
    let shadowX: CGFloat
    let shadowY: CGFloat
    let backgroundColor: Color
    let backgroundOpacity: Double
    let onConfirm: () -> Void
    let onCancel: (() -> Void)?
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            CustomAlertView(
                image: image,
                title: title,
                message: message,
                confirmText: confirmText,
                cancelText: cancelText,
                confirmButtonBackground: confirmButtonBackground,
                confirmButtonForeground: confirmButtonForeground,
                cancelButtonBackground: cancelButtonBackground,
                cancelButtonForeground: cancelButtonForeground,
                shadowColor: shadowColor,
                shadowRadius: shadowRadius,
                shadowX: shadowX,
                shadowY: shadowY,
                backgroundColor: backgroundColor,
                backgroundOpacity: backgroundOpacity,
                isShowing: $isPresented,
                onConfirm: onConfirm,
                onCancel: onCancel
            )
        }
    }
}

