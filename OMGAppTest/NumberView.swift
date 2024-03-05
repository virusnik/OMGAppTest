//
//  NumberView.swift
//  OMGAppTest
//
//  Created by Sergio Veliz on 29.02.2024.
//

import SwiftUI

struct NumberView: View {
    @State private var scale: CGFloat = 1.0
    @Binding var number: Int
    
    var body: some View {
        VStack {
            Text("\(number)")
                .padding(10)
                .foregroundColor(Color.white)
        }
        .frame(width: 50, height: 50)
        .background(Color.black)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10,
                             style: .continuous).stroke(Color.purple, lineWidth: 2)
        )
        .scaleEffect(scale)
        .animation(.easeInOut)
        .onLongPressGesture(minimumDuration: .infinity) {
        } onPressingChanged: { starting in
            withAnimation { scale = starting ? 0.8 : 1
            }
        }
    }
}

#Preview {
    NumberView(number: .constant(1))
}
