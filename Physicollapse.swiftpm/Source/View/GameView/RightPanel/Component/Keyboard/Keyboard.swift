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
        HStack(alignment: .bottom, spacing: spacing) {
            KeyboardButton(.left, action: onLeft)
            
            // 아래 키보드와 같은 사이즈 잡기
            VStack(spacing: spacing) {
                KeyboardButton(.up, action: onUp)
                KeyboardButton(.down, action: onDown)
            }
            
            KeyboardButton(.right, action: onRight)
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
