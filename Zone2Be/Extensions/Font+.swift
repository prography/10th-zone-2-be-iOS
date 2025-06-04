//
//  Font+.swift
//  Zone2Be
//
//  Created by kangChangHyeok on 29/05/2025.
//

import SwiftUICore

extension Font {
    
    enum Style {
        case h1, h2, h3, p1, p2, p3

            var font: Font {
                switch self {
                case .h1: return .pretendard(.bold, size: 24)
                case .h2: return .pretendard(.semibold, size: 20)
                case .h3: return .pretendard(.medium, size: 18)
                case .p1: return .pretendard(.regular, size: 16)
                case .p2: return .pretendard(.regular, size: 14)
                case .p3: return .pretendard(.light, size: 12)
                }
            }

            var fontSize: CGFloat {
                switch self {
                case .h1: return 24
                case .h2: return 20
                case .h3: return 18
                case .p1: return 16
                case .p2: return 14
                case .p3: return 12
                }
            }

            var lineHeightPercent: CGFloat {
                switch self {
                case .h1: return 1.3
                case .h2: return 1.25
                case .h3: return 1.2
                case .p1: return 1.5
                case .p2: return 1.5
                case .p3: return 1.4
                }
            }

            var letterSpacingPercent: CGFloat {
                switch self {
                case .h1: return -0.02
                case .h2: return -0.015
                case .h3: return -0.01
                case .p1: return 0.0
                case .p2: return 0.005
                case .p3: return 0.01
                }
            }
    }
    
    enum PretendardWeight {
        case black
        case bold
        case heavy
        case ultraLight
        case light
        case medium
        case regular
        case semibold
        case thin
        
        var value: String {
            switch self {
            case .black:
                return "Black"
            case .bold:
                return "Bold"
            case .heavy:
                return "ExtraBold"
            case .ultraLight:
                return "ExtraLight"
            case .light:
                return "Light"
            case .medium:
                return "Medium"
            case .regular:
                return "Regular"
            case .semibold:
                return "SemiBold"
            case .thin:
                return "Thin"
            }
        }
    }

    static func pretendard(_ weight: PretendardWeight, size fontSize: CGFloat) -> Font {
        let weightString = weight.value
        return Font.custom("Pretendard-\(weightString)", size: fontSize)
    }
    
    static func rota(_ weight: PretendardWeight, size fontSize: CGFloat) -> Font {
        let weightString = weight.value
        return Font.custom("Rota-\(weightString)", size: fontSize)
    }
    
    static func fontWeight(_ number: Int) -> PretendardWeight {
        switch number {
        case 100: return .ultraLight
        case 200: return .thin
        case 300: return .light
        case 400: return .regular
        case 500: return .medium
        case 600: return .semibold
        case 700: return .bold
        case 800: return .heavy
        case 900: return .black
        default: return .regular
        }
    }
}
