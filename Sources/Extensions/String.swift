//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 9/30/20.
//

import Foundation

extension String {
    @available(OSX 10.12, *)
    var attemptDateFromString: Date? {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime]
        isoFormatter.timeZone = TimeZone(secondsFromGMT: 0) ?? .current
        
        let formats: [String] = ["d MMM yyyy HH:mm:ss", "yyyy-MM-ddTHH:mm", "MM-dd-yyyy HH:mm","yyyy-MM-ddTHH", "MMM d, yyyy", "d MMM yyyy", "yyyy-MM-dd", "MM/dd/yyyy", "dd.MM.yy", "MM-dd-yyyy", "MMMM yyyy", "yyyy-MM", "yyyy"]
        let dateFormatters: [DateFormatter] = formats.map { format in
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = format
            return formatter
        }
        
        if let date = isoFormatter.date(from: self) {
            return date
        } else {
            for format in dateFormatters {
                if let date = format.date(from: self) {
                    return date
                } else {
                    return nil
                }
            }; return nil
        }
    }
}
