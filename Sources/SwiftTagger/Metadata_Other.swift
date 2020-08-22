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
enum MetadataID_Other: CaseIterable {
    case artDirector
    case contentAdvisory
    case coverArt
    case director
    case executiveProducer
    case fileType
    case initialKey
    case involvedPeopleList
    case languages
    case mediaType
    case musicianCreditsList
    case performers
    case predefinedGenre
    case producer
    case rating
    case soundEngineer
    case soloist
    case unknown
    
    var metadataItem: MetadataItem {
        switch self {
            case .artDirector: return .artDirector
            case .contentAdvisory: return .contentAdvisory
            case .coverArt: return .coverArt
            case .director: return .director
            case .executiveProducer: return .executiveProducer
            case .fileType: return .fileType
            case .initialKey: return .initialKey
            case .involvedPeopleList: return .involvedPeopleList
            case .languages: return .languages
            case .mediaType: return .mediaType
            case .musicianCreditsList: return .musicianCreditsList
            case .performers: return .performers
            case .predefinedGenre: return .predefinedGenre
            case .producer: return .producer
            case .rating: return .rating
            case .soundEngineer: return .soundEngineer
            case .soloist: return .soloist
            case .unknown: return .unknown
        }
    }
}

@available(OSX 10.13, *)
extension AudioFile {
//    public func addInvolvementCredit
//    public func addPerformanceCredit
//    public func clearInvolvementCreditList
//    public func clearPerformerCreditList
//    public func removeCreditForInvolvement(role: InvolvedPersonCredits)
//    public func removeCreditForPerformance(role: MusicianAndPerformerCredits)
//    public var involvedPersonCreditList: [ InvolvedPersonCredits : [String]]
    public var performerCreditList: [ MusicianAndPerformerCredits : [String]] {
        get {
            var outputDictionary = [ MusicianAndPerformerCredits : [String]]()
            switch library {
                case .id3:
                    let dictionary = id3Tag.musicianCreditsList
                    for (key, value) in dictionary ?? [:] {
                        if let credit = MusicianAndPerformerCredits(id3Credit: key) {
                            outputDictionary[credit] = value
                        }
                    }
                case .mp4:
                    let dictionary = mp4Tag.performanceCreditsList
                    for (key, value) in dictionary {
                        if let credit = MusicianAndPerformerCredits(mp4Credit: key) {
                            outputDictionary[credit] = value
                        }
                }
            }
            return outputDictionary
        }
        set {
            switch library {
                case .id3:
                    if !newValue.isEmpty {
                        var dictionary = id3Tag.musicianCreditsList ?? [:]
                        for (key, value) in newValue {
                            if let credit = SwiftTaggerID3.MusicianAndPerformerCredits(rawValue: key.rawValue) {
                                dictionary[credit] = value
                            }
                        }
                        id3Tag.musicianCreditsList = dictionary
                    } else {
                        id3Tag.clearMusicianCreditsList()
                }
                case .mp4:
                    if !newValue.isEmpty {
                        var dictionary = mp4Tag.performanceCreditsList
                        for (key, value) in newValue {
                            if let credit = SwiftTaggerMP4.MusicianAndPerformerCredits(rawValue: key.rawValue) {
                                dictionary[credit] = value
                            }
                        }
                        mp4Tag.performanceCreditsList = dictionary
                    } else {
                        mp4Tag.clearPerformanceCreditList()
                }
            }
        }
    }
}
