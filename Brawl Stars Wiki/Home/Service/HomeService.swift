//
//  HomeService.swift
//  Brawl Stars Wiki
//
//  Created by admin on 09/03/24.
//

import Foundation

func getBrawlerList(completion: @escaping(Result<[Brawler],NetworkError>) -> Void) {
//    func getBrawlerList(completion: @escaping(Result<[Brawler],NetworkError>) -> Void) {
    
    let urlString: String = "https://hire-fast-api-backend.vercel.app/getBrawl"
//    let urlString: String = "https://run.mocky.io/v3/927313f9-15de-40f5-9e15-327d4ebe273b"
    
    guard let url: URL = URL(string: urlString) else {
        completion(.failure(.invalidURL(url: urlString)))
        return
        
    }
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        if let error {
            print("ERROR \(#function) Detalhe do erro: \(error.localizedDescription)")
            DispatchQueue.main.sync {
                completion(.failure(.networkFailure(error)))
            }
            return
        }
        
        guard let data else {
            DispatchQueue.main.async {
                completion(.failure(.noData))
            }
            return
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            DispatchQueue.main.async {
                completion(.failure(.invalidResponse))
            }
            return
        }
        
        do {
            let brawlerList: BrawlerList = try JSONDecoder().decode(BrawlerList.self, from: data)
            print("SUCCESS -> \(#function)")
            DispatchQueue.main.async {
                completion(.success(brawlerList.brawler))
            }
            
            
        } catch {
            print("ERROR -> \(#function)")
            DispatchQueue.main.async {
                completion(.failure(NetworkError.decodingError(error)))
            }
        }
    }
    task.resume()
}
