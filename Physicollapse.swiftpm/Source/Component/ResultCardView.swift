//
//  ResultCardView.swift
//  Physicollapse
//
//  Created by zaehorang on 2/12/25.
//

import SwiftUI

struct ResultCardView: View {
    let title: String
    let value: String
    let color: Color

    var body: some View {
        VStack(spacing: 10) {
            Text(title)
                .font(.title3)
                .bold()
            Text(value)
                .font(.title)
                .foregroundColor(color)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.8))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .black.opacity(0.1), radius: 5)
    }
}

#Preview {
    ResultCardView(title: "Score", value: "10", color: .blue)
}
