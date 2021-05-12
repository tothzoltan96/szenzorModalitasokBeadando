//
//  MedicineProvider.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 07..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// Imports
import Foundation

// Medicine providing protocol
protocol MedicineProviding {
    func getMedicines(onCompletion: @escaping ([MedicineModel]) -> Void)
}

// Medicines provider class
class MedicineProviderFactory {
    static var mockedInstance: MedicineProviding?
    class func getIstance() -> MedicineProviding {
        guard mockedInstance == nil else { return mockedInstance! }
        return MedicineProvider()
    }
}

// Medicine providder class
private class MedicineProvider: MedicineProviding {
    
    // Variables
    var medicines = [MedicineModel]()
    
    // Functions
    func getMedicines(onCompletion: @escaping ([MedicineModel]) -> Void) {
        DispatchQueue.global(qos: .default).async {
            onCompletion(self.medicinesFromFile())
        }
    }
    private func medicinesFromFile() -> [MedicineModel] {
        
        var result = [MedicineModel]()
        
        if let path = Bundle.main.path(forResource: "medicines", ofType: "json"),
            let jsonFileDate = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            result = try! JSONDecoder().decode([MedicineModel].self, from: jsonFileDate)
        } else {
            result = []
        }
        return result
    }
}
