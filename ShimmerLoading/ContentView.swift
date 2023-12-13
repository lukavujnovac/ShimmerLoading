//
//  ContentView.swift
//  ShimmerLoading
//
//  Created by Luka Vujnovac on 13.12.2023..
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = true
    var body: some View {
        List {
            ForEach(1..<10, id: \.self) { _ in
                LinkCell(title: "test", url: "https://apple.com")
            }
        }
        .loading(isLoading)
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    isLoading = false
                }
            }
        })
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
