//
//  Service.swift
//  20210920-NikhilChallagulla-NYCSchools
//
//  Created by Nikhil on 9/19/21.
//

import Foundation

// Mark: - Networking - if you want to create your own service layer

protocol Requests {
    var url: URL { get }
    
}
/// define the service protocol
protocol Service {
    func get(request: Requests, completion: @escaping (Result<Data, Error>) -> Void)
}

/// A  Common Network service class for API request
final class  NetworkingService: Service {
    func get(request: Requests, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: request.url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(ServiceError.noData))
                return
            }
            completion(.success(data))
        }.resume()
    }
    
}

enum ServiceError: Error {
    case noData
}
