import SpriteKit

final class CollapseScene: SKScene, ObservableObject {
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
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
}
