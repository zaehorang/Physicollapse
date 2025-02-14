//
//  CollapseView.swift
//  Physicollapse
//
//  Created by zaehorang on 2/10/25.
//

import SpriteKit
import SwiftUI

struct CollapseSpriteView: View {
    @ObservedObject var collapseScene: CollapseScene
    
    let selectedBlockType: BlockType
    let onHeightChange: (CGFloat) -> Void
    
    var body: some View {
        SpriteView(scene: collapseScene)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        collapseScene.handleDraggingBlock(at: value.location, type: selectedBlockType)
                    }
                    .onEnded { value in
                        collapseScene.releaseBlockAndAdjustCamera(type: selectedBlockType, at: value.location)
                    }
            )
            .onChange(of: collapseScene.highestBlockHeight) {
                onHeightChange(collapseScene.highestBlockHeight)
            }
    }
}
