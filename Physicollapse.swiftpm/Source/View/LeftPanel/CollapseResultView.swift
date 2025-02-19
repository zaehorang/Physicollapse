//
//  CollapseResultView.swift
//  Physicollapse
//
//  Created by zaehorang on 2/12/25.
//

import SwiftUI

struct CollapseResultView: View {
    var height: CGFloat
    var count: Int

    var body: some View {
        VStack(spacing: 20) {
            ResultCardView(title: "Height", value: "\(Int(height))", color: .blue)
            ResultCardView(title: "Count", value: "\(count)", color: .green)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 2)
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 20))
        )
        .padding(.horizontal)
    }
}

#Preview {
    CollapseResultView(height: 100, count: 10)
}

