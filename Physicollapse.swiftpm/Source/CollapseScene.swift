import SpriteKit

final class CollapseScene: SKScene, ObservableObject {
    private var blockUseCase: BlockUseCase!
    
    var isDragging = false
    
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
        isDragging = true
        
        let convertedPosition = convertPosition(from: position)
        blockUseCase.startDraggingBlock(at: convertedPosition, type: type)
    }
    
    /// 블록 이동
    func moveBlock(to position: CGPoint) {
        let convertedPosition = convertPosition(from: position)
        blockUseCase.moveBlock(to: convertedPosition)
    }
    
    func releaseBlock(type: BlockType, at position: CGPoint) {
        isDragging = false
        
        let convertedPosition = convertPosition(from: position)
        blockUseCase.releaseBlock(type: type, at: convertedPosition)
    }
    
    private func convertPosition(from viewPosition: CGPoint) -> CGPoint {
        convertPoint(fromView: viewPosition)
    }
}
