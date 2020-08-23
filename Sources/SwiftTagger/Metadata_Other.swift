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
    case contentAdvisory
    case coverArt
    case fileType
    case initialKey
    case involvedPeopleList
    case languages
    case mediaType
    case musicianCreditsList
    case predefinedGenre
    case rating
    case unknown
    
    var metadataItem: MetadataItem {
        switch self {
            case .contentAdvisory: return .contentAdvisory
            case .coverArt: return .coverArt
            case .fileType: return .fileType
            case .initialKey: return .initialKey
            case .involvedPeopleList: return .involvedPeopleList
            case .languages: return .languages
            case .mediaType: return .mediaType
            case .musicianCreditsList: return .musicianCreditsList
            case .predefinedGenre: return .predefinedGenre
            case .rating: return .rating
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
    public var involvementCreditsList: [ InvolvedPersonCredits : [String]] {
        get {
            var outputDictionary = [ InvolvedPersonCredits : [String]]()
            switch library {
                case .id3:
                    for (key, value) in id3Tag.involvementCreditsList {
                        if let credit = InvolvedPersonCredits(id3Credit: key) {
                            outputDictionary[credit] = value
                        }
                }
                case .mp4:
                    for (key, value) in mp4Tag.involvementCreditsList {
                        if let credit = InvolvedPersonCredits(mp4Credit: key) {
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
                        for (key, value) in newValue {
                            if let credit = SwiftTaggerID3.InvolvedPersonCredits(rawValue: key.rawValue) {
                                id3Tag.involvementCreditsList[credit] = value
                            }
                        }
                    } else {
                        id3Tag.clearInvolvementCreditList()
                }
                case .mp4:
                    if !newValue.isEmpty {
                        for (key, value) in newValue {
                            if let credit = SwiftTaggerMP4.InvolvedPersonCredits(rawValue: key.rawValue) {
                                mp4Tag.involvementCreditsList[credit] = value
                                let valueString = value.joined(separator: ";")
                                switch credit {
                                    case .arranger:
                                        self.arranger = valueString
                                    case .artDirection:
                                        self.artDirector = valueString
                                    case .composer:
                                        self.composer = valueString
                                    case .conductor:
                                        self.conductor = valueString
                                    case .director:
                                        self.director = valueString
                                    case .executiveProducer:
                                        self.executiveProducer = valueString
                                    case .lyricist:
                                        self.lyricist = valueString
                                    case .producer:
                                        self.producer = valueString
                                    case .publisher:
                                        self.publisher = valueString
                                    case .soundEngineer:
                                        self.soundEngineer = valueString
                                    case .writer:
                                        self.writer = valueString
                                    default: break
                                }
                            }
                        }
                    } else {
                        mp4Tag.clearInvolvementCreditList()
                }
            }
        }
    }
    
    public var performerCreditList: [ MusicianAndPerformerCredits : [String]] {
        get {
            var outputDictionary = [ MusicianAndPerformerCredits : [String]]()
            switch library {
                case .id3:
                    for (key, value) in id3Tag.performanceCreditsList {
                        if let credit = MusicianAndPerformerCredits(id3Credit: key) {
                            outputDictionary[credit] = value
                        }
                    }
                case .mp4:
                    for (key, value) in mp4Tag.performanceCreditsList {
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
                        for (key, value) in newValue {
                            if let credit = SwiftTaggerID3.MusicianAndPerformerCredits(rawValue: key.rawValue) {
                                id3Tag.performanceCreditsList[credit] = value
                            }
                        }
                    } else {
                        id3Tag.clearPerformanceCreditList()
                }
                case .mp4:
                    if !newValue.isEmpty {
                        for (key, value) in newValue {
                            if let credit = SwiftTaggerMP4.MusicianAndPerformerCredits(rawValue: key.rawValue) {
                                mp4Tag.performanceCreditsList[credit] = value
                                let valueString = value.joined(separator: ";")
                                switch credit {
                                    case .featuredArtist:
                                        self.artist = valueString
                                    case .soloist:
                                        self.soloist = valueString
                                    case .narrator:
                                        self.narrator = valueString
                                    case .performer:
                                        self.performers = value
                                    default: break
                                }
                            }
                        }
                    } else {
                        mp4Tag.clearPerformanceCreditList()
                }
            }
        }
    }
}
