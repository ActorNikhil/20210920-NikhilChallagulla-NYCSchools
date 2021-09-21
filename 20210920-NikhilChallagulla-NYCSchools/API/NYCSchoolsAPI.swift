//
//  NYCSchoolsAPI.swift
//  20210920-NikhilChallagulla-NYCSchools
//
//  Created by Nikhil on 9/19/21.
//

import Foundation


final class NYCSchoolsAPI: NSObject {
    let service: Service
    
    convenience override init() {
        self.init(service: NetworkingService())
    }
    
     init(service: Service) {
        self.service =  service
    }
    //MARK: - Fetch DATA from API and decode instances of a data type from JSON objects.
    func nycSchoolsAPIAsync(request: Requests = APIRequest.schools, completion: @escaping (Result<[NYCSchool], Error>) -> (Void)) {
        service.get(request: request) { [weak self] (result) in
            guard self == self else { return }
            switch result {
            case .success(let data):
                do {
                    let schools: [NYCSchool] = try JSONDecoder().decode([NYCSchool].self, from: data)
                    debugPrint(schools)
                    DispatchQueue.main.async {
                        completion(.success(schools))
                    }
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    //MARK: - Fetch DATA from API and decodes instances of a data type from JSON objects.
    func nycSchoolsSatScoresAPIAsync(request: Requests = APIRequest.schoolsSatScores, completion: @escaping (Result<[NYCSchool], Error>) -> (Void)) {
        service.get(request: request) { [weak self] (result) in
            guard self == self else { return }
            switch result {
            case .success(let data):
                do {
                    let schools: [NYCSchool] = try JSONDecoder().decode([NYCSchool].self, from: data)
                    debugPrint(schools)
                    DispatchQueue.main.async {
                        completion(.success(schools))
                    }
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

enum APIRequest: String, Requests {
    
    /// End points 
    case schools = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    case schoolsSatScores = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"

    var url: URL {
        return URL(string: rawValue)!
    }
}
