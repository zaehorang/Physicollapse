//
//  PhysicollapseView.swift
//  Physicollapse
//
//  Created by zaehorang on 2/20/25.
//

import SwiftUI

struct PhysicollapseView: View {
    @State private var isGameActive = false
    
    var body: some View {
        if isGameActive {
            CollapseGameView(isGameActive: $isGameActive) // 게임 화면
        } else {
            CollapseTitleView(isGameActive: $isGameActive) // 타이틀 화면
        }
    }
}

#Preview {
    PhysicollapseView()
}
