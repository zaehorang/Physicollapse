//
//  SwiftUIView.swift
//  Physicollapse
//
//  Created by zaehorang on 2/14/25.
//

import SwiftUI

struct BlockRightPanel: View {
    @Binding var isGameActive: Bool
    @Binding var selectedBlock: BlockType
    
    @ObservedObject var scene: CollapseScene
    
    var body: some View {
        VStack {
            Button {
                isGameActive = false
            } label: {
                HStack {
                    Image(systemName: "house.fill") // SF Symbol 추가
                    Text("Home")
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.black.opacity(0.7))
                        .shadow(radius: 4)
                )
                .cornerRadius(10)
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 5)
            
            
            SelectBlockView { selected in
                selectedBlock = selected
            }
            Spacer()
            
            CameraControlView(cameraUseCase: scene.cameraUseCase)
                .padding(.horizontal, 10)
        }
        .foregroundStyle(.black)
        .padding(.vertical)
    }
    
    
}
