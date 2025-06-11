//
//  View+.swift
//  Zone2Be
//
//  Created by kangChangHyeok on 02/06/2025.
//

import SwiftUI

extension View {
    
    func textStyle(_ fontStyle: Font.Style) -> some View {
        modifier(TextStyle(style:fontStyle))
    }
}
