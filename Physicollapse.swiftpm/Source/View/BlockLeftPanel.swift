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
            BlockHoldView(block: selectedBlock)
            Spacer()
            CollapseResultView(height: highestBlockHeight, count: blockCount)
        }
    }
}

#Preview {
    BlockLeftPanel(selectedBlock: .constant(.iBlock), highestBlockHeight: .constant(100), blockCount: 0)
}
