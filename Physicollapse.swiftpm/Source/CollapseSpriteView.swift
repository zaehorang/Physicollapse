//
//  CollapseView.swift
//  Physicollapse
//
//  Created by zaehorang on 2/10/25.
//

import SpriteKit
import SwiftUI

struct CollapseSpriteView: View {
    @StateObject private var scene = CollapseScene()
    
    let selectedBlockType: BlockType
    let onHeightChange: (CGFloat) -> Void
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button("Up") {
                        scene.moveCameraUp()
                    }
                    .padding()
                    .background(.yellow.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Button("Down") {
                        scene.moveCameraDown()
                    }
                    .padding()
                    .background(.yellow.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            
            SpriteView(scene: scene)
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            scene.handleDraggingBlock(at: value.location, type: selectedBlockType)
                        }
                        .onEnded { value in
                            scene.releaseBlockAndAdjustCamera(type: selectedBlockType, at: value.location)
                        }
                )
        }
        .onChange(of: scene.highestBlockHeight) {
            onHeightChange(scene.highestBlockHeight)
        }
    }
}

#Preview {
    CollapseSpriteView(selectedBlockType: .iBlock) { height in
        print("height: \(height)")
    }
}
