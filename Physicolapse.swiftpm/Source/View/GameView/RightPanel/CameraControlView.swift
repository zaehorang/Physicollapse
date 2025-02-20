//
//  SwiftUIView.swift
//  Physicollapse
//
//  Created by zaehorang on 2/14/25.
//

import SwiftUI

struct CameraControlView: View {
    let cameraUseCase: CameraUseCase?
    
    var body: some View {
        VStack {
            Text("Camera")
                .font(.title3)
                .bold()
                .foregroundColor(.black)
                .padding(.bottom, 15)
            
            Keyboard(
                onUp: { cameraUseCase?.moveCamera(to: .up) },
                onDown: { cameraUseCase?.moveCamera(to: .down) },
                onLeft: { cameraUseCase?.moveCamera(to: .left) },
                onRight: { cameraUseCase?.moveCamera(to: .right) }
            )
        }
    }
}
