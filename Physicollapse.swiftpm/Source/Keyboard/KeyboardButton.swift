//
//  KeyboardButton.swift
//  Physicollapse
//
//  Created by zaehorang on 2/14/25.
//

import SwiftUI

struct KeyboardButton: View {
    let direction: KeyboardDirection
    let action: () -> Void
    
    let cornerRadius: CGFloat = 9
    let lineWidth: CGFloat = 2
    let lineColor: Color = .black.opacity(0.53)
    
    // MARK: - init Method
    init(_ direction: KeyboardDirection, action: @escaping () -> Void) {
        self.direction = direction
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            buttonShape()
                .overlay(alignment: .top) {
                    directionIndicator()
                }
        }
        .rotationEffect(direction.rotationAngle)
    }
    
    // MARK: - View Property
    
    /// 버튼의 기본 사각형 모양
    private func buttonShape() -> some View {
        Rectangle()
            .frame(width: 44, height: 42)
            .foregroundStyle(.white)
            .clipShape(
                RoundedRectangle(cornerRadius: 9)
            )
            .overlay {
                RoundedRectangle(cornerRadius: 9)
                    .stroke(lineColor, lineWidth: 2)
            }
    }
    
    /// 방향을 나타내는 작은 사각형 (위쪽에 위치)
    private func directionIndicator() -> some View {
        Rectangle()
            .frame(width: 2, height: 7)
            .foregroundStyle(lineColor)
            .padding(.top, 3)
    }
}

#Preview {
    VStack(spacing: 20) {
        KeyboardButton(.up) {
            print("⬆️ Up button tapped")
        }
        KeyboardButton(.down) {
            print("⬇️ Down button tapped")
        }
        KeyboardButton(.left) {
            print("⬅️ Left button tapped")
        }
        KeyboardButton(.right) {
            print("➡️ Right button tapped")
        }
    }
}
