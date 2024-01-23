//
//  FrameworkGridView.swift
//  SwiftUI Apple Frameworks
//
//  Created by ADPopov on 15.01.2024.
//

import SwiftUI

struct FrameworkGridView: View {
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(MockData.frameworks, id: \.id) { framework in
                        FrameworkView(framework: framework)
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    FrameworkGridView()
}
