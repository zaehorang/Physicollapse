//
//  BlockHoldView.swift
//  Physicollapse
//
//  Created by zaehorang on 2/12/25.
//

import SwiftUI

struct BlockHoldView: View {
    var blockType: BlockType
    @Binding var rotationAngle: Angle
    
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
                .rotationEffect(rotationAngle)
            
            Button{
                withAnimation(.easeInOut(duration: 0.3)) {
                    rotationAngle -= Angle(degrees: 90)
                }
            } label: {
                Image(systemName: "arrow.counterclockwise")
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
                    .padding(.bottom, 5)
            }
        }
        .padding(.top)
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.7))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .black.opacity(0.1), radius: 5)
        .padding(.horizontal)
    }
}

#Preview {
    BlockHoldView(blockType: .tBlock, rotationAngle: .constant(.zero))
}
