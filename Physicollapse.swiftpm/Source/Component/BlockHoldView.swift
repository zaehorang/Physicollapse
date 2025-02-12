//
//  BlockHoldView.swift
//  Physicollapse
//
//  Created by zaehorang on 2/12/25.
//

import SwiftUI

struct BlockHoldView: View {
    var block: BlockType

    var body: some View {
        VStack(spacing: 10) {
            Text("Hold")
                .font(.title)
                .bold()

            Image(block.rawValue)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80) // 블록 크기
                .padding()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.8))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .black.opacity(0.1), radius: 5)
    }
}

#Preview {
    BlockHoldView(block: .tBlock)
}
