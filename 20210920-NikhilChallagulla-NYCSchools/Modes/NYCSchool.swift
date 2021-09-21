//
//  NYCSchool.swift
//  20210920-NikhilChallagulla-NYCSchools
//
//  Created by Nikhil on 9/19/21.
//

import Foundation

class NYCSchool: Codable {
    let id: String?
    let schoolName: String?
    let address: String?
    var satCriticalReadingAvgScore: String?
    var satMathAvgScore: String?
    var satWritinAvgScore: String?

    //  Conforms to the CodingKey protocol for encoding and decoding.
    // CodingKeys enum custom raw values to the cases matching the keys
    enum CodingKeys: String, CodingKey {
        case id = "dbn"
        case schoolName = "school_name"
        case address = "location"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritinAvgScore = "sat_writing_avg_score"
    }
}
