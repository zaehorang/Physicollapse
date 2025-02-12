//
//  CameraUseCase.swift
//  Physicollapse
//
//  Created by zaehorang on 2/11/25.
//

import SpriteKit

// 카메라 이동 및 자동 조정 기능을 담당하는 UseCase 프로토콜
protocol CameraUseCase {
    func moveCameraUp()
    func moveCameraDown()
    func adjustCamera(to blockPosition: CGPoint)
}

/// 📌 Scene 내부에서 카메라를 추가하고, 이동을 담당하는 UseCase 구현체
final class CameraUseCaseImpl: CameraUseCase {
    private weak var scene: SKScene!
    private weak var cameraNode: SKCameraNode!
    
    private var minCameraY: CGFloat = 0
    private let moveStep: CGFloat = 100
    
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
    }
    
    func moveCameraUp() {
        guard let camera = cameraNode else { return }
        let moveUpAction = SKAction.moveBy(x: 0, y: moveStep, duration: 0.2)
        camera.run(moveUpAction)
    }
    
    func moveCameraDown() {
        guard let camera = cameraNode, let scene = scene else { return }
        let minCameraY = scene.size.height / 2
        let newY = camera.position.y - moveStep
        
        if newY >= minCameraY {
            let moveDownAction = SKAction.moveBy(x: 0, y: -moveStep, duration: 0.2)
            camera.run(moveDownAction)
        }
    }
    
    func adjustCamera(to blockPosition: CGPoint) {
        guard let camera = cameraNode else { return }
        
        let threshold = camera.position.y + (moveStep * 2)
        if blockPosition.y > threshold {
            let moveUpAction = SKAction.moveBy(x: 0, y: moveStep, duration: 0.3)
            camera.run(moveUpAction)
        }
    }
}
