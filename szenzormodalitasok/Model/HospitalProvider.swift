//
//  HospitalProvideFactory.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 07..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// Imports
import Foundation

// Hospital providing protocol
protocol HospitalProviding {
    func getHospitals(onCompletion: @escaping ([HospitalModel]) -> Void)
}

// Hospital provider class
class HospitalProviderFactory {
    
    // Variables
    static var mockedIstance: HospitalProviding?
    
    // Functions
    class func getInstance() -> HospitalProviding {
        guard mockedIstance == nil else { return mockedIstance! }
        return HospitalProvider()
    }
}

// Hospital provider class
private class HospitalProvider : HospitalProviding {
    
    // Get hospitals here
    func getHospitals(onCompletion: @escaping ([HospitalModel]) -> Void) {
        DispatchQueue.global(qos: .default).async {
            onCompletion([
                
                // Here is the hospital list that you want to display in hospital page
                
                HospitalModel(name: "Dr. Kenessey Albert Kórház-Rendelőintézet", hospitalSCountry: "Nógrád", latitude: 48.080474, longitude: 19.311020, distanceFromUser: 0.0),
                HospitalModel(name: "Szent Lázár Megyei Kórház", hospitalSCountry: "Nógrád", latitude: 48.117368, longitude: 19.814767, distanceFromUser: 0.0),
                HospitalModel(name: "Szent Margit Kórház", hospitalSCountry: "Budapest - III. Kerület", latitude: 47.540093, longitude: 19.030192, distanceFromUser: 0.0),
                HospitalModel(name: "Szent János Kórház", hospitalSCountry: "Budapest - XII. Kerület", latitude: 47.508667, longitude: 19.005729, distanceFromUser: 0.0),
                HospitalModel(name: "Magyar Honvédség Egészségügyi Központ Honvédkórház", hospitalSCountry: "Budapest - XIII. Kerület", latitude: 47.531372, longitude: 19.074702, distanceFromUser: 0.0),
                HospitalModel(name: "Dél-pesti Centrumkórház - Országos Hematológiai és Infektológiai Intézet - Szent István telephely", hospitalSCountry: "Budapest - IX. Kerület", latitude: 47.477722, longitude: 19.089355, distanceFromUser: 0.0),
                HospitalModel(name: "SZTE Szent-Györgyi Albert Klinikai Központ Gyermekgyógyászati Klinika és Gyermek-Egészségügyi Központ", hospitalSCountry: "Csongrád", latitude: 46.245357, longitude: 20.150484, distanceFromUser: 0.0),
                HospitalModel(name: "Pécsi Honvéd Kórház", hospitalSCountry: "Baranya", latitude: 46.052106, longitude: 18.229541, distanceFromUser: 0.0),
                HospitalModel(name: "Petz Aladár Megyei Oktató Kórház", hospitalSCountry: "Győr-Moson-Sopron", latitude: 47.677856, longitude: 17.678832, distanceFromUser: 0.0),
                HospitalModel(name: "Borsod-Abaúj-Zemplén Megyei Központi Kórház és Egyetemi Oktatókórház Semmelweis Tagkórház", hospitalSCountry: "Szabolcs-Szatmár-Bereg", latitude: 48.097646, longitude: 20.815311, distanceFromUser: 0.0)
            ])
        }
    }
}
