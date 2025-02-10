//
//  CollapseView.swift
//  Physicollapse
//
//  Created by zaehorang on 2/10/25.
//

import SpriteKit
import SwiftUI

struct CollapseSpriteView: View {
    @State private var selectedBlockType: BlockType = .oBlock
    
    // 한 번만 생성하도록 변경
    @StateObject private var scene = CollapseScene()
    
    var body: some View {
        HStack {
            Button("🚩 O Block") {
                selectedBlockType = .oBlock
            }
            .padding()
            .background(selectedBlockType == .oBlock ? Color.blue.opacity(0.5) : Color.gray.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Button("🔺 T Block") {
                selectedBlockType = .tBlock
            }
            .padding()
            .background(selectedBlockType == .tBlock ? Color.blue.opacity(0.5) : Color.gray.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
        
        SpriteView(scene: scene)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        if scene.isDragging {
                            scene.moveBlock(to: value.location)
                        } else {
                            scene.startDraggingBlock(at: value.location, type: selectedBlockType)
                        }
                        
                    }
                    .onEnded { value in
                        scene.releaseBlock(type: selectedBlockType, at: value.location)
                    }
            )
    }
}

#Preview {
    CollapseSpriteView()
}
