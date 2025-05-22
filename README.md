# 📢 CustomAlertView

A simple, customizable SwiftUI alert component for iOS. Fully configurable title, message, image, button texts, colors, and shadow — all with smooth animations and clean styling.

![Captura de pantalla 2025-05-22 a las 16 31 25](https://github.com/user-attachments/assets/afd0fdc3-7b8f-4a1b-b3b7-c289bb61203e)

---

## ✨ Features

- Custom title, message, and optional image
- Configurable confirm and cancel buttons
- Adjustable colors, shadows, and background dimming
- Smooth scale and fade animations
- Easy integration with SwiftUI `.modifier` style

---

## 🛠 Installation

### Swift Package Manager

Add this line to your `Package.swift` or via **Xcode > Add Package**:

---

## 🧪 Example Usage

```swift
@State private var showAlert = false

var body: some View {
    VStack {
        Button("Show Alert") {
            withAnimation {
                showAlert = true
            }
        }
    }
    .customAlert(
        isPresented: $showAlert,
        image: Image(systemName: "exclamationmark.triangle.fill"),
        title: "Alert Title",
        message: "This is a customizable SwiftUI alert.",
        confirmText: "Confirm",
        cancelText: "Cancel",
        confirmButtonBackground: .green,
        confirmButtonForeground: .white,
        cancelButtonBackground: .gray.opacity(0.2),
        cancelButtonForeground: .black,
        shadowColor: .black.opacity(0.3),
        shadowRadius: 6,
        shadowX: 0,
        shadowY: 4,
        backgroundColor: .black,
        backgroundOpacity: 0.4,
        onConfirm: {
            print("Confirmed")
        },
        onCancel: {
            print("Cancelled")
        }
    )
}
