//
//  FrameworkView.swift
//  SwiftUI Apple Frameworks
//
//  Created by ADPopov on 20.01.2024.
//

import SwiftUI

struct FrameworkView: View {
    let imageName: String
    let name: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 90.0, height: 90.0)
            Text("\(name)")
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
                .foregroundStyle(.white)
        }
    }
}
