//
//  KeyboardDirection.swift
//  Physicollapse
//
//  Created by zaehorang on 2/14/25.
//

import SwiftUICore

enum KeyboardDirection {
    case up, down, left, right
    
    var rotationAngle: Angle {
        switch self {
        case .up: return .degrees(0)
        case .down: return .degrees(180)
        case .left: return .degrees(-90)
        case .right: return .degrees(90)
        }
    }
}
