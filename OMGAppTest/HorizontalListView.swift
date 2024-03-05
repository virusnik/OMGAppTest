//
//  HorizontalListView.swift
//  OMGAppTest
//
//  Created by Sergio Veliz on 29.02.2024.
//

import SwiftUI

struct HorizontalListView: View {
    @Binding var data: [Int]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(data.indices, id: \.self) { index in
                    NumberView(number: self.$data[index])
                }
            }
            .padding()
        }
    }
}

#Preview {
    HorizontalListView(data: .constant([0,1]))
}
