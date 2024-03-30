//
//  HomeService.swift
//  Brawl Stars Wiki
//
//  Created by admin on 09/03/24.
//

import Foundation



class HomeService {
    
    func getBrawlerList(completion: @escaping(Result<BrawlerList,NetworkError>) -> Void) {
        
        let urlString: String = "https://hire-fast-api-backend.vercel.app/getBrawl"
//        let urlString: String = "https://run.mocky.io/v3/927313f9-15de-40f5-9e15-327d4ebe273b"
        
        guard let url: URL = URL(string: urlString) else {
            completion(.failure(.invalidURL(url: urlString)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error {
                print("ERROR \(#function) Detalhe do erro: \(error.localizedDescription)")
                    completion(.failure(.networkFailure(error)))
                return
            }
            
            guard let data else {
                    completion(.failure(.noData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completion(.failure(.invalidResponse))
                return
            }
            
            do {
//                let decoder = JSONDecoder()
//                let model = try decoder.decode(BrawlerList.self, from: data)
//                print("SUCCESS -> \(#function)")
//                completion(.success(model))
                let brawlerList: BrawlerList = try JSONDecoder().decode(BrawlerList.self, from: data)
                completion(.success(brawlerList))
            } catch {
                print("ERROR -> \(#function)")
                    completion(.failure(NetworkError.decodingError(error)))
            }
        }
        task.resume()
    }
}
