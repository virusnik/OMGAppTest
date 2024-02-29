//
//  ContentView.swift
//  OMGAppTest
//
//  Created by Sergio Veliz on 29.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var itemsCount = Int.random(in: 100...200)
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(0..<itemsCount, id: \.self) { _ in
                    HorizontalListView()
                }
            }
            .padding()
        }
    }
}


