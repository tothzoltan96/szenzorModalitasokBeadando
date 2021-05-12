//
//  MedicineModel.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 07..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// Imports
import Foundation

// MedicinesID typealias
typealias MedicineID = Int

// MedicineModel struct
struct MedicineModel : Codable {
    
    // Variables
    let medicineID: MedicineID
    let medicineName: String
    let factoryMedicineName: String
    let activeSubstanceName: String
    let package: String
    let recommendedDosage: String
    let administrationMethod: String
    let suggestionForUse: String
    let warningsContraindications: String
    
    // Null Object Design Pattern
    static var empty = MedicineModel(
        medicineID: 0,
        medicineName: "",
        factoryMedicineName: "",
        activeSubstanceName: "",
        package: "",
        recommendedDosage: "",
        administrationMethod: "",
        suggestionForUse: "",
        warningsContraindications: "")
}
