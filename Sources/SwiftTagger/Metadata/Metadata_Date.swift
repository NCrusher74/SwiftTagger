//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/20/20.
//

import Foundation

@available(OSX 10.13, *)
enum MetadataID_Date: CaseIterable {
    case encodingTime
    case originalReleaseTime
    case purchaseDate
    case recordingDate
    case releaseDate
    case taggingTime
    case year
    
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
    
    /// Gets and sets the ID3 `TDEN` frame
    ///
    /// No equivalent atom exists for MP4, so this will create a freeform atom with the descriptor `EncodingDate`. Not all apps will recognize this atom.
    public var encodingDate: Date? {
        get {
            get(.encodingTime)
        }
        set {
            set(.encodingTime, dateValue: newValue)
        }
    }
    
    /// Gets and sets the ID3 `TDOR` frame
    ///
    /// No equivalent atom exists for MP4, so this will create a freeform atom with the descriptor `OriginalReleaseDate`. Not all apps will recognize this atom.
    public var originalReleaseDate: Date? {
        get {
            get(.originalReleaseTime)
        }
        set {
            set(.originalReleaseTime, dateValue: newValue)
        }
    }
    
    /// Gets and sets the MP4 `purd` atom
    ///
    /// No equivalent frame exists for ID3, so this will create a freeform text frame with the descriptor `PurchaseDate`. Not all apps will recognize this atom.
    public var purchaseDate: Date? {
        get {
            get(.purchaseDate)
        }
        set {
            set(.purchaseDate, dateValue: newValue)
        }
    }
    
    /// Gets and sets the MP4 `\u{00A9}day` atom or the ID3 `TDRC` frame
    ///
    /// Some apps may present this date as the `releaseDate` instead of `recordingDate`
    public var recordingDate: Date? {
        get {
            get(.recordingDate)
        }
        set {
            set(.recordingDate, dateValue: newValue)
        }
    }

    /// Gets and sets the MP4 `rldt` atom or the ID3 `TDRL` frame
    ///
    /// Some apps may present`recordingDate` as `releaseDate` and won't recognize this frame.
    public var releaseDate: Date? {
        get {
            get(.releaseDate)
        }
        set {
            set(.releaseDate, dateValue: newValue)
        }
    }
    
    /// Gets and sets the ID3 `TDTG` frame
    ///
    /// No equivalent atom exists for MP4, so this will create a freeform atom with the descriptor `TaggingDate`. Not all apps will recognize this atom.
    public var taggingDate: Date? {
        get {
            get(.taggingTime)
        }
        set {
            set(.taggingTime, dateValue: newValue)
        }
    }

    /// Gets and sets the MP4 `yrrc` atom.
    ///
    /// This accessor will attempt to set the ID3 `TYER` frame, but since this frame is only valid for ID3 version 2.3, and `SwiftTagger` uses version 2.4 by default, `SwiftTaggerID3` will throw an error that the frame is invalid for the version being used.
    /// To use this frame, chage the `tagVersion` version parameter in `ID3` portion the `write` function of `AudioFile`
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
