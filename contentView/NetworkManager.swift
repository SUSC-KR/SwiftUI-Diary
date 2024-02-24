//
//  netWorkManager.swift
//  contentView
//
//  Created by 민수민 on 2024/02/15.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    //누군가가 초기화하지 않도록, 이 함수 내에서만 사용할 수 있도록 설정
    private init(){}
    
    
    // MARK: - POST
    
//    func postDiary(completed: @escaping(String?, String?) -> ()){
//        
//    }
    
    // MARK: - Request
    func requestDiary (completed: @escaping([Diary]?, String?)->()){
        let endPoint = "https://65c22e2df7e6ea59682ace4e.mockapi.io/diary"
        
        guard let url = URL(string: endPoint) else {
            completed(nil, "잘못된 url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){data, response, error in
            if error != nil {
                completed(nil, "url에 문제있음")
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "url에서 응답없음")
                return
            }
            guard let data = data else {
                completed(nil, "데이터를 받지 못했습니다")
                return
            }
            
            do {
                let decodedDiary = try JSONDecoder().decode([Diary].self, from: data)
                
                completed(decodedDiary, nil)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
