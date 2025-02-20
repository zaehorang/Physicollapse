//
//  BlockLeftPanel.swift
//  Physicollapse
//
//  Created by zaehorang on 2/14/25.
//

import SwiftUI

struct BlockLeftPanel: View {
    @Binding var selectedBlock: BlockType
    @Binding var highestBlockHeight: CGFloat
    
    var blockCount: Int
    
    var body: some View {
        VStack {
            BlockHoldView(blockType: selectedBlock)
            Spacer()
            CollapseResultView(height: highestBlockHeight, count: blockCount)
        }
        .foregroundStyle(.black)
        .padding(.vertical)
    }
}

#Preview {
    BlockLeftPanel(selectedBlock: .constant(.iBlock), highestBlockHeight: .constant(100), blockCount: 0)
}
