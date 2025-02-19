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
    @State private var highestBlockHeight: CGFloat = 0.0
    
    @StateObject private var collapseScene: CollapseScene = CollapseScene()
    @StateObject private var blockCounterUseCase = BlockCounterUseCaseImpl()
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            
            HStack(alignment: .top, spacing: 10) {
                BlockLeftPanel(selectedBlock: $selectedBlock, highestBlockHeight: $highestBlockHeight, blockCount: blockCounterUseCase.getBlockCount())
                
                CollapseSpriteView(collapseScene: collapseScene, selectedBlockType: selectedBlock) { height in
                    highestBlockHeight = height
                }
                .frame(width: width * 0.7)
                
                BlockRightPanel(isGameActive: $isGameActive, selectedBlock: $selectedBlock, scene: collapseScene)
            }
            .padding(.bottom, 5)
        }
        .background(Color(.whiteBackground))
        .task {
            collapseScene.inject(blockCounter: blockCounterUseCase)
        }
    }
}

#Preview {
    CollapseGameView(isGameActive: .constant(true))
}
