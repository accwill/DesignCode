//
//  Styles.swift
//  DesignCode
//
//  Created by 宋亚奇 on 2022/12/14.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
    var connerRadius: CGFloat
    
    // 获取主题
    @Environment(\.colorScheme) var colorSchema
    
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: connerRadius, style: .continuous)
                    .stroke(
                        .linearGradient(
                            colors: [.white.opacity(colorSchema == .dark ? 0.6 : 0.3), .black.opacity(colorSchema == .dark ? 0.3 : 0.1)],
                            startPoint: .top, endPoint: .bottom
                        )
                    )
                    .blendMode(.overlay)
            )
    }
}


extension View {
    func strokeStyle(connerRadius: CGFloat = 30) -> some View {
        modifier(StrokeStyle(connerRadius: connerRadius))
    }
}
