//
//  Date.swift
//  Movie DB
//
//  Created by Indra on 12/06/20.
//  Copyright © 2020 Indra. All rights reserved.
//

import Foundation

extension Date {
    
    func formattedDateFromString(dateString: String, withFormat format: String) -> String? {
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-mm-dd"
        
        if let date = inputFormatter.date(from: dateString) {
            
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = format
            
            return outputFormatter.string(from: date)
        }
        
        return nil
    }
}
