//
//  CollapseGameView.swift
//  Physicollapse
//
//  Created by zaehorang on 2/12/25.
//

import SwiftUI

struct CollapseGameView: View {
    @Binding var isGameActive: Bool
    
    @State private var selectedBlock: BlockType = .tBlock
    @State private var blockRotation: Angle = .zero
    @State private var highestBlockHeight: CGFloat = 0.0
    
    @StateObject private var collapseScene: CollapseScene = CollapseScene()
    @StateObject private var blockCounterUseCase = BlockCounterUseCaseImpl()
    
    private var block: BlockSettingModel {
        BlockSettingModel(type: selectedBlock, rotation: blockRotation)
    }
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            
            HStack(alignment: .top, spacing: 10) {
                BlockLeftPanel(selectedBlock: $selectedBlock, rotationAngle: $blockRotation, highestBlockHeight: $highestBlockHeight, blockCount: blockCounterUseCase.getBlockCount())
                
                CollapseSpriteView(collapseScene: collapseScene, block: block) { height in
                    highestBlockHeight = height
                }
                .frame(width: width * 0.7)
                
                BlockRightPanel(isGameActive: $isGameActive, selectedBlock: $selectedBlock, scene: collapseScene)
            }
            .padding(.vertical, 5)
        }
        .background(Color(.whiteBackground))
        .onChange(of: selectedBlock) {
            blockRotation = .zero
        }
        .task {
            collapseScene.inject(blockCounter: blockCounterUseCase)
        }
    }
}

#Preview {
    CollapseGameView(isGameActive: .constant(true))
}
