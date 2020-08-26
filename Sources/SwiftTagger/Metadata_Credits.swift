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
extension AudioFile {
    
    public mutating func addInvolvementCredit(_ role: InvolvementCredits, person: String) {
        switch library {
            case .mp4:
                switch role {
                    case .arranger:
                        if let existingString = self.arranger {
                            let newString = checkAndMergeCreditStrings(existingCredit: existingString, newCredit: person)
                            self.arranger = newString
                        } else {
                            self.arranger = person
                    }
                    case .artDirection:
                        if let existingString = self.artDirector {
                            let newString = checkAndMergeCreditStrings(existingCredit: existingString, newCredit: person)
                            self.artDirector = newString
                        } else {
                            self.artDirector = person
                    }
                    case .composer:
                        if let existingString = self.composer {
                            let newString = checkAndMergeCreditStrings(existingCredit: existingString, newCredit: person)
                            self.composer = newString
                        } else {
                            self.composer = person
                    }
                    case .conductor:
                        if let existingString = self.conductor {
                            let newString = checkAndMergeCreditStrings(existingCredit: existingString, newCredit: person)
                            self.conductor = newString
                        } else {
                            self.conductor = person
                    }
                    case .director:
                        if let existingString = self.director {
                            let newString = checkAndMergeCreditStrings(existingCredit: existingString, newCredit: person)
                            self.director = newString
                        } else {
                            self.director = person
                    }
                    case .executiveProducer:
                        if let existingString = self.executiveProducer {
                            let newString = checkAndMergeCreditStrings(existingCredit: existingString, newCredit: person)
                            self.executiveProducer = newString
                        } else {
                            self.executiveProducer = person
                    }
                    case .lyricist:
                        if let existingString = self.lyricist {
                            let newString = checkAndMergeCreditStrings(existingCredit: existingString, newCredit: person)
                            self.lyricist = newString
                        } else {
                            self.lyricist = person
                    }
                    case .producer:
                        if let existingString = self.producer {
                            let newString = checkAndMergeCreditStrings(existingCredit: existingString, newCredit: person)
                            self.producer = newString
                        } else {
                            self.producer = person
                    }
                    case .publisher:
                        if let existingString = self.publisher {
                            let newString = checkAndMergeCreditStrings(existingCredit: existingString, newCredit: person)
                            self.publisher = newString
                        } else {
                            self.publisher = person
                    }
                    case .songwriter:
                        if let existingString = self.songwriter {
                            let newString = checkAndMergeCreditStrings(existingCredit: existingString, newCredit: person)
                            self.songwriter = newString
                        } else {
                            self.songwriter = person
                    }
                    case .soundEngineer:
                        if let existingString = self.soundEngineer {
                            let newString = checkAndMergeCreditStrings(existingCredit: existingString, newCredit: person)
                            self.soundEngineer = newString
                        } else {
                            self.soundEngineer = person
                    }
                    case .writer:
                        if let existingString = self.writer {
                            let newString = checkAndMergeCreditStrings(existingCredit: existingString, newCredit: person)
                            self.writer = newString
                        } else {
                            self.writer = person
                    }
                    default:
                        if let existingString = self[role.rawValue] {
                            let newString = checkAndMergeCreditStrings(existingCredit: existingString, newCredit: person)
                            self[role.rawValue] = newString
                        } else {
                            self[role.rawValue] = person
                    }
            }
            case .id3:
                id3Tag.addInvolvementCredit(role: role, person: person)
        }
    }
    
    public mutating func addPerformanceCredit(_ role: PerformanceCredits, person: String) {
        switch library {
            case .mp4:
                switch role {
                    case .artist:
                        if let existingString = self.artist {
                            let newString = checkAndMergeCreditStrings(existingCredit: existingString, newCredit: person)
                            self.artist = newString
                        } else {
                            self.artist = person
                    }
                    case .narrator:
                        if let existingString = self.narrator {
                            let newString = checkAndMergeCreditStrings(existingCredit: existingString, newCredit: person)
                            self.narrator = newString
                        } else {
                            self.narrator = person
                    }
                    case .soloist:
                        if let existingString = self.soloist {
                            let newString = checkAndMergeCreditStrings(existingCredit: existingString, newCredit: person)
                            self.soloist = newString
                        } else {
                            self.soloist = person
                    }
                    default:
                        if let existingArray = self.performers {
                            let newArray = checkAndMergeCreditArrays(existingCredit: existingArray, newCredit: person.toArray)
                            self.performers = newArray
                        } else {
                            self.performers = person.toArray
                    }
            }
            case .id3:
                id3Tag.addPerformanceCredit(role: role, person: person)
        }
    }


