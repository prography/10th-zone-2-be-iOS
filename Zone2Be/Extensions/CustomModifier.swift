//
//  CustomModifier.swift
//  Zone2Be
//
//  Created by kangChangHyeok on 02/06/2025.
//

import SwiftUI

struct TextStyle: ViewModifier {
    
    let style: Font.Style
    
    func body(content: Content) -> some View {
        content
            .font(style.font)
            .lineSpacing(style.fontSize * (style.lineHeightPercent - 1))
            .kerning(style.fontSize * style.letterSpacingPercent)
    }
}

