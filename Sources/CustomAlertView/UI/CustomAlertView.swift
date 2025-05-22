//
//  File.swift
//  CustomAlertView
//
//  Created by Pablo Fuertes on 22/5/25.
//

import Foundation
import SwiftUI

public struct CustomAlertView: View {
    
    // Optional image shown at the top of the alert
    let image: Image?
    
    // Title
    let title: String?
    
    // Alert message text
    let message: String
    
    // Button texts
    let confirmText: String
    let cancelText: String?
    
    // Button colors
    let confirmButtonBackground: Color
    let confirmButtonForeground: Color
    let cancelButtonBackground: Color
    let cancelButtonForeground: Color
    
    // Shadow
    let shadowColor: Color
    let shadowRadius: CGFloat
    let shadowX: CGFloat
    let shadowY: CGFloat
    
    // Background
    let backgroundColor: Color
    let backgroundOpacity: Double
    
    // Button actions
    let onConfirm: () -> Void
    let onCancel: (() -> Void)?
    
    // Binding to control alert visibility
    @Binding var isShowing: Bool
    
    // Animation states
    @State private var scaleEffect: CGFloat = 0.7
    @State private var opacity: Double = 0
    
    // Public initializer
    public init(
        image: Image? = nil,
        title: String? = nil,
        message: String,
        confirmText: String,
        cancelText: String? = nil,
        confirmButtonBackground: Color = .blue,
        confirmButtonForeground: Color = .white,
        cancelButtonBackground: Color = Color.gray.opacity(0.3),
        cancelButtonForeground: Color = .black,
        shadowColor: Color = .black,
        shadowRadius: CGFloat = 4,
        shadowX: CGFloat = 0,
        shadowY: CGFloat = 4,
        backgroundColor: Color = .black,
        backgroundOpacity: Double = 0.3,
        isShowing: Binding<Bool>,
        onConfirm: @escaping () -> Void,
        onCancel: (() -> Void)? = nil
    ) {
        self.image = image
        self.title = title
        self.message = message
        self.confirmText = confirmText
        self.cancelText = cancelText
        self.confirmButtonBackground = confirmButtonBackground
        self.confirmButtonForeground = confirmButtonForeground
        self.cancelButtonBackground = cancelButtonBackground
        self.cancelButtonForeground = cancelButtonForeground
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.shadowX = shadowX
        self.shadowY = shadowY
        self.backgroundColor = backgroundColor
        self.backgroundOpacity = backgroundOpacity
        self._isShowing = isShowing
        self.onConfirm = onConfirm
        self.onCancel = onCancel
    }
    
    public var body: some View {
        if isShowing {
            ZStack {
                // Dimmed background with tap to dismiss
                backgroundColor.opacity(backgroundOpacity)
                    .edgesIgnoringSafeArea(.all)
                    .transition(.opacity)
                    .onTapGesture {
                        withAnimation { dismiss() }
                    }
                
                alertContent
                    .scaleEffect(scaleEffect)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
                            self.scaleEffect = 1
                            self.opacity = 1
                        }
                    }
            }
            .animation(.easeInOut, value: isShowing)
            .transition(.opacity)
        }
    }
}

// MARK: - EXTENSION
extension CustomAlertView {
    
    // Main alert UI
       private var alertContent: some View {
           VStack(spacing: 20) {
               if let image = image {
                   image
                       .resizable()
                       .scaledToFit()
                       .frame(width: 80, height: 80)
               }
               VStack(spacing: 6) {
                   if let title {
                       Text(title)
                           .multilineTextAlignment(.center)
                           .padding(.horizontal, 20)
                           .font(.body.bold())
                           .fixedSize(horizontal: false, vertical: true)
                   }
                   Text(message)
                       .multilineTextAlignment(.center)
                       .padding(.horizontal, 20)
                       .fixedSize(horizontal: false, vertical: true)
               }
               HStack(spacing: 16) {
                   if let cancel = cancelText {
                       Button(cancel) {
                           withAnimation { dismiss() }
                           onCancel?()
                       }
                       .buttonStyle(AlertButtonStyle(background: cancelButtonBackground, foreground: cancelButtonForeground))
                   }
                   
                   Button(confirmText) {
                       withAnimation { dismiss() }
                       onConfirm()
                   }
                   .buttonStyle(AlertButtonStyle(background: confirmButtonBackground, foreground: confirmButtonForeground))
               }
               .padding(.horizontal, 20)
           }
           .padding()
           .background(Color.white)
           .cornerRadius(15)
           .frame(maxWidth: 300)
           .shadow(color: shadowColor, radius: shadowRadius, x: shadowX, y: shadowY)
       }
       
       // Alert dismiss animation
       private func dismiss() {
           withAnimation(.easeInOut(duration: 0.2)) {
               self.opacity = 0
               self.scaleEffect = 0.7
           }
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
               self.isShowing = false
           }
       }
}

struct CustomAlertView_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State private var showAlert = false
        
        var body: some View {
            VStack {
                Button("Show Alert") {
                    withAnimation { showAlert = true }
                }
            }
            .customAlert(
                isPresented: $showAlert,
                image: Image(systemName: "exclamationmark.triangle.fill"),
                title: "Este es el título",
                message: "This is a customizable SwiftUI alert.",
                confirmText: "Yes",
                cancelText: "No",
                confirmButtonBackground: .green,
                confirmButtonForeground: .white,
                cancelButtonBackground: .red.opacity(0.2),
                cancelButtonForeground: .red,
                shadowColor: .black.opacity(0.4),
                shadowRadius: 8,
                shadowX: 3,
                shadowY: 3,
                backgroundColor: .blue,
                backgroundOpacity: 0.3,
                onConfirm: {
                    print("Confirmed")
                },
                onCancel: {
                    print("Cancelled")
                }
            )
        }
    }
    
    static var previews: some View {
        PreviewWrapper()
    }
}
