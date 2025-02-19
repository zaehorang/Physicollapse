//
//  Block.swift
//  Physicollapse
//
//  Created by zaehorang on 2/10/25.
//

import Foundation

enum BlockType: String, CaseIterable {
    // TODO: 더 추가 예정
    case tBlock, oBlock, iBlock, jBlock, lBlock, sBlock, shortIBlock, shortOBlock, shortTBlock, zBlock
    
    /// 블록의 가로, 세로 개수 설정 (예: oBlock은 2x2 크기)
    var dimensions: (widthCount: Int, heightCount: Int) {
        switch self {
        case .tBlock: return (3, 3)
        case .oBlock: return (2, 2)
        case .iBlock: return (1, 4)
        case .jBlock: return (2, 3)
        case .lBlock: return (2, 3)
        case .sBlock: return (3, 3)
        case .shortIBlock: return (3, 1)
        case .shortOBlock: return (1, 1)
        case .shortTBlock: return (2, 3)
        case .zBlock: return (2, 3)
        }
    }
}

struct Block {
    let type: BlockType
    let size: CGSize
    let imageName: String
    let cardImageName: String
    
    /// 블록의 기본 크기 (단위 크기, 기본값 50)
    static var unitSize: CGFloat = 30
    
    init(type: BlockType) {
        self.type = type
        
        let (widthCount, heightCount) = type.dimensions
        let unit = Block.unitSize
        
        // 동적으로 블록 크기 설정
        self.size = CGSize(width: CGFloat(widthCount) * unit,
                           height: CGFloat(heightCount) * unit)
        
        self.imageName = type.rawValue + ".png"
        self.cardImageName = type.rawValue + "Card"
    }
}
