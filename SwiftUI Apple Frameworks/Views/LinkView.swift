//
//  LinkView.swift
//  SwiftUI Apple Frameworks
//
//  Created by ADPopov on 04.02.2024.
//

import SwiftUI

struct LinkView: View {
    var destination: URL
    let label: String
    let textColor: Color
    let backgroundColor: Color
    
    var body: some View {
        Link(destination: destination) {
            Text(label)
                .font(.title2)
                .fontWeight(.semibold)
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .cornerRadius(10)
        }
        .preferredColorScheme(.dark)
    }
}
