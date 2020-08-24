/*

 KeySignatures.swift
 SwiftTaggerID3

 Copyright ©2020 Nolaine Crusher. All rights reserved.

 */

import Foundation
import SwiftTaggerID3
import SwiftTaggerMP4

public enum KeySignature: String {
    
    init?(id3Value: SwiftTaggerID3.KeySignature) {
        if let key = KeySignature(rawValue: id3Value.rawValue) {
            self = key
        } else {
            return nil
        }
    }
    
    init?(mp4Value: SwiftTaggerMP4.KeySignature) {
        if let key = KeySignature(rawValue: mp4Value.rawValue) {
            self = key
        } else {
            return nil
        }
    }

    case cMajor = "C"
    case gMajor = "G"
    case dMajor = "D"
    case aMajor = "A"
    case eMajor = "E"
    case bMajor = "B"
    case fSharpMajor = "F#"
    case cSharpMajor = "C#"
    case aMinor = "Am"
    case eMinor = "Em"
    case bMinor = "Bm"
    case fSharpMinor = "F#m"
    case cSharpMinor = "C#m"
    case gSharpMinor = "G#m"
    case dSharpMinor = "D#m"
    case aSharpMinor = "A#m"
    case fMajor = "F"
    case dMinor = "Dm"
    case bFlatMajor = "Bb"
    case gMinor = "Gm"
    case eFlatMajor = "Eb"
    case cMinor = "Cm"
    case aFlatMajor = "Ab"
    case fMinor = "Fm"
    case dFlatMajor = "Db"
    case bFlatMinor = "Bbm"
    case gFlatMajor = "Gb"
    case eFlatMinor = "Ebm"
    case cFlatMajor = "Cb"
    case aFlatMinor = "Abm"
    case offkey = "o"
    case unknown = ""
}
