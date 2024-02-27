//
//  enumView.swift
//  contentView
//
//  Created by 민수민 on 2024/02/01.
//

import SwiftUI

struct enumView: View {
    @State var themaColor: Color = .indigo

    var body: some View {
        VStack{
            // MARK: - title
            TitleView()
                .padding(30)
            // MARK: - 프로필
            ProfileView()
                .padding(.horizontal)
            Spacer()
            
            // MARK: - 일기 쓰는 곳
            TextView()
            
            // MARK: - 지난 하루
            LastDiaryView()
        }
    }
}
    
#Preview {
    enumView()
}
