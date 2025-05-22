//
//  File.swift
//  CustomAlertView
//
//  Created by Pablo Fuertes on 22/5/25.
//

import Foundation
import SwiftUI

// MARK: - Extension for convenience

public extension View {
    func customAlert(
        isPresented: Binding<Bool>,
        image: Image? = nil,
        title: String? = nil,
        message: String,
        confirmText: String,
        cancelText: String? = nil,
        confirmButtonBackground: Color = .blue,
        confirmButtonForeground: Color = .white,
        cancelButtonBackground: Color = Color.gray.opacity(0.3),
        cancelButtonForeground: Color = .black,
        shadowColor: Color = .black.opacity(0.3),
        shadowRadius: CGFloat = 8,
        shadowX: CGFloat = 0,
        shadowY: CGFloat = 4,
        backgroundColor: Color = .black,
        backgroundOpacity: Double = 0.3,
        onConfirm: @escaping () -> Void,
        onCancel: (() -> Void)? = nil
    ) -> some View {
        self.modifier(CustomAlertModifier(
            isPresented: isPresented,
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
            onConfirm: onConfirm,
            onCancel: onCancel
        ))
    }
}
