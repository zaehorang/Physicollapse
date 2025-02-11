import SpriteKit

final class CollapseScene: SKScene, ObservableObject {
    private var blockUseCase: BlockUseCase!
    private var cameraUseCase: CameraUseCase!
    
    var isDragging = false
    
    ///  Scene이 View에 추가되었을 때 한 번만 호출됨
    /// - UseCase를 이 시점에서 초기화하는 것이 안정적 (Scene이 완전히 로드된 후 주입)
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        createSceneContents(size: view.bounds.size)
        
        blockUseCase = BlockUseCaseImpl(scene: self)
        cameraUseCase = CameraUseCaseImpl(scene: self)
        
        setupBoundaries()
    }
    
    private func createSceneContents(size: CGSize) {
        self.size = size
        
        self.backgroundColor = .black
        self.scaleMode = .resizeFill
    }
    
    // MARK: - Block UseCase Method
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
        
        // 카메라 조정
        adjustCamera(for: convertedPosition)
    }
    
    // MARK: - Camera UseCase Method
    func moveCameraUp() {
        cameraUseCase.moveCameraUp()
    }
    
    func moveCameraDown() {
        cameraUseCase.moveCameraDown()
    }
    
    private func adjustCamera(for blockPosition: CGPoint) {
        cameraUseCase.adjustCamera(to: blockPosition)
    }
    
    // MARK: - Set Boundary
    /// 바닥과 양쪽 벽을 개별적으로 추가
    private func setupBoundaries() {
        let boundaryThickness: CGFloat = 5  // 벽 두께
        let worldWidth = size.width
        let worldHeight = size.height
        
        // 바닥 생성
        let floor = SKNode()
        floor.position = CGPoint(x: worldWidth / 2, y: 0)
        let floorBody = SKPhysicsBody(rectangleOf: CGSize(width: worldWidth, height: boundaryThickness))
        floorBody.isDynamic = false
        floor.physicsBody = floorBody
        addChild(floor)
        
        // 왼쪽 벽 생성
        let leftWall = SKNode()
        leftWall.position = CGPoint(x: 0, y: worldHeight / 2)
        let leftWallBody = SKPhysicsBody(rectangleOf: CGSize(width: boundaryThickness, height: worldHeight * 10)) // 무한 확장
        leftWallBody.isDynamic = false
        leftWall.physicsBody = leftWallBody
        addChild(leftWall)
        
        // 오른쪽 벽 생성
        let rightWall = SKNode()
        rightWall.position = CGPoint(x: worldWidth, y: worldHeight / 2)
        let rightWallBody = SKPhysicsBody(rectangleOf: CGSize(width: boundaryThickness, height: worldHeight * 10)) // 무한 확장
        rightWallBody.isDynamic = false
        rightWall.physicsBody = rightWallBody
        addChild(rightWall)
    }

    
    // MARK: - Helper Method
    
    private func convertPosition(from viewPosition: CGPoint) -> CGPoint {
        convertPoint(fromView: viewPosition)
    }
}
