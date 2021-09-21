//
//  NYCSchoolsListViewModel.swift
//  20210920-NikhilChallagulla-NYCSchools
//
//  Created by Nikhil on 9/19/21.
//

import Foundation

class NYCSchoolViewModel {
    var id: String?
    var schoolName: String?
    var address: String?
    var satCriticalReadingAvgScore: String?
    var satMathAvgScore: String?
    var satWritinAvgScore: String?

    init(source: NYCSchool) {
        self.id = source.id
        self.schoolName = source.schoolName
        self.address = "Address: \(source.address ?? "NA")"
        self.satCriticalReadingAvgScore =  source.satCriticalReadingAvgScore
        self.satMathAvgScore =  source.satMathAvgScore
        self.satWritinAvgScore = source.satWritinAvgScore
    }
}

class NYCSchoolsListViewModel {
    
    /// create an instance NYCSchoolViewModel List
    private (set) var nycSchoolViewModel: [NYCSchoolViewModel] = []
    /// function to call  schools list  API
    //MARK: -  API Request
    func requestForNYCSchoolsData(_ completion: @escaping () -> ()) {

        NYCSchoolsAPI().nycSchoolsAPIAsync { result in
            switch result {
            case .success(let data):
                self.nycSchoolViewModel = data.compactMap(NYCSchoolViewModel.init)
                self.requestForSatScores {
                    completion()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    /// function to call  SAT score API
    func requestForSatScores(_ completion: @escaping () -> ())  {
        NYCSchoolsAPI().nycSchoolsSatScoresAPIAsync { result in
            switch result {
            case .success(let data):
                self.addSatScoreToHighSchool(data) {
                    completion()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

    }
    
    /// - Parameter satScoreObject: Data of Array composed with Dictionary
    private func addSatScoreToHighSchool(_ satScoreObject: Any, completion: @escaping () -> ()) {
        guard let nycSchoolsWithSatScoreArr = satScoreObject as? [NYCSchool] else{
            return
        }
        
        for  nycSchoolsWithSatScore in nycSchoolsWithSatScoreArr {
            
            if let matchedDBN = nycSchoolsWithSatScore.id {
                
                let nycSchool = self.nycSchoolViewModel.first(where: { (nycHighSchool) -> Bool in
                    return nycHighSchool.id == matchedDBN
                })
                
                guard nycSchool != nil else{
                    continue
                }
                if let satMathAvgScore = nycSchoolsWithSatScore.satMathAvgScore {
                    nycSchool?.satMathAvgScore = satMathAvgScore
                }
                
                if let satWritinAvgScore = nycSchoolsWithSatScore.satWritinAvgScore {
                    nycSchool?.satWritinAvgScore = satWritinAvgScore
                }
                
                if let satCriticalReadingAvgScore =  nycSchoolsWithSatScore.satCriticalReadingAvgScore {
                    nycSchool?.satCriticalReadingAvgScore = satCriticalReadingAvgScore
                }
                
            }
        }
        completion()
    }

}
