//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/15/20.
//
import SwiftTaggerID3
import SwiftTaggerMP4
import Foundation

@available(OSX 10.13, *)
enum MetadataID_String: CaseIterable { // 70 items
    // MARK: A
    case acknowledgment
    case album
    case albumArtist
    case albumArtistSort
    case albumSort
    case arranger
    case artist
    case artistSort
    case artistWebpage
    case audioFileWebpage
    case audioSourceWebpage
    // MARK: - B-C
    case comment
    case composer
    case composerSort
    case conductor
    case copyright
    case copyrightWebpage
    // MARK: - D-F
    case description
    case encodedBy
    case encodingSettings
    case encodingTool
    case filmMakerWebpage
    // MARK: - G-L
    case genre
    case grouping
    case information
    case isrc
    case label
    case linerNotes
    case longDescription
    case lyrics
    case lyricist
    // MARK: - M-N
    case mood
    case movementName
    case narrator
    case originalAlbum
    case originalArtist
    case originalFilename
    case originalLyricist
    case owner
    // MARK: - P
    case paymentWebpage
    case podcastCategory
    case podcastDescription
    case podcastFeed
    case podcastID
    case producedNotice
    case publisher
    case publisherWebpage
    // MARK: - R-S
    case radioStation
    case radioStationOwner
    case radioStationWebpage
    case recordCompany
    case recordingCopyright
    case requirements
    case sellerID
    case softwareVersion
    case songDescription
    case sourceCredit
    case subtitle
    // MARK: - T-Z
    case title
    case titleSort
    case thanks
    case trackSubtitle
    case tvEpisodeTitle
    case tvNetwork
    case tvShow
    case tvShowDescription
    case tvShowSort
    case website
    case work
    case writer
    
    var metadataItem: MetadataItem {
        switch self {
            case .acknowledgment: return .acknowledgment
            case .album: return .album
            case .albumArtist: return .albumArtist
            case .albumArtistSort: return .albumArtistSort
            case .albumSort: return .albumSort
            case .arranger: return .arranger
            case .artist: return .artist
            case .artistSort: return .artistSort
            case .artistWebpage: return .artistWebpage
            case .audioFileWebpage: return .audioFileWebpage
            case .audioSourceWebpage: return .audioSourceWebpage
            case .comment: return .comment
            case .composer: return .composer
            case .composerSort: return .composerSort
            case .conductor: return .conductor
            case .copyright: return .copyright
            case .copyrightWebpage: return .copyrightWebpage
            case .description: return .description
            case .encodedBy: return .encodedBy
            case .encodingSettings: return .encodingSettings
            case .encodingTool: return .encodingTool
            case .filmMakerWebpage: return .filmMakerWebpage
            case .genre: return .genre
            case .grouping: return .grouping
            case .information: return .information
            case .isrc: return .isrc
            case .label: return .label
            case .linerNotes: return .linerNotes
            case .longDescription: return .longDescription
            case .lyrics: return .lyrics
            case .lyricist: return .lyricist
            case .mood: return .mood
            case .movementName: return .movementName
            case .narrator: return .narrator
            case .originalAlbum: return .originalAlbum
            case .originalArtist: return .originalArtist
            case .originalFilename: return .originalFilename
            case .originalLyricist: return .originalLyricist
            case .owner: return .owner
            case .paymentWebpage: return .paymentWebpage
            case .podcastCategory: return .podcastCategory
            case .podcastDescription: return .podcastDescription
            case .podcastFeed: return .podcastFeed
            case .podcastID: return .podcastID
            case .producedNotice: return .producedNotice
            case .publisher: return .publisher
            case .publisherWebpage: return .publisherWebpage
            case .radioStation: return .radioStation
            case .radioStationOwner: return .radioStationOwner
            case .radioStationWebpage: return .radioStationWebpage
            case .recordCompany: return .recordCompany
            case .recordingCopyright: return .recordingCopyright
            case .requirements: return .requirements
            case .sellerID: return .sellerID
            case .softwareVersion: return .softwareVersion
            case .songDescription: return .songDescription
            case .sourceCredit: return .sourceCredit
            case .subtitle: return .subtitle
            case .title: return .title
            case .titleSort: return .titleSort
            case .thanks: return .thanks
            case .trackSubtitle: return .trackSubtitle
            case .tvEpisodeTitle: return .tvEpisodeTitle
            case .tvNetwork: return .tvNetwork
            case .tvShow: return .tvShow
            case .tvShowDescription: return .tvShowDescription
            case .tvShowSort: return .tvShowSort
            case .website: return .website
            case .work: return .work
            case .writer: return .writer
        }
    }
}

