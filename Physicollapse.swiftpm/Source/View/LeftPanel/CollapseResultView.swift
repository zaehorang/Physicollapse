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
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    CollapseResultView(height: 100, count: 10)
}

