//
//  HospitalModel.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 07..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// HospitalModel struct
struct HospitalModel {
    
    // Variables
    var name: String
    var hospitalSCountry: String
    var latitude: Double
    var longitude: Double
    var distanceFromUser: Double
    
    // Null Object Design Pattern
    static let empty = HospitalModel(name: "", hospitalSCountry: "", latitude: 0.0, longitude: 0.0, distanceFromUser: 0.0)
}
