//
//  ShimmerConfig.swift
//  ShimmerLoading
//
//  Created by Luka Vujnovac on 13.12.2023..
//

import SwiftUI

struct ShimmerConfig {
    var tint: Color
    var highlight: Color
    var blur: CGFloat = 0
    var highlightOpacity: CGFloat = 1
    var speed: CGFloat = 2
    var blendMode: BlendMode = .normal
}
