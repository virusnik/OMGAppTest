//
//  ContentView.swift
//  OMGAppTest
//
//  Created by Sergio Veliz on 29.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var verticalData: [[Int]] = []
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(verticalData.indices, id: \.self) { index in
                    HorizontalListView(data: self.$verticalData[index])
                }
            }
            .padding()
        }
        .onAppear {
            self.generateRandomData()
            self.startTimers()
        }
    }
    
    func generateRandomData() {
        let numberOfSections = Int.random(in: 100...200)
        for _ in 0..<numberOfSections {
            let innerArrayCount = Int.random(in: 11...20)
            let innerArray = (0..<innerArrayCount).map { _ in
                return Int.random(in: 1...100)
            }
            verticalData.append(innerArray)
        }
    }
    
    func startTimers() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            for index in self.verticalData.indices {
                for innerIndex in self.verticalData[index].indices {
                    self.verticalData[index][innerIndex] = Int.random(in: 1...100)
                }
            }
        }
    }
}


