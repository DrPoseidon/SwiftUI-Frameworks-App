//
//  FrameworkState.swift
//  SwiftUI Apple Frameworks
//
//  Created by ADPopov on 03.02.2024.
//

import SwiftUI

final class FrameworkState: ObservableObject {
    @Published var isShowDetails = false
    var selectedFramework: Framework? {
        didSet {
            isShowDetails = true
        }
    }
}


