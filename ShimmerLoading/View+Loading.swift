//
//  View+Loading.swift
//  ShimmerLoading
//
//  Created by Luka Vujnovac on 13.12.2023..
//

import SwiftUI

struct LoadingModifier: ViewModifier {
    func body(content: Content) -> some View {
        List {
            ForEach(1..<10, id: \.self) { _ in
                LinkCell(title: "Link", url: "https://apple.com")
                    .shimmer(.init(tint: .white.opacity(0.7), highlight: .white, blur: 10, highlightOpacity: 1, speed: 1.5, blendMode: .overlay))
            }
        }
    }
}

public extension View {
    @ViewBuilder
    func loading(_ isLoading: Bool, isBlurred: Bool = true) -> some View {
        if isLoading {
            self
                .modifier(LoadingModifier())
                .disabled(true)
        } else {
            self
        }
    }
}
