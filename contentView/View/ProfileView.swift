//
//  ProfileView.swift
//  contentView
//
//  Created by Keith on 2/20/24.
//

import SwiftUI

struct ProfileView: View {
    @State var feelingIdx = 0
    @State var feeling : [String] = ["좋아요", "슬퍼요", "기뻐요", "화나요"]
    @State var feelingButton = false
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
            VStack{
                Button {
                    showImagePicker.toggle()
                } label: {
                    if let image = image {
                    image
                        .resizable()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.gray))
                        .frame(width: 80, height: 80)
                } else {
                        Image("1x")
                            .resizable()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.gray))
                            .frame(width: 80, height: 80)
                    }
                }
                .sheet(isPresented: $showImagePicker, onDismiss: {
                    loadImage()
                }) {
                    ImagePicker(image: $selectedUIImage)
                }
            }
           
            VStack{
                Text("민수민 님 오늘의 기분은 어때요?")
                HStack{
                    Button(action: {
                        if feelingIdx >= feeling.count-1 {
                            feelingIdx = 0
                        }else{
                            feelingIdx += 1
                        }
                    }, label: {
                        ZStack{
                            Capsule()
                                .fill(.gray.opacity(2))
                                .frame(width: 170, height: 50)
                            Text(feeling[feelingIdx])
                                .foregroundColor(.white)
                        }
                    })
                    Button {
                        feelingButton = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 30))
                    }.sheet(isPresented: $feelingButton){
                        EditFeelingView(feeling: $feeling)
                    }
                }
            }
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var mode
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

extension ImagePicker {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else { return }
            parent.image = image
            parent.mode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    ProfileView()
}
