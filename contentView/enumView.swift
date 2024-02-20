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
    @State var diary : String = ""
    @State var themaColor: Color = .indigo

    



    var body: some View {
        ZStack{
            
        }
        //v는 세로
        VStack{
            TitleView()
                .padding(30)
            
            
            // MARK: - 프로필
            
            
            
            Spacer()
            
            // MARK: - 일기 쓰는 곳
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
            
            
            // MARK: - 지난 하루
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
    enumView()
}
