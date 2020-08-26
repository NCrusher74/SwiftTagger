//
//  File.swift
//
//
//  Created by Nolaine Crusher on 8/18/20.
//

import Foundation
import SwiftTaggerID3
import SwiftTaggerMP4

@available(OSX 10.13, *)
enum MetadataID_PartOfTotal: CaseIterable {
    case discNumber
    case trackNumber
    
    var metadataItem: MetadataItem {
        switch self {
            case .discNumber: return .discNumber
            case .trackNumber: return .trackNumber
        }
    }
}

@available(OSX 10.13, *)
extension AudioFile {
    public var discNumber: (disc: Int?, totalDiscs: Int?) {
        get {
            get(.discNumber)
        }
        set {
            let part = newValue.disc
            let total = newValue.totalDiscs
            set(.discNumber, tupleValue: (part, total))
        }
    }
    
    public var trackNumber: (track: Int?, totalTracks: Int?) {
        get {
            get(.trackNumber)
        }
        set {
            let part = newValue.track
            let total = newValue.totalTracks
            set(.trackNumber, tupleValue: (part, total))
        }
    }

}
