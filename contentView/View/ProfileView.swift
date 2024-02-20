//
//  ProfileView.swift
//  contentView
//
//  Created by Keith on 2/20/24.
//

import SwiftUI

struct ProfileView: View {
    @State var feelingIdx = 0
    let feeling : [String] = ["좋아요", "슬퍼요", "기뻐요", "화나요"]
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
        print(image ?? "기본 고양이")
    }
    
    var body: some View {
        HStack(spacing: 30.0){
            //사용자가 사진 설정 가능
            //하루를 나타내는 사진 삽입
            Image("1x")
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray))
                .frame(width: 80, height: 80)
            Button {
                showImagePicker.toggle()
            } label: {
                Text("image picker")
            }
            .sheet(isPresented: $showImagePicker, onDismiss: {
                loadImage()
            }) {
                ImagePicker(image: $selectedUIImage)
            }
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
    }
}

#Preview {
    ProfileView()
}
