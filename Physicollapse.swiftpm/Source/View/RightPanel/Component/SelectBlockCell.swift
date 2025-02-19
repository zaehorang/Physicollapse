//
//  SelectBlockCell.swift
//  Physicollapse
//
//  Created by zaehorang on 2/12/25.
//

import SwiftUI


struct SelectBlockCell: View {
    let blockType: BlockType
    let isSelected: Bool
    var onSelect: (BlockType) -> Void
    
    private var block: Block {
        Block(type: blockType)
    }
    
    var body: some View {
        Button {
            onSelect(blockType)
        } label: {
            GeometryReader { geometry in
                Image(block.cardImageName) // 블록 타입별 이미지
                    .resizable()
                    .scaledToFit()
                    .padding(8)
                    .background(Color(.cardBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 3)
                    )
            }
            .aspectRatio(1, contentMode: .fit)
        }
    }
}


#Preview {
    SelectBlockCell(blockType: .iBlock, isSelected: true) { selectedBlock in
        print("Selected Block:", selectedBlock)
    }
}
