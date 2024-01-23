//
//  FrameworkView.swift
//  SwiftUI Apple Frameworks
//
//  Created by ADPopov on 20.01.2024.
//

import SwiftUI

struct FrameworkView: View {
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 90.0, height: 90.0)
            Text("\(framework.name)")
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}
