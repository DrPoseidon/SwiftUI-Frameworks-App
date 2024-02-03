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
    @StateObject var frameworkState = FrameworkState()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(MockData.frameworks, id: \.id) { framework in
                        FrameworkView(framework: framework)
                            .onTapGesture {
                                frameworkState.selectedFramework = framework
                            }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            .sheet(isPresented: $frameworkState.isShowDetails) {
                let framework = frameworkState.selectedFramework ?? Framework(name: "", imageName: "", urlString: "", description: "")
                
                FrameworkDetailsView(framework: framework)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    FrameworkGridView()
}
