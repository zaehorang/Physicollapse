//
//  BlockSettingUseCase.swift
//  Physicollapse
//
//  Created by zaehorang on 2/10/25.
//

import SpriteKit

protocol BlockSettingUseCase {
    func startDraggingBlock(at position: CGPoint, type: BlockType)
    func moveBlock(to position: CGPoint)
    func releaseBlock(type: BlockType, at position: CGPoint)
    func undoLastBlock()
    func clearAllBlocks()
}

final class BlockSettingUseCaseImpl: BlockSettingUseCase {
    private var placedBlocks: [SKSpriteNode] = []
    
    /// NOTE: DI(Container)에서 Scene을 주입받도록 설정
    private weak var scene: SKScene?
    private var silhouetteBlock: SKSpriteNode?
    
    init(scene: SKScene) {
        self.scene = scene
    }
    
    func startDraggingBlock(at position: CGPoint, type: BlockType) {
        if silhouetteBlock == nil {
            silhouetteBlock = BlockFactory.createSilhouetteBlock(from: type)
            silhouetteBlock?.position = position
            scene?.addChild(silhouetteBlock!)
        }
    }
    
    func moveBlock(to position: CGPoint) {
        silhouetteBlock?.position = position
    }
    
    func releaseBlock(type: BlockType, at position: CGPoint) {
        guard let block = silhouetteBlock else { return }
        block.removeFromParent()
        
        let realBlock = BlockFactory.createBlockNode(from: type)
        realBlock.position = position
        scene?.addChild(realBlock)
        
        placedBlocks.append(realBlock)
        silhouetteBlock = nil
    }
    
    func undoLastBlock() {
        guard let lastBlock = placedBlocks.popLast() else { return }
        lastBlock.removeFromParent()
    }
    
    func clearAllBlocks() { // 모든 블록을 지우는 기능 구현
            for block in placedBlocks {
                block.removeFromParent()
            }
            placedBlocks.removeAll()
        }
}
