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
    
    let block: BlockSettingModel
    let onHeightChange: (CGFloat) -> Void
    
    var body: some View {
        SpriteView(scene: collapseScene)
            .overlay(alignment: .topTrailing) {
                HStack {
                    undoButton {
                        collapseScene.undoLastBlock()
                    }
                    clearButton {
                        collapseScene.clearAllBlocks()
                    }
                }
                .padding()
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        collapseScene.handleDraggingBlock(at: value.location, block: block)
                    }
                    .onEnded { value in
                        collapseScene.releaseBlockAndAdjustCamera(block: block, at: value.location)
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
    
    private func clearButton(_ action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: "trash")
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
