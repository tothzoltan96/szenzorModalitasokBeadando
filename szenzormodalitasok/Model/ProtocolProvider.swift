//
//  ProtocolProvider.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 07..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// Imports
import Foundation

// Protocol providing protocol
protocol ProtocolProviding {
    func getProtocols(onCompletion: @escaping ([ProtocolModel]) -> Void)
}

// Protocol provider class
class ProtocolProviderFactory {
    
    // Variables
    static var mockedIstance: ProtocolProviding?
    
    // Functions
    class func getInstance() -> ProtocolProviding {
        guard mockedIstance == nil else { return mockedIstance! }
        return ProtocolProvider()
    }
}

// Protocol provider class
private class ProtocolProvider : ProtocolProviding {
    
    // Get protocols here
    func getProtocols(onCompletion: @escaping ([ProtocolModel]) -> Void) {
        DispatchQueue.global(qos: .default).async {
            onCompletion([
                
                // Here is the protocol list that you want to display in protocol page --> I HAVE TO DONE THIS!!!!!
                
                ProtocolModel(name: "AProtokoll - 1", url: "http://www.africau.edu/images/default/sample.pdf"),
                ProtocolModel(name: "ABProtokoll - 2", url: "https://varaharmas.hu/docs/Flowchart-of-clinical-and-laboratory-protocols-for-study-participants-in-the-Pediatric.pdf"),
                ProtocolModel(name: "ZProtokoll - 45", url: "http://www.africau.edu/images/default/sample.pdf"),
                ProtocolModel(name: "XProtokoll - 30", url: "https://varaharmas.hu/docs/Flowchart-of-clinical-and-laboratory-protocols-for-study-participants-in-the-Pediatric.pdf"),
                ProtocolModel(name: "XPRO-tokoll - 34", url: "http://www.africau.edu/images/default/sample.pdf"),
                ProtocolModel(name: "BDProtkoll - 30", url: "https://varaharmas.hu/docs/Flowchart-of-clinical-and-laboratory-protocols-for-study-participants-in-the-Pediatric.pdf"),
                ProtocolModel(name: "CBProtokoll - 44", url: "http://www.africau.edu/images/default/sample.pdf"),
                ProtocolModel(name: "CZ Protokoll - 51", url: "https://varaharmas.hu/docs/Flowchart-of-clinical-and-laboratory-protocols-for-study-participants-in-the-Pediatric.pdf"),
                ProtocolModel(name: "FZH Protokoll - 40", url: "http://www.africau.edu/images/default/sample.pdf"),
                ProtocolModel(name: "ATH protokoll - 14", url: "https://varaharmas.hu/docs/Flowchart-of-clinical-and-laboratory-protocols-for-study-participants-in-the-Pediatric.pdf"),
                ProtocolModel(name: "ABH Protokoll - 40", url: "http://www.africau.edu/images/default/sample.pdf"),
                ProtocolModel(name: "AZH Protokoll - 60", url: "https://varaharmas.hu/docs/Flowchart-of-clinical-and-laboratory-protocols-for-study-participants-in-the-Pediatric.pdf"),
                ProtocolModel(name: "GZT Protkoll - 40", url: "http://www.africau.edu/images/default/sample.pdf"),
                ProtocolModel(name: "D Protokoll - 30", url: "https://varaharmas.hu/docs/Flowchart-of-clinical-and-laboratory-protocols-for-study-participants-in-the-Pediatric.pdf"),
                ProtocolModel(name: "T40 - Protokoll - 045", url: "http://www.africau.edu/images/default/sample.pdf"),
                ProtocolModel(name: "ZG - Protokoll - 01", url: "https://varaharmas.hu/docs/Flowchart-of-clinical-and-laboratory-protocols-for-study-participants-in-the-Pediatric.pdf"),
                ProtocolModel(name: "D Protkoll - 50", url: "http://www.africau.edu/images/default/sample.pdf"),
                ProtocolModel(name: "ZG6 Protokoll - 20", url: "https://varaharmas.hu/docs/Flowchart-of-clinical-and-laboratory-protocols-for-study-participants-in-the-Pediatric.pdf"),
                ProtocolModel(name: "ACG Protokoll - 40", url: "http://www.africau.edu/images/default/sample.pdf"),
                ProtocolModel(name: "EFG Protokoll - 40", url: "https://varaharmas.hu/docs/Flowchart-of-clinical-and-laboratory-protocols-for-study-participants-in-the-Pediatric.pdf")
            ])
        }
    }
}
