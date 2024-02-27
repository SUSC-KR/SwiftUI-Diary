//
//  EditFeelingView.swift
//  contentView
//
//  Created by 민수민 on 2024/02/27.
//

import SwiftUI

struct EditFeelingView: View {
    @Environment(\.presentationMode) var presentation
    @Binding var feeling:[String]
    @State private var newItem:String = ""
    
    var body: some View {
        VStack {
            // MARK: - 완료 버튼
            HStack{
                Spacer()
                Button {
                    presentation.wrappedValue.dismiss()
                } label: {
                    Text("Done")
                        .padding(20)
                }
            }
            ZStack{
                // MARK: - 기분 list
                Form{
                    Section(header: Text("기분").padding(.bottom, 8)){
                        List {
                            ForEach(feeling, id:\.self) { feeling in
                                Text(feeling)
                            }
                            .onDelete(perform: delete)
                        }
                    }
                    
                    //MARK: - 기분 추가 field
                    VStack{
                        TextField("추가할 기분을 입력해주세요", text: $newItem, onCommit: addList)
                            .padding(.leading, 55)
                            .frame(height: 40)
                        Button(action: {
                            addList()
                        }) {
                            ZStack{
                                Capsule()
                                    .fill(.gray.opacity(2))
                                    .frame(width: 170, height: 50)
                                Text("추가하기")
                                    .foregroundColor(.white)
                            }.padding(.top, 20)
                        }
                    }
                }
                
            }
        }
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.949, green: 0.949, blue: 0.966)/*@END_MENU_TOKEN@*/)
    }

    func addList(){
        if (newItem.count != 0) {
            self.feeling.insert(self.newItem, at:0)
            self.newItem = ""
        }
    }
    
    func delete(at offsets: IndexSet) {
        if let first = offsets.first {
            feeling.remove(at: first)
        }
    }
}

#Preview {
    EditFeelingView(feeling: .constant(["a", "b"]))
}