@available(OSX 10.13, *)
extension AudioFile {
    // MARK: - Accesors A
    var acknowledgment: String? {
        get {
            if let value = self.get(.acknowledgment) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.acknowledgment, stringValue: newValue)
        }
    }
    
    var album: String? {
        get {
            if let value = self.get(.album) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.album, stringValue: newValue)
        }
    }

    var albumArtist: String? {
        get {
            if let value = self.get(.albumArtist) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.albumArtist, stringValue: newValue)
        }
    }

    var albumArtistSort: String? {
        get {
            if let value = self.get(.albumArtistSort) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.albumArtistSort, stringValue: newValue)
        }
    }

    var albumSort: String? {
        get {
            if let value = self.get(.albumSort) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.albumSort, stringValue: newValue)
        }
    }

    var arranger: String? {
        get {
            if let value = self.get(.arranger) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.arranger, stringValue: newValue)
        }
    }
    
    var artist: String? {
        get {
            if let value = self.get(.artist) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.artist, stringValue: newValue)
        }
    }
    
    var artistSort: String? {
        get {
            if let value = self.get(.artistSort) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.artistSort, stringValue: newValue)
        }
    }

    var artistWebpage: String? {
        get {
            if let value = self.get(.artistWebpage) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.artistWebpage, stringValue: newValue)
        }
    }

    var audioFileWebpage: String? {
        get {
            if let value = self.get(.audioFileWebpage) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.audioFileWebpage, stringValue: newValue)
        }
    }

    var audioSourceWebpage: String? {
        get {
            if let value = self.get(.audioSourceWebpage) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.audioSourceWebpage, stringValue: newValue)
        }
    }
    
    // MARK: Accessors C
    var comment: String? {
        get {
            if let value = self.get(.comment) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.comment, stringValue: newValue)
        }
    }
    
    var composer: String? {
        get {
            if let value = self.get(.composer) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.composer, stringValue: newValue)
        }
    }
    
    var composerSort: String? {
        get {
            if let value = self.get(.composerSort) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.composerSort, stringValue: newValue)
        }
    }
    
    var conductor: String? {
        get {
            if let value = self.get(.conductor) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.conductor, stringValue: newValue)
        }
    }
    
    var copyright: String? {
        get {
            if let value = self.get(.copyright) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.copyright, stringValue: newValue)
        }
    }
    
    var copyrightWebpage: String? {
        get {
            if let value = self.get(.copyrightWebpage) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.copyrightWebpage, stringValue: newValue)
        }
    }
    
    // MARK: - Accessors D-F
    var description: String? {
        get {
            if let value = self.get(.description) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.description, stringValue: newValue)
        }
    }
    
    var encodedBy: String? {
        get {
            if let value = self.get(.encodedBy) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.encodedBy, stringValue: newValue)
        }
    }
    
    var encodingSettings: String? {
        get {
            if let value = self.get(.encodingSettings) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.encodingSettings, stringValue: newValue)
        }
    }
    
    var encodingTool: String? {
        get {
            if let value = self.get(.encodingTool) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.encodingTool, stringValue: newValue)
        }
    }
    
    var filmMakerWebpage: String? {
        get {
            if let value = self.get(.filmMakerWebpage) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.filmMakerWebpage, stringValue: newValue)
        }
    }
    

    
}
