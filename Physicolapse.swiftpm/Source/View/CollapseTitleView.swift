//
//  CollapseTitleView.swift
//  Physicollapse
//
//  Created by zaehorang on 2/20/25.
//

import SwiftUI

struct CollapseTitleView: View {
    @Binding var isGameActive: Bool
    @State private var showHelp = false
    
    var body: some View {
        ZStack(alignment: .center) {
            // 배경 이미지
            Image("TitleImage")
                .resizable()
                .ignoresSafeArea()
            
            HStack {
                Spacer()
                VStack(spacing: 50) {
                    // Start 버튼
                    customButton(title: "START") {
                        isGameActive = true
                    }
                    
                    // Help 버튼
                    customButton(title: "HELP") {
                        showHelp = true
                    }
                }
                .transition(.opacity)
                
            }
            .animation(.easeInOut(duration: 0.5), value: isGameActive)
            .padding(.trailing, 100)
            .sheet(isPresented: $showHelp) {
                HelpView()
            }
        }
    }
    
    private func customButton(title: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 28, weight: .bold))
                .foregroundStyle(.blue.opacity(0.5))
                .padding()
                .frame(width: 180, height: 60)
                .background(
                    ZStack {
                        // 바닥 그림자 효과
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.mainBackground).opacity(0.8))
                            .offset(y: 4)
                            .blur(radius: 4)
                        
                        // 버튼 본체
                        RoundedRectangle(cornerRadius: 20)
                            .fill(LinearGradient(
                                gradient: Gradient(colors: [Color.white, Color(.mainBackground).opacity(0.5)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                            .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
                    }
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black.opacity(0.3), lineWidth: 2)
                )
                .scaleEffect(1.05) // 버튼을 살짝 확대해서 부드러운 느낌 강조
        }
    }
}

#Preview {
    CollapseTitleView(isGameActive: .constant(false))
}


