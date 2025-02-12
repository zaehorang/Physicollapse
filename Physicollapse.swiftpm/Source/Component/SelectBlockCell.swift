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
    
    var body: some View {
        Button {
            onSelect(blockType)
        } label: {
            GeometryReader { geometry in
                ZStack {
                    RoundedRectangle(cornerRadius: 10) // ✅ 전체 백그라운드 적용
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: geometry.size.width, height: geometry.size.width) // 정사각형 유지
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 3)
                        )
                    
                    Image(blockType.rawValue) // 블록 타입별 이미지
                        .resizable()
                        .scaledToFit()
                        .padding(8)
                }
            }
            .aspectRatio(1, contentMode: .fit) // ✅ 셀 전체가 정사각형을 유지하도록 설정
        }
    }
}


#Preview {
    SelectBlockCell(blockType: .iBlock, isSelected: true) { selectedBlock in
        print("Selected Block:", selectedBlock)
    }
}
