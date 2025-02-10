//
//  Block.swift
//  Physicollapse
//
//  Created by zaehorang on 2/10/25.
//

import Foundation

enum BlockType {
    // TODO: 더 추가 예정
    case tBlock, oBlock
}

struct Block {
    let type: BlockType
    let size: CGSize
    let imageName: String
    
    init(type: BlockType) {
        self.type = type
        
        switch type {
        case .tBlock:
            size = CGSize(width: 90, height: 60)
            imageName = "tBlock.png"
        case .oBlock:
            size = CGSize(width: 90, height: 60)
            imageName = "oBlock.png"
        }
    }
}
