//
//  SelectBlockView.swift
//  Physicollapse
//
//  Created by zaehorang on 2/12/25.
//

import SwiftUI

struct SelectBlockView: View {
    @State private var selectedBlock: BlockType = .tBlock
    
    private let blockTypes: [BlockType] = BlockType.allCases
    let onSelect: (BlockType) -> Void
    
    private let fixedColumn = [
        GridItem(.flexible(minimum: 10, maximum: .infinity)),
        GridItem(.flexible(minimum: 10, maximum: .infinity))
    ]
    
    var body: some View {
        VStack {
            Text("Select Block")
                .font(.title3)
                .bold()
                .foregroundColor(.black)
                .padding(.bottom, 15)
            
            LazyVGrid(columns: fixedColumn, spacing: 20) {
                ForEach(blockTypes, id: \.self) { blockType in
                    SelectBlockCell(
                        blockType: blockType,
                        isSelected: selectedBlock == blockType
                    ) { selected in
                        selectedBlock = selected // 새로운 블록 선택
                        onSelect(selected) // 외부에 전달
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    SelectBlockView { selectedBlock in
        print("Selected Block:", selectedBlock)
    }
}
