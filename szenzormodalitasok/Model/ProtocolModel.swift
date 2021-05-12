//
//  ProtocolModel.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 07..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// ProtocolModel struct
struct ProtocolModel {
    var name: String
    var url: String
    
    // Null Object Design Pattern
    static let empty = ProtocolModel(name: "", url: "")
}
