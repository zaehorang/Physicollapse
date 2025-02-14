//
//  Keyboard.swift
//  Physicollapse
//
//  Created by zaehorang on 2/14/25.
//

import SwiftUI

struct Keyboard: View {
    let spacing: CGFloat = 3
    
    var body: some View {
        VStack(spacing: spacing) {
            KeyboardButton(.up) {
                print("Up")
            }
            
            HStack(spacing: spacing) {
                KeyboardButton(.left) {
                    print("Left")
                }
                KeyboardButton(.down) {
                    print("Down")
                }
                KeyboardButton(.right) {
                    print("Right")
                }
            }
        }
    }
}

#Preview {
    Keyboard()
}
