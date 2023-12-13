//
//  View+Shimmer.swift
//  ShimmerLoading
//
//  Created by Luka Vujnovac on 13.12.2023..
//

import SwiftUI

extension View {
    @ViewBuilder
    func shimmer(_ config: ShimmerConfig) -> some View {
        self
            .modifier(ShimmerEffectHelper(config: config))
    }
}

fileprivate struct ShimmerEffectHelper: ViewModifier {
    @State private var moveTo: CGFloat = -0.7
    var config: ShimmerConfig
    
    func body(content: Content) -> some View {
        content
            .hidden()
            .overlay {
                Rectangle()
                    .foregroundStyle(config.tint, Color(uiColor: .systemPink))
                    .mask {
                        content
                            .redacted(reason: .placeholder)
                    }
                    .overlay {
                        GeometryReader {
                            let size = $0.size
                            let extraOffset = (size.height / 2.5) + config.blur
                            
                            Rectangle()
                                .fill(config.highlight)
                                .mask {
                                    Rectangle()
                                        .fill(
                                            .linearGradient(colors: [
                                                .white.opacity(0),
                                                config.highlight.opacity(config.highlightOpacity),
                                                .white.opacity(0)
                                            ], startPoint: .top, endPoint: .bottom)
                                        )
                                        .blur(radius: config.blur)
                                        .rotationEffect(.init(degrees: -40))
                                        .offset(x: moveTo > 0 ? extraOffset : -extraOffset)
                                        .offset(x: size.width * moveTo)
                                }
                                .blendMode(config.blendMode)
                        }
                        .mask {
                            content
                        }
                    }
                    .onAppear {
                        DispatchQueue.main.async {
                            moveTo = 0.2
                        }
                    }
                    .animation(.linear(duration: config.speed).repeatForever(autoreverses: false), value: moveTo)
            }
    }
}
