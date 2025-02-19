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
            .overlay(alignment: .topTrailing) {
                undoButton {
                    collapseScene.undoLastBlock()
                }
                .padding()
            }
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
    
    private func undoButton( _ action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: "arrow.uturn.backward")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black.opacity(0.6)) // 반투명한 배경
                )
        }
    }
}
