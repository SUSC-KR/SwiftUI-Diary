//
//  enumView.swift
//  contentView
//
//  Created by 민수민 on 2024/02/01.
//

import SwiftUI

struct enumView: View {
    @ObservedObject private var viewModel = DiaryViewModel()
    
    @State var isClicked = false
    @State var feelingIdx = 0
    let feeling : [String] = ["좋아요", "슬퍼요", "기뻐요", "화나요"]
    @State var diary : String = ""
    @State var themaColor: Color = .indigo
    
    var body: some View {
        ZStack{
            
        }
        //v는 세로
        VStack{
            TitleView()
                .padding(30)
            HStack(spacing: 30.0){
                //사용자가 사진 설정 가능
                //하루를 나타내는 사진 삽입
                Image("1x")
                    .resizable()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(.gray))
                    .frame(width: 80, height: 80)
                VStack{
                    Text("민수민 님 오늘의 기분은 어때요?")
                    Button(action: {
                        if feelingIdx >= 3 {
                            feelingIdx = 0
                        }else{
                            feelingIdx += 1
                        }
                    }, label: {
                        ZStack{
                            Capsule()
                                .fill(.gray.opacity(2))
                                .frame(width: 200, height: 50)
                            Text(feeling[feelingIdx])
                                .foregroundColor(.white)
                        }
                    })
                }
            }
            Spacer()
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
                            VStack {
                                List{
                                    ForEach(viewModel.diaries, id: \.id) { diary in
                                        Button{
                                            isClicked = true
                                        } label :{
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(.white)
                                                Text(diary.createdAt)
                                            }.frame(width: 350, height: 50)
                                        }}
                                }
                                .scrollContentBackground(.hidden)
                                .padding()
                                .onAppear(){
                                    viewModel.requestData()
                                }
                                Spacer()
                            }
                        }
                    }
                }
            }
        }
    }
    
    private struct TitleView:View {
        fileprivate var body: some View {
            Text("오늘은 어떤 하루였나요?")
                .font(.largeTitle)
                .fontWeight(.thin)
                .frame(alignment: .top)
        }
    }
}
    
    
    #Preview {
        enumView()
    }
