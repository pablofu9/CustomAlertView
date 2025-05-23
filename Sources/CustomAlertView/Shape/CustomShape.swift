//
//  File.swift
//  CustomAlertView
//
//  Created by Pablo Fuertes on 23/5/25.
//

import Foundation
import SwiftUI


struct CutoutTopSemicircleRect: Shape {
    var cornerRadius: CGFloat = 20
    var semicircleRadius: CGFloat = 50

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = rect.width
        let height = rect.height
        let centerX = rect.midX

        // Start at the top-left edge, just after the top-left corner radius
        path.move(to: CGPoint(x: cornerRadius, y: 0))

        // Draw a straight line to just before the semicircle cutout
        path.addLine(to: CGPoint(x: centerX - semicircleRadius, y: 0))

        // Draw a semicircle cutout (inward arc) from left to right
        path.addArc(center: CGPoint(x: centerX, y: 0),
                    radius: semicircleRadius,
                    startAngle: .degrees(180),
                    endAngle: .degrees(0),
                    clockwise: true)

        // Continue the top edge after the cutout up to before the top-right corner

        // Top-right rounded corner
        path.addArc(center: CGPoint(x: width - cornerRadius, y: cornerRadius),
                    radius: cornerRadius,
                    startAngle: .degrees(-90),
                    endAngle: .degrees(0),
                    clockwise: false)

        // Right side line
        path.addLine(to: CGPoint(x: width, y: height - cornerRadius))

        // Bottom-right rounded corner
        path.addArc(center: CGPoint(x: width - cornerRadius, y: height - cornerRadius),
                    radius: cornerRadius,
                    startAngle: .degrees(0),
                    endAngle: .degrees(90),
                    clockwise: false)

        // Bottom side line
        path.addLine(to: CGPoint(x: cornerRadius, y: height))

        // Bottom-left rounded corner
        path.addArc(center: CGPoint(x: cornerRadius, y: height - cornerRadius),
                    radius: cornerRadius,
                    startAngle: .degrees(90),
                    endAngle: .degrees(180),
                    clockwise: false)

        // Left side line
        path.addLine(to: CGPoint(x: 0, y: cornerRadius))

        // Top-left rounded corner
        path.addArc(center: CGPoint(x: cornerRadius, y: cornerRadius),
                    radius: cornerRadius,
                    startAngle: .degrees(180),
                    endAngle: .degrees(270),
                    clockwise: false)

        // Close the path to complete the shape
        path.closeSubpath()

        return path
    }
}

#Preview {
    CutoutTopSemicircleRect(cornerRadius: 20, semicircleRadius: 40)
        .fill(Color.blue)
        .frame(width: 300, height: 200)
        .padding()
}

