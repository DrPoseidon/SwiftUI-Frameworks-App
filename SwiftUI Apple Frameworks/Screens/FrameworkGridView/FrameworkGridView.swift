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
    @State var selectedFramework: Framework?
    @StateObject var frameworkState = FrameworkState()
    
    @State var selectedListType: ListType = ListType.list

    
    var body: some View {
        NavigationView {
            if case .grid = selectedListType {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(MockData.frameworks, id: \.id) { framework in
                            FrameworkView(framework: framework, selectedListType: $selectedListType)
                                .onTapGesture {
                                    frameworkState.selectedFramework = framework
                                }
                        }
                    }
                }
                .navigationTitle("🍎 Frameworks")
                .toolbar(content: {
                    if case .grid = selectedListType {
                        ListViewToggle(systemName: "square.grid.3x3") {
                            selectedListType = .list
                        }
                    } else {
                        ListViewToggle(systemName: "list.bullet") {
                            selectedListType = .grid
                        }
                    }
                })
                .sheet(isPresented: $frameworkState.isShowDetails) {
                    FrameworkDetailsView(framework: frameworkState.selectedFramework!)
                }
            } else {
                List {
                    ForEach(MockData.frameworks, id: \.id) { framework in
                        NavigationLink(destination: FrameworkDetailsView(isSheet: false, framework: framework)) {
                            FrameworkView(framework: framework, selectedListType: .constant(.list))
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("🍎 Frameworks")
                .toolbar(content: {
                    if case .grid = selectedListType {
                        ListViewToggle(systemName: "square.grid.3x3") {
                            selectedListType = .list
                        }
                    } else {
                        ListViewToggle(systemName: "list.bullet") {
                            selectedListType = .grid
                        }
                    }
                    
                    
                })
            }
        }
        .accentColor(Color(.label))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    FrameworkGridView()
}
