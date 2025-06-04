//
//  Color+.swift
//  Zone2Be
//
//  Created by kangChangHyeok on 01/06/2025.
//

import SwiftUICore

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
    
    // MARK: - PointColors
    
    static let successGreen = Color(hex: "#28A745")
    static let warningYellow = Color(hex: "#FFC107")
    static let dangerRed = Color(hex: "#DC3545")
    static let brandColor = Color(hex: "#007AFF")
    
    // MARK: - Basic Colors
    
    static let gray1 = Color(hex: "#FAFCFF")
    static let gray2 = Color(hex: "#ECF1F8")
    static let gray3 = Color(hex: "#D6DBE2")
    static let gray4 = Color(hex: "#9FA4A9")
    static let gray5 = Color(hex: "#70767C")
    static let black = Color(hex: "#2C2D2D")
    
}
