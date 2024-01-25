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
    @State private var isShowDetails = false
    @State var selectedFramework = Framework(name: "",
                                             imageName: "",
                                             urlString: "",
                                             description: "")
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(MockData.frameworks, id: \.id) { framework in
                        FrameworkView(framework: framework)
                            .onTapGesture {
                                selectedFramework = framework
                                isShowDetails.toggle()
                            }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            .sheet(isPresented: $isShowDetails) {
                FrameworkDetailsView(framework: $selectedFramework)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    FrameworkGridView()
}
