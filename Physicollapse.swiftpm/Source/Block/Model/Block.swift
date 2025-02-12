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
            size = CGSize(width: 50, height: 50)
            imageName = "shortOBlock.png"
        case .oBlock:
            size = CGSize(width: 100, height: 100)
            imageName = "oBlock.png"
        }
    }
}
