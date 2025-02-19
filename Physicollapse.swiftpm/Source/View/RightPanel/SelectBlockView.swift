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
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white.opacity(0.8))
                    .frame(height: 60) // 고정된 높이 유지
                    .shadow(color: .black.opacity(0.1), radius: 5)
                
                Text("Select Block")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.black)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray, lineWidth: 2)
            )
            
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
