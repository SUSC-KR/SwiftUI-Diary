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
