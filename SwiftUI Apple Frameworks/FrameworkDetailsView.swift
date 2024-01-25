//
//  FrameworkDetailsView.swift
//  SwiftUI Apple Frameworks
//
//  Created by ADPopov on 25.01.2024.
//

import SwiftUI

struct FrameworkDetailsView: View {

    @Environment(\.dismiss) var dismiss
    @Binding var framework: Framework
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .padding()
                        .foregroundStyle(.white)
                }
            }
            
            Spacer()
            
            FrameworkView(framework: framework)
            
            Text("\(framework.description)")
                .padding()
            
            Spacer()
            
            Button {
                print(framework.urlString)
            } label: {
                ButtonView(label: "Learn More",
                           textColor: .white,
                           backgroundColor: .red) {
                    print(framework.urlString)
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    struct Preview: View {
        @State var framework = Framework(name: "SwiftUI",
                                         imageName: "swiftui",
                                         urlString: "https://developer.apple.com/xcode/swiftui",
                                         description: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs.\n\nWith a declarative Swift syntax that’s easy to read and natural to write, SwiftUI works seamlessly with new Xcode design tools to keep your code and design perfectly in sync. Automatic support for Dynamic Type, Dark Mode, localization, and accessibility means your first line of SwiftUI code is already the most powerful UI code you’ve ever written.")
        
        var body: some View {
            FrameworkDetailsView(framework: $framework)
        }
    }

    return Preview()
}
