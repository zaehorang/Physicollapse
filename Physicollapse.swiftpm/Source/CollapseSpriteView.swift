//
//  CollapseView.swift
//  Physicollapse
//
//  Created by zaehorang on 2/10/25.
//

import SpriteKit
import SwiftUI

struct CollapseSpriteView: View {
    @StateObject private var scene = CollapseScene() // 한 번만 생성하도록 변경
    
    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        print("changed: \(value.location)")
                        
                    }
                    .onEnded { value in
                        print("end: \(value.location)")
                    }
            )
    }
}

#Preview {
    CollapseSpriteView()
}
