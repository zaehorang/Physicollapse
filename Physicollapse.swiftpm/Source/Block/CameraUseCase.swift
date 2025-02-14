//
//  CameraUseCase.swift
//  Physicollapse
//
//  Created by zaehorang on 2/11/25.
//

import SpriteKit

/// 카메라 이동 방향을 관리하는 enum
enum CameraDirection {
    case up, down, left, right
}

// 카메라 이동 및 자동 조정 기능을 담당하는 UseCase 프로토콜
protocol CameraUseCase {
    func moveCamera(to direction: CameraDirection)
}

/// 📌 Scene 내부에서 카메라를 추가하고, 이동을 담당하는 UseCase 구현체
final class CameraUseCaseImpl: CameraUseCase {
    private weak var scene: SKScene!
    private weak var cameraNode: SKCameraNode!
    
    private let moveStep: CGFloat = 100
    private var initialCameraY: CGFloat = 0
    
    // MARK: - init method
    ///  Scene을 주입받고, 카메라를 자동으로 Scene에 추가
    init(scene: SKScene) {
        self.scene = scene
        setupCamera()
    }
    
    private func setupCamera() {
        guard let scene = scene else { return }
        
        let camera = SKCameraNode()
        camera.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        scene.camera = camera
        
        scene.addChild(camera)
        self.cameraNode = camera
        self.initialCameraY = camera.position.y
    }
    
    func moveCamera(to direction: CameraDirection) {
        guard let camera = cameraNode else { return }
        
        var dx: CGFloat = 0
        var dy: CGFloat = 0
        
        switch direction {
        case .up: dy = moveStep
        case .down:
            let newY = camera.position.y - moveStep
            if newY < initialCameraY { return } // ⛔ 초기 위치보다 아래로 내려가는 것 방지
            dy = -moveStep
        case .left: dx = -moveStep
        case .right: dx = moveStep
        }
        
        let moveUpAction = SKAction.moveBy(x: dx, y: dy, duration: 0.2)
        camera.run(moveUpAction)
    }
}
