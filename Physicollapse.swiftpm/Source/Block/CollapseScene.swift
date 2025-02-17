import SpriteKit

final class CollapseScene: SKScene, ObservableObject {
    private var blockUseCase: BlockUseCase!
    var cameraUseCase: CameraUseCase!
    
    private var isDragging = false
    
    @Published var highestBlockHeight: CGFloat = 0.0
    
    ///  Scene이 View에 추가되었을 때 한 번만 호출됨
    /// - UseCase를 이 시점에서 초기화하는 것이 안정적 (Scene이 완전히 로드된 후 주입)
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        createSceneContents(size: view.bounds.size)
        
        blockUseCase = BlockUseCaseImpl(scene: self)
        cameraUseCase = CameraUseCaseImpl(scene: self)
        
        setupFloor()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if let newHeight = getHeightFromFloor() {
            highestBlockHeight = newHeight
        }
    }
    
    private func createSceneContents(size: CGSize) {
        self.size = size
        
        self.backgroundColor = .gray
        self.scaleMode = .resizeFill
    }
    
    // MARK: - Public Method (For External Use)
    
    //  블록 조작 관련 외부에서 호출하는 메서드
    func handleDraggingBlock(at position: CGPoint, type: BlockType) {
        let convertedPosition = convertPosition(from: position)
        
        if isDragging {
            moveBlock(to: convertedPosition)
        } else {
            startDraggingBlock(at: convertedPosition, type: type)
        }
    }
    
    func releaseBlockAndAdjustCamera(type: BlockType, at position: CGPoint) {
        let convertedPosition = convertPosition(from: position)
        
        releaseBlock(type: type, at: convertedPosition)
    }
    
    
    /// 바닥에서 가장 높은 블록까지의 거리 반환
    func getHeightFromFloor() -> CGFloat? {
        guard let highestY = getHighestBlockYPosition() else { return nil }
        
        let floorY: CGFloat = 5 // 바닥의 Y 좌표 (setupBoundaries에서 설정)
        return highestY - floorY
    }

    
    // MARK: - Block UseCase Methods (Internal)
    
    /// 블록 드래그 시작
    private func startDraggingBlock(at position: CGPoint, type: BlockType) {
        isDragging = true
        blockUseCase.startDraggingBlock(at: position, type: type)
    }
    
    /// 블록 이동
    private func moveBlock(to position: CGPoint) {
        blockUseCase.moveBlock(to: position)
    }
    
    private func releaseBlock(type: BlockType, at position: CGPoint) {
        isDragging = false
        blockUseCase.releaseBlock(type: type, at: position)
    }
    
    // MARK: - Set Boundary
    /// 바닥과 양쪽 벽을 개별적으로 추가
    private func setupFloor() {
        let boundaryThickness: CGFloat = 5  // 벽 두께
        let worldWidth = size.width
        
        // 바닥 생성
        let floor = SKNode()
        floor.position = CGPoint(x: worldWidth / 2, y: 0)
        let floorBody = SKPhysicsBody(rectangleOf: CGSize(width: worldWidth * 10, height: boundaryThickness))
        floorBody.isDynamic = false
        floor.physicsBody = floorBody
        addChild(floor)
    }
    
    
    // MARK: - Helper Method
    
    private func convertPosition(from viewPosition: CGPoint) -> CGPoint {
        convertPoint(fromView: viewPosition)
    }
    
    /// 현재 씬에서 가장 높은 블록의 Y 위치를 반환
    private func getHighestBlockYPosition() -> CGFloat? {
        let blockNodes = children.compactMap { $0 as? SKSpriteNode } // 블록만 필터링
        
        guard let highestBlock = blockNodes.max(by: { $0.position.y < $1.position.y }) else {
            return nil // 블록이 없으면 nil 반환
        }
        
        return highestBlock.position.y
    }
}
