//
//  FrameworkView.swift
//  SwiftUI Apple Frameworks
//
//  Created by ADPopov on 20.01.2024.
//

import SwiftUI

struct FrameworkView: View {
    let framework: Framework
    @Binding var selectedListType: ListType
    
    var body: some View {
        if case ListType.grid = selectedListType {
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
        } else {
            HStack {
                Image(framework.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70.0, height: 70.0)
                
                Text("\(framework.name)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .scaledToFit()
                    .minimumScaleFactor(0.6)
                    .padding()
            }
            .padding()
            
        }
    }
}

#Preview {
    FrameworkView(framework: MockData.frameworks[0], selectedListType: .constant(.list))
}
