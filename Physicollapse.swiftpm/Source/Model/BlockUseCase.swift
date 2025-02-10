//
//  BlockUseCase.swift
//  Physicollapse
//
//  Created by zaehorang on 2/10/25.
//

import SpriteKit

protocol BlockUseCase {
    func startDraggingBlock(at position: CGPoint, type: BlockType) -> SKSpriteNode
    func moveBlock(_ block: SKSpriteNode, to position: CGPoint)
    func releaseBlock(silhouetteBlock: SKSpriteNode, type: BlockType, at position: CGPoint)
}

struct BlockUseCaseImpl: BlockUseCase {
    
    /// NOTE: DI(Container)에서 Scene을 주입받도록 설정
    private weak var scene: SKScene?

    init(scene: SKScene) {
        self.scene = scene
    }

    /// 실루엣 블록 생성
    func startDraggingBlock(at position: CGPoint, type: BlockType) -> SKSpriteNode {
        let silhouetteBlock = BlockFactory.createSilhouetteBlock(from: type)
        silhouetteBlock.position = position
        scene?.addChild(silhouetteBlock)
        
        return silhouetteBlock
    }
    
    /// 블록 이동
    func moveBlock(_ block: SKSpriteNode, to position: CGPoint) {
        block.position = position
    }

    /// 블록 배치 완료 (실루엣 → 실제 블록)
    func releaseBlock(silhouetteBlock: SKSpriteNode, type: BlockType, at position: CGPoint) {
        silhouetteBlock.removeFromParent()
        
        let block = BlockFactory.createBlockNode(from: type)
        block.position = position
        scene?.addChild(block)
    }

}
