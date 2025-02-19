//
//  HelpView.swift
//  Physicollapse
//
//  Created by zaehorang on 2/20/25.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) var dismiss
    @State private var pageIndex = 0
    
    let images = ["fewerBlock", "higherBlock"] // 설명 이미지 파일명
    
    let titles = [
        "Use Fewer Blocks!",
        "Stack Blocks Higher!"
    ]
    
    let descriptions = [
        "The fewer blocks you use, the more stable and efficient your tower will be.\nThink carefully before placing each block!",
        "A taller tower means you are using space wisely.\nTry to balance your blocks so the tower doesn’t fall!"
    ]
    
    var body: some View {
        ZStack {
            Color(.whiteBackground)
                .ignoresSafeArea()
            
            VStack {
                TabView(selection: $pageIndex) {
                    ForEach(0..<titles.count, id: \.self) { index in
                        VStack(spacing: 15) {
                            Image(images[index])
                                .resizable()
                                .scaledToFit()
                                .frame(height: 300)
                            
                            Text(titles[index]) // 제목
                                .font(.title)
                                .bold()
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.center)
                                .padding(.top, 10)
                            
                            Text(descriptions[index]) // 설명
                                .font(.title3)
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 20)
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                Button("Close") {
                    dismiss()
                }
                .font(.title3)
                .bold()
                .padding()
                .frame(width: 150)
                .background(Color(.mainBackground))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            .padding()
        }
    }
}

#Preview {
    HelpView()
}
