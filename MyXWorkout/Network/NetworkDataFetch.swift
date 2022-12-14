//
//  NetworkDataFetch.swift
//  MyXWorkout
//
//  Created by Test on 16/08/22.
//

import Foundation

class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    private init() {}
    
    func fetchWether(responce: @escaping (WeatherModel?, Error?) -> Void) {
        
        NetworkRequest.shared.requestData { result in
            
            switch result {
            case .success(let data):
                do {
                    let weather = try JSONDecoder().decode(WeatherModel.self, from: data)
                    responce(weather, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print("Error \(error.localizedDescription)")
                responce(nil, error)
            }
        }
    }
}
