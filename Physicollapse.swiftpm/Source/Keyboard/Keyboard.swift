//
//  Keyboard.swift
//  Physicollapse
//
//  Created by zaehorang on 2/14/25.
//

import SwiftUI

struct Keyboard: View {
    let spacing: CGFloat = 3
    
    let onUp: () -> Void
    let onDown: () -> Void
    let onLeft: () -> Void
    let onRight: () -> Void
    
    var body: some View {
        VStack(spacing: spacing) {
            KeyboardButton(.up, action: onUp)
            
            HStack(spacing: spacing) {
                KeyboardButton(.left, action: onLeft)
                KeyboardButton(.down, action: onDown)
                KeyboardButton(.right, action: onRight)
            }
        }
    }
}

#Preview {
    Keyboard(
        onUp: { print("⬆️ Up button pressed") },
        onDown: { print("⬇️ Down button pressed") },
        onLeft: { print("⬅️ Left button pressed") },
        onRight: { print("➡️ Right button pressed") }
    )
}
