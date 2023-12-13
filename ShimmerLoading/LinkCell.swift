//
//  LinkCell.swift
//  ShimmerLoading
//
//  Created by Luka Vujnovac on 13.12.2023..
//

import SwiftUI

struct LinkCell: View {
    let title: String
    let url: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 6) {
                Image("AppPlaceholder")
                    .resizable()
                    .frame(width: 18, height: 18)
                
                Text(title)
                    .font(.system(size: 13, weight: .regular))
                    .tracking(-0.25)
                    .lineSpacing(0)
                    .foregroundColor(.white)
                Spacer()
            }
            
            Text(verbatim: url)
                .foregroundStyle(.gray)
                .font(.system(size: 13, weight: .medium, design: .monospaced))
                .tracking(-0.25)
                .lineSpacing(0)
                .lineLimit(1)
        }
        .padding(.vertical, 2)
    }
}

#Preview {
    List {
        ForEach(1..<10, id: \.self) { _ in
            LinkCell(title: "Link", url: "https://apple.com")
        }
    }
    .preferredColorScheme(.dark)
}
