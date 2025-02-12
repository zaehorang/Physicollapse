//
//  CollapseView.swift
//  Physicollapse
//
//  Created by zaehorang on 2/12/25.
//

import SwiftUI

struct CollapseView: View {
    @State private var selectedBlock: BlockType = .tBlock
    @State private var highestBlockHeight: CGFloat = 0.0
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            VStack {
                BlockHoldView(block: selectedBlock)
                Spacer()
                CollapseResultView(height: highestBlockHeight)
            }
            .frame(maxWidth: 300)
            
            CollapseSpriteView(selectedBlockType: selectedBlock) { height in
                highestBlockHeight = height
            }
            
            SelectBlockView { selected in
                selectedBlock = selected
            }
            .frame(maxWidth: 300)
        }
        .padding()
    }
}

#Preview {
    CollapseView()
}
