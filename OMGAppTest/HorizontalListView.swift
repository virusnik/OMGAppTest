//
//  HorizontalListView.swift
//  OMGAppTest
//
//  Created by Sergio Veliz on 29.02.2024.
//

import SwiftUI

struct HorizontalListView: View {
    @State private var itemsCount = Int.random(in: 10...20)
    @State private var numbers: [Int] = Array(repeating: 0, count: Int.random(in: 10...20))
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 30) {
                ForEach(numbers.indices, id: \.self) { index in
                    NumberView(number: numbers[index])
                }
            }
            .padding()
        }
        .onAppear {
            startUpdatingNumbers()
        }
    }
    
    private func startUpdatingNumbers() {
        DispatchQueue.main.async {
            let _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                let index = Int.random(in: 0..<numbers.count)
                numbers[index] = Int.random(in: 1...100)
            }
        }
    }
}

#Preview {
    HorizontalListView()
}
