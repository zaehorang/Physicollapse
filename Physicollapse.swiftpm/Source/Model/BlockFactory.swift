//
//  BlockFactory.swift
//  Physicollapse
//
//  Created by zaehorang on 2/10/25.
//

import SpriteKit

struct BlockFactory {
    /// `Block` 모델을 기반으로 **실제 블록 노드**를 생성하는 함수
    static func createBlockNode(from blockType: BlockType) -> SKSpriteNode {
        let block = Block(type: blockType)
        
        let node = SKSpriteNode(texture: SKTexture(imageNamed: block.imageName))
        node.size = block.size
        node.physicsBody = createPhysicsBody(from: blockType) // ✅ 실루엣 블록과 차별화
        return node
    }
    
    /// `Block` 모델을 기반으로 **실루엣 블록 노드**를 생성하는 함수 (반투명 효과 적용, 물리 속성 없음)
    static func createSilhouetteBlock(from blockType: BlockType) -> SKSpriteNode {
        let block = Block(type: blockType)
        let node = SKSpriteNode(texture: SKTexture(imageNamed: block.imageName))
        node.size = block.size
        node.alpha = 0.5 // ✅ 실루엣 블록은 반투명
        return node
    }
    
    /// `Block` 모델을 기반으로 `SKPhysicsBody` 생성
    private static func createPhysicsBody(from blockType: BlockType) -> SKPhysicsBody {
        let block = Block(type: blockType)
        
        let texture = SKTexture(imageNamed: block.imageName)
        let physicsBody = SKPhysicsBody(texture: texture, size: block.size)
        configurePhysics(physicsBody)
        return physicsBody
    }
    
    /// 공통 물리 속성 설정 (재사용 가능)
    private static func configurePhysics(_ physicsBody: SKPhysicsBody) {
        physicsBody.isDynamic = true
        physicsBody.categoryBitMask = 1
        physicsBody.collisionBitMask = 1
        
        // 🔹 마찰력을 더 낮춤 (더 쉽게 미끄러지도록)
        physicsBody.friction = 0.1
        
        // 🔹 반발력을 증가시켜 충돌 후 더 쉽게 움직이도록
        physicsBody.restitution = 0.2
        
        // 🔹 수평 움직임 감속 거의 없음
        physicsBody.linearDamping = 0.1
        
        // 🔹 회전 감속 최소화 감속 크게 감소
        physicsBody.angularDamping = 0.01
    }
}
