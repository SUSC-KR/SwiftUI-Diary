//
//  TitleView.swift
//  contentView
//
//  Created by Keith on 2/20/24.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        Text("오늘은 어떤 하루였나요?")
            .font(.largeTitle)
            .fontWeight(.thin)
            .frame(alignment: .top)
    }
}

#Preview {
    TitleView()
}
