//
//  NumberView.swift
//  OMGAppTest
//
//  Created by Sergio Veliz on 29.02.2024.
//

import SwiftUI

struct NumberView: View {
    @Binding var number: Int
    @State private var isPressed = false
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
        .scaleEffect(isPressed ? 0.8 : 1.0)
        .animation(.easeInOut)
        .simultaneousGesture(
                        TapGesture()
                            .onEnded { _ in
                                withAnimation {
                                    self.isPressed.toggle()
                                }
                            }
                    )
    }
}

#Preview {
    NumberView(number: .constant(1))
}
