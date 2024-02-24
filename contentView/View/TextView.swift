//
//  TextView.swift
//  contentView
//
//  Created by 민수민 on 2024/02/24.
//

import SwiftUI

struct TextView: View {
    @State var diary : String = ""
    @State var themaColor: Color = .indigo
    
    var body: some View {
        VStack{
            ZStack{
                TextEditor(text: $diary)
                    .padding(.top, 50)
                    .padding()
                    .background(themaColor.opacity(0.4))
                    .foregroundColor(Color.white)
                    .cornerRadius(25)
                    .scrollContentBackground(.hidden)
                Button{
//                        $viewModel.postData($diary)
                }label:{
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.white)
                            .frame(width: 70, height: 35)
                        Text("저장")
                    }.position(x:  300, y: 35)
                }
            }
            .padding(20)
        }
        
    }
}

#Preview {
    TextView()
}
