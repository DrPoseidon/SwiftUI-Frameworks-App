//
//  FrameworkDetailsView.swift
//  SwiftUI Apple Frameworks
//
//  Created by ADPopov on 25.01.2024.
//

import SwiftUI

struct FrameworkDetailsView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.openURL) var openURL
    var framework: Framework
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(Color(.label)) // label - будет белый в темном режиме и черным в светлом
                        .frame(width: 44, height: 44)
                }
            }
            
            Spacer()
            
            FrameworkView(framework: framework)
            
            Text("\(framework.description)")
                .font(.body)
                .padding()
            
            Spacer()
            
            ButtonView(label: "Learn More",
                       textColor: .white,
                       backgroundColor: .red) {
                openURL(URL(string: framework.urlString)!)
            }
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    struct Preview: View {
        var body: some View {
            FrameworkDetailsView(framework: MockData.frameworks[0])
        }
    }

    return Preview()
}
