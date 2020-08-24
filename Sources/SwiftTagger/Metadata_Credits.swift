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
@available(OSX 10.13, *)
extension AudioFile {
    public mutating func addInvolvementCredit(_ role: InvolvedPersonCredits, person: String) {
        switch library {
            case .mp4:
                if let role = SwiftTaggerMP4.InvolvedPersonCredits(rawValue: role.rawValue) {
                    mp4Tag.addInvolvementCredit(role, person: person)
            }
            case .id3:
                if let role = SwiftTaggerID3.InvolvedPersonCredits(rawValue: role.rawValue) {
                    id3Tag.addInvolvementCredit(role: role, person: person)
            }
        }
    }
    public mutating func addPerformanceCredit(_ role: MusicianAndPerformerCredits, person: String) {
        switch library {
            case .mp4:
                if let role = SwiftTaggerMP4.MusicianAndPerformerCredits(rawValue: role.rawValue) {
                    mp4Tag.addPerformanceCredit(role, person: person)
            }
            case .id3:
                if let role = SwiftTaggerID3.MusicianAndPerformerCredits(rawValue: role.rawValue) {
                    id3Tag.addPerformanceCredit(role: role, person: person)
            }
        }
    }


    public mutating func removeInvolvementCredit(_ role: InvolvedPersonCredits) {
        switch library {
            case .id3:
                if let role = SwiftTaggerID3.InvolvedPersonCredits(rawValue: role.rawValue) {
                    id3Tag.removeInvolvementCredit(role: role)
            }
            case .mp4:
                if let role = SwiftTaggerMP4.InvolvedPersonCredits(rawValue: role.rawValue) {
                    mp4Tag.removeInvolvementCredit(role)
            }
        }
    }
    public mutating func removePerformanceCredit(_ role: MusicianAndPerformerCredits) {
        switch library {
            case .id3:
                if let role = SwiftTaggerID3.MusicianAndPerformerCredits(rawValue: role.rawValue) {
                    id3Tag.removePerformanceCredit(role: role)
            }
            case .mp4:
                if let role = SwiftTaggerMP4.MusicianAndPerformerCredits(rawValue: role.rawValue) {
                    mp4Tag.removePerformanceCredit(role)
            }
        }
    }

    public mutating func clearInvolvementCreditList() {
        switch library {
            case .id3:
                id3Tag.clearInvolvementCreditList()
            case .mp4:
                mp4Tag.clearInvolvementCreditList()
        }
    }
    public mutating func clearPerformanceCreditList() {
        switch library {
            case .id3:
                id3Tag.clearPerformanceCreditList()
            case .mp4:
                mp4Tag.clearPerformanceCreditList()
        }
    }

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
    
    public var performanceCreditsList: [ MusicianAndPerformerCredits : [String]] {
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
                                    case .artist:
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
