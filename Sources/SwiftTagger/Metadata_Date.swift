//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/20/20.
//

import Foundation
import SwiftTaggerID3
import SwiftTaggerMP4
@available(OSX 10.13, *)
enum MetadataID_Date: CaseIterable {
    case encodingTime // date 2
    case originalReleaseTime // date 3
    case purchaseDate // date 4
    case recordingDate // date 5
    case releaseDate // date 6
    case taggingTime // date 7
    case year // date 9
    
    var metadataItem: MetadataItem {
        switch self {
            case .encodingTime: return .encodingTime
            case .originalReleaseTime: return .originalReleaseTime
            case .purchaseDate: return .purchaseDate
            case .recordingDate: return .recordingDate
            case .releaseDate: return .releaseDate
            case .taggingTime: return .taggingTime
            case .year: return .year
        }
    }
}

@available(OSX 10.13, *)
extension AudioFile {
    public var encodingDate: Date? {
        get {
            get(.encodingTime)
        }
        set {
            set(.encodingTime, dateValue: newValue)
        }
    }
    
    public var originalReleaseDate: Date? {
        get {
            get(.originalReleaseTime)
        }
        set {
            set(.originalReleaseTime, dateValue: newValue)
        }
    }
    
    public var purchaseDate: Date? {
        get {
            get(.purchaseDate)
        }
        set {
            set(.purchaseDate, dateValue: newValue)
        }
    }
    
    public var recordingDate: Date? {
        get {
            get(.recordingDate)
        }
        set {
            set(.recordingDate, dateValue: newValue)
        }
    }

    public var releaseDate: Date? {
        get {
            get(.releaseDate)
        }
        set {
            set(.releaseDate, dateValue: newValue)
        }
    }
    
    public var taggingDate: Date? {
        get {
            get(.taggingTime)
        }
        set {
            set(.taggingTime, dateValue: newValue)
        }
    }

    public var year: Int? {
        get {
            if let date = get(.year) {
                let calendar = Calendar(identifier: .iso8601)
                let int = calendar.component(.year, from: date)
                return int
            } else {
                return nil
            }
        }
        set {
            let calendar = Calendar(identifier: .iso8601)
            var components = DateComponents()
            components.year = newValue
            let date = calendar.date(from: components)
            set(.year, dateValue: date)
        }
    }

}
