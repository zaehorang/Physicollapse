import SpriteKit

final class CollapseScene: SKScene, ObservableObject {
    private var blockUseCase: BlockUseCase!
    
    var silhouetteBlock: SKSpriteNode? // 실루엣 블록 (반투명한 임시 블록)
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        blockUseCase = BlockUseCaseImpl(scene: self) // ✅ UseCase 구현체를 주입받음
        createSceneContents(size: view.bounds.size)
    }
    
    private func createSceneContents(size: CGSize) {
        self.size = size
        
        self.backgroundColor = .black
        self.scaleMode = .resizeFill
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        // 벽에 물성주기
        physicsBody?.friction = 0.5
        physicsBody?.restitution = 0.2
    }
    
    /// 블록 드래그 시작
    func startDraggingBlock(at position: CGPoint, type: BlockType) {
        let convertedPosition = convertPosition(from: position)
        
        if silhouetteBlock == nil {
            silhouetteBlock = blockUseCase.startDraggingBlock(at: convertedPosition, type: type)
        } else {
            moveBlock(silhouetteBlock!, to: convertedPosition)
        }
    }
    
    /// 블록 이동
    func moveBlock(_ block: SKSpriteNode, to position: CGPoint) {
//        let convertedPosition = convertPosition(from: position)
        blockUseCase.moveBlock(block, to: position)
    }
    
    /// 블록 배치 완료
    func releaseBlock(type: BlockType, at position: CGPoint) {
        if let block = silhouetteBlock {
            let convertedPosition = convertPosition(from: position)
            blockUseCase.releaseBlock(silhouetteBlock: block, type: type, at: convertedPosition)
            
            silhouetteBlock = nil
        } else {
            print("🚨 [Error] releaseBlock called, but silhouetteBlock is nil. Check if startDraggingBlock was called properly.")
        }
    }
    
    private func convertPosition(from viewPosition: CGPoint) -> CGPoint {
        
        return convertPoint(fromView: viewPosition)
    }
}
