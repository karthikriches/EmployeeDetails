//
//  API.swift
//  Employee
//
//  Created by Karthik on 15/04/21.
//

import Foundation

class API {
    let url = URL(string: "https://us-central1-fwd-api.cloudfunctions.net/getUsersList")
    
    static let shared = API()

    func loadAPI(completion:  @escaping ([User])->Void) {
        URLSession.shared.dataTask(with: url!) {
            data,response,error in
            guard let data =  data else {
                return
            }
            do {
               let result = try JSONDecoder().decode(Root.self, from: data)
                completion(result.result)
            } catch {
                
            }
            
        }.resume()
    }
    
    private init() {
        
    }
    
}
