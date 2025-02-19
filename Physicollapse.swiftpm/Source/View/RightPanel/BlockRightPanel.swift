//
//  SwiftUIView.swift
//  Physicollapse
//
//  Created by zaehorang on 2/14/25.
//

import SwiftUI

struct BlockRightPanel: View {
    @Binding var selectedBlock: BlockType
    
    @ObservedObject var scene: CollapseScene
    
    var body: some View {
        VStack {
            SelectBlockView { selected in
                selectedBlock = selected
            }
            Spacer()
            
            CameraControlView(cameraUseCase: scene.cameraUseCase)
                .padding(.horizontal, 10)
        }
    }
}
