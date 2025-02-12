//
//  BlockUseCase.swift
//  Physicollapse
//
//  Created by zaehorang on 2/10/25.
//

import SpriteKit

protocol BlockUseCase {
    func startDraggingBlock(at position: CGPoint, type: BlockType)
    func moveBlock(to position: CGPoint)
    func releaseBlock(type: BlockType, at position: CGPoint)
}

final class BlockUseCaseImpl: BlockUseCase {
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
        silhouetteBlock?.position = position  // ✅ 드래그 중 블록 위치 업데이트
    }
    
    func releaseBlock(type: BlockType, at position: CGPoint) {
        guard let block = silhouetteBlock else { return }
        block.removeFromParent()
        
        let realBlock = BlockFactory.createBlockNode(from: type)
        realBlock.position = position
        scene?.addChild(realBlock)
        
        silhouetteBlock = nil  // ✅ 블록 배치 후 제거
    }
    
}