    public mutating func removeInvolvementCredit(_ role: InvolvementCredits) {
        switch library {
            case .id3:
                id3Tag.removeInvolvementCredit(role: role)
            case .mp4:
                switch role {
                    case .arranger: self.arranger = nil
                    case .artDirection: self.artDirector = nil
                    case .composer: self.composer = nil
                    case .conductor: self.conductor = nil
                    case .director: self.director = nil
                    case .executiveProducer: self.executiveProducer = nil
                    case .lyricist: self.lyricist = nil
                    case .producer: self.producer = nil
                    case .publisher: self.publisher = nil
                    case .songwriter: self.songwriter = nil
                    case .soundEngineer: self.soundEngineer = nil
                    case .writer: self.writer = nil
                    default: self[role.rawValue] = nil
            }
        }
    }
    
    public mutating func removePerformanceCredit(_ role: PerformanceCredits) {
        switch library {
            case .id3:
                id3Tag.removePerformanceCredit(role: role)
            case .mp4:
                switch role {
                    case .artist: self.artist = nil
                    case .narrator: self.narrator = nil
                    case .performer: self.performers = nil
                    case .soloist: self.soloist = nil
                    default: self[role.rawValue] = nil
            }
        }
    }

    public mutating func clearInvolvementCreditList() {
        switch library {
            case .id3:
                id3Tag.clearInvolvementCreditList()
            case .mp4:
                for credit in InvolvementCredits.allCases {
                    removeInvolvementCredit(credit)
            }
        }
    }
    public mutating func clearPerformanceCreditList() {
        switch library {
            case .id3:
                id3Tag.clearPerformanceCreditList()
            case .mp4:
                for credit in PerformanceCredits.allCases {
                    removePerformanceCredit(credit)
            }
        }
    }

    /// ID3 ONLY. A similar atom does not exist for MP4
    public var involvementCreditsList: [ InvolvementCredits : [String]] {
        get {
            switch library {
                case .id3:
                    return id3Tag.involvementCreditsList
                case .mp4:
                    return [:]
            }
        }
        set {
            switch library {
                case .id3:
                    if !newValue.isEmpty {
                        id3Tag.involvementCreditsList = newValue
                    } else {
                        id3Tag.clearInvolvementCreditList()
                }
                case .mp4:
                    if !newValue.isEmpty {
                        for (key, value) in newValue {
                            let valueString = value.toString
                            self.addInvolvementCredit(key, person: valueString)
                        }
                    } else {
                        clearInvolvementCreditList()
                }
            }
        }
    }
    
    public var performanceCreditsList: [ PerformanceCredits : [String]] {
        get {
            switch library {
                case .id3:
                    return id3Tag.performanceCreditsList
                case .mp4:
                    if let performers = self.performers {
                        return [.performer: performers]
                    } else {
                        return [:]
                }
            }
        }
        set {
            switch library {
                case .id3:
                    if !newValue.isEmpty {
                        for (key, value) in newValue {
                            if let credit = PerformanceCredits(rawValue: key.rawValue) {
                                id3Tag.performanceCreditsList[credit] = value
                            }
                        }
                    } else {
                        id3Tag.clearPerformanceCreditList()
                }
                case .mp4:
                    if !newValue.isEmpty {
                        for (key, value) in newValue {
                            let valueString = value.toString
                            self.addPerformanceCredit(key, person: valueString)
                        }
                    } else {
                        clearPerformanceCreditList()
                }
            }
        }
    }
    
    private func checkAndMergeCreditStrings(existingCredit: String, newCredit: String) -> String {
        let newCreditArray = newCredit.toArray
        var existingCreditArray = existingCredit.toArray
        for credit in newCreditArray {
            if !existingCreditArray.contains(credit) {
                existingCreditArray.append(credit)
            }
        }
        let newString = existingCreditArray.toString
        return newString
    }
    
    private func checkAndMergeCreditArrays(existingCredit: [String], newCredit: [String]) -> [String] {
        var newArray = existingCredit
        for credit in newCredit {
            if !newArray.contains(credit) {
                newArray.append(credit)
            }
        }
        return newArray
    }
}
