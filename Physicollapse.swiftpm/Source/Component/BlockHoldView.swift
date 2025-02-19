//
//  BlockHoldView.swift
//  Physicollapse
//
//  Created by zaehorang on 2/12/25.
//

import SwiftUI

struct BlockHoldView: View {
    var blockType: BlockType
    
    private var block: Block {
        Block(type: blockType)
    }

    var body: some View {
        VStack(spacing: 3) {
            Text("Hold")
                .font(.title3)
                .bold()

            Image(block.cardImageName)
                .resizable()
                .scaledToFit()
                .padding()
        }
        .padding(.top)
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.8))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .black.opacity(0.1), radius: 5)
        .padding()
    }
}

#Preview {
    BlockHoldView(blockType: .tBlock)
}
