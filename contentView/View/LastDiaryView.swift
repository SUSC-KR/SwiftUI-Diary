//
//  LastDiaryView.swift
//  contentView
//
//  Created by 민수민 on 2024/02/24.
//

import SwiftUI

struct LastDiaryView: View {
    @State var isClicked = false
    @State var diaryClicked = false
    @ObservedObject private var viewModel = DiaryViewModel()
    @State var themaColor: Color = .indigo
    
    var body: some View {
        Button{
            isClicked.toggle()
        } label:{
            ZStack{
                RoundedRectangle(cornerRadius: 40)
                    .fill(themaColor.opacity(0.45))
                    .ignoresSafeArea()
                    .frame(height: isClicked ? 350 : 50)
                VStack{
                    Text("지난 나의 하루들")
                        .font(.title2)
                        .fontWeight(.bold)
                        .lineLimit(0)
                        .padding(.top, isClicked ? 20 : 10)
                        .foregroundStyle(.white)
                    if isClicked {
                        VStack{
                            List {
                                ForEach(viewModel.diaries, id: \.id) { diary in
                                    NavigationLink(destination: Text("detail")){
                                        Text(diary.createdAt)
                                    }
                                }
                            }
                            .scrollContentBackground(.hidden)
                            .padding()
                            .onAppear(){
                                viewModel.requestData()
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LastDiaryView()
}
