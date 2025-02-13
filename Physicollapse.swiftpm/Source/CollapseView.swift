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
        GeometryReader { geometry in
            let width = geometry.size.width
            
            HStack(alignment: .top, spacing: 10) {
                VStack {
                    BlockHoldView(block: selectedBlock)
                    Spacer()
                    CollapseResultView(height: highestBlockHeight)
                }
                .frame(width: width * 0.15)
                
                CollapseSpriteView(selectedBlockType: selectedBlock) { height in
                    highestBlockHeight = height
                }
                .frame(width: width * 0.7)
                
                SelectBlockView { selected in
                    selectedBlock = selected
                }
            }
        }
    }
}

#Preview {
    CollapseView()
}
