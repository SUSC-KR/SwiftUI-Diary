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
    @State var themaColor: Color = .indigo.opacity(0.45)
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 40)
                .fill(themaColor)
                .ignoresSafeArea()
                .frame(height: isClicked ? 350 : 50)
            VStack{
                Button{
                    isClicked.toggle()
                } label:{
                    ZStack{
                        
                        Text("지난 나의 하루들")
                            .font(.title2)
                            .fontWeight(.bold)
                            .lineLimit(0)
                            .padding(.top, 10)
                            .foregroundStyle(.white)
                    }
                }
                if isClicked {
                    NavigationView{
                        List {
                            ForEach(viewModel.diaries, id: \.id) { diary in
                                NavigationLink(destination: Text(diary.title)){
                                    Text(diary.createdAt)
                                }
                            }
                        }
                        .background(themaColor)
                    }
                    .frame(height: 250)
                    .scrollContentBackground(.hidden)
                    .onAppear(){
                        viewModel.requestData()
                    }
                }
            }
            
        }
    }
}
        
#Preview {
    LastDiaryView()
}
