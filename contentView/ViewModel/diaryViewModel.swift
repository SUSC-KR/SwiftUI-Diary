//
//  diaryViewModel.swift
//  contentView
//
//  Created by 민수민 on 2024/02/15.
//

import Foundation

class DiaryViewModel:ObservableObject {
    
    @Published var diaries = [Diary]()
    
    func requestData(){
        NetworkManager.shared.requestDiary{ resDiary, error in
            guard let resDiary = resDiary else {
                print("Todo를 받아오는데 실패했습니다")
                return
            }
            self.diaries = resDiary
        }
    }
}
