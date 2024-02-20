//
//  ContentView.swift
//  contentView
//
//  Created by 민수민 on 2024/01/25.
//

import SwiftUI

struct ContentView: View {

    @State var isClicked = false
    @State var feelingIdx = 0
    let feeling : [String] = ["좋아요", "슬퍼요", "기뻐요", "화나요"]
    @State var diary : String = ""
    
    
    var body: some View {
        //v는 세로
        VStack() {
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
                //Spacer()
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
                        .padding()
                        .background(Color.yellow.opacity(0.4))
                        .foregroundColor(Color.white)
                        .cornerRadius(25)
                        .scrollContentBackground(.hidden)
                    Button{
                        isClicked.toggle()
                    }label:{
                        ZStack{
                            Capsule()
                                .fill(Color.yellow)
                                .frame(width: 80, height: 50)
                            Text("저장")
                                .foregroundColor(.white)
                        }
                        
                    }
                }
                .padding(20)
            }
            Button{
                isClicked.toggle()
            } label:{
                ZStack{
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color.yellow.opacity(0.7))
                        .ignoresSafeArea()
                        .frame(height: isClicked ? 400 : 50)
                    VStack{
                        Text("지난 나의 하루들")
                            .font(.title2)
                            .fontWeight(.thin)
                            .lineLimit(0)
                            .padding(.top, isClicked ? 20 : 10)
                            .foregroundStyle(.black)
                        if isClicked {
                            Spacer()
                            Button{
                                isClicked = true
                            } label :{
                                ZStack{
                                    Capsule()
                                        .fill(.gray)
                                    Text("hi")
                                }.frame(width: 80, height: 50)
                            }
                        }
                    }
                }
            }
        }
    }
}
    
    
    
#Preview {
    ContentView()
}
