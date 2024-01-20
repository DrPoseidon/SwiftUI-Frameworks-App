//
//  FrameworkGridView.swift
//  SwiftUI Apple Frameworks
//
//  Created by ADPopov on 15.01.2024.
//

import SwiftUI

extension Array {
    func chunks(_ chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
        }
    }
}

struct FrameworkGridView: View {
    private var numberOfRows: Int = Int(
        ceil(
            Float(MockData.frameworks.count)/Float(3)
        )
    )
    
    private var frameworks: [[Framework]]
    
    init() {
        frameworks = MockData.frameworks.chunks(3)
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black, .gray], startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading) {
                Text("Frameworks")
                    .font(.system(size: 24.0, weight: .bold))
                    .foregroundStyle(.white)
                ScrollView {
                    Grid(verticalSpacing: 50.0) {
                        ForEach((0..<frameworks.count)) { index in
                            GridRow {
                                ForEach(frameworks[index], id: \.name) { framework in
                                    FrameworkView(imageName: framework.imageName, name: framework.name)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
        }
    }
}

#Preview {
    FrameworkGridView()
}
