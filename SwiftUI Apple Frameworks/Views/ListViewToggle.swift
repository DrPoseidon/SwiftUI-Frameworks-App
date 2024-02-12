//
//  ListViewToggle.swift
//  SwiftUI Apple Frameworks
//
//  Created by ADPopov on 08.02.2024.
//

import SwiftUI

struct ListViewToggle: View {
    let systemName: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action();
        } label: {
            Image(systemName: systemName)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    ListViewToggle(systemName: "sun.max.fill") {
        print("clicked")
    }
}
