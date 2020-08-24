//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/15/20.
//
import SwiftTaggerID3

@available(OSX 10.13, *)
enum MetadataID_String: CaseIterable { // 70 items
    // MARK: A
    case acknowledgment
    case album
    case albumArtist
    case albumArtistSort
    case albumSort
    case arranger
    case artDirector
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
    case director
    case encodedBy
    case encodingSettings
    case encodingTool
    case executiveProducer
    case filmMakerWebpage
    // MARK: - G-L
    case genre
    case grouping
    case information
    case isrc
    case label
    case linerNotes
    case longDescription
    case lyricist
    case lyrics
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
    case producer
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
    case soloist
    case songDescription
    case soundEngineer
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
            case .artDirector: return .artDirector
            case .director: return .director
            case .executiveProducer: return .executiveProducer
            case .producer: return .producer
            case .soloist: return .soloist
            case .soundEngineer: return .soundEngineer
        }
    }
}

@available(OSX 10.13, *)
extension AudioFile {
    // MARK: - Accesors A
    public var acknowledgment: String? {
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
    
    public var album: String? {
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

    public var albumArtist: String? {
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

    public var albumArtistSort: String? {
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

    public var albumSort: String? {
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

    public var arranger: String? {
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
    
    public var artDirector: String? {
        get {
            if let value = self.get(.artDirector) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.artDirector, stringValue: newValue)
        }
    }
    
    public var artist: String? {
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
    
    public var artistSort: String? {
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

    public var artistWebpage: String? {
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

    public var audioFileWebpage: String? {
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

    public var audioSourceWebpage: String? {
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
    public var comment: String? {
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
    
    public var composer: String? {
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
    
    public var composerSort: String? {
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
    
    public var conductor: String? {
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
    
    public var copyright: String? {
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
    
    public var copyrightWebpage: String? {
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
    public var description: String? {
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
    
    public var director: String? {
        get {
            if let value = self.get(.director) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.director, stringValue: newValue)
        }
    }
    
    public var encodedBy: String? {
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
    
    public var encodingSettings: String? {
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
    
    public var encodingTool: String? {
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
    
    public var executiveProducer: String? {
        get {
            if let value = self.get(.executiveProducer) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.executiveProducer, stringValue: newValue)
        }
    }
    
    public var filmMakerWebpage: String? {
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
    
    // MARK: - Accessors G-L
    public var genre: String? {
        get {
            if let value = self.get(.genre) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.genre, stringValue: newValue)
        }
    }

    public var grouping: String? {
        get {
            if let value = self.get(.grouping) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.grouping, stringValue: newValue)
        }
    }

    public var information: String? {
        get {
            if let value = self.get(.information) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.information, stringValue: newValue)
        }
    }

    public var isrc: String? {
        get {
            if let value = self.get(.isrc) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.isrc, stringValue: newValue)
        }
    }

    public var label: String? {
        get {
            if let value = self.get(.label) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.label, stringValue: newValue)
        }
    }

    public var linerNotes: String? {
        get {
            if let value = self.get(.linerNotes) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.linerNotes, stringValue: newValue)
        }
    }

    public var longDescription: String? {
        get {
            if let value = self.get(.longDescription) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.longDescription, stringValue: newValue)
        }
    }

    public var lyricist: String? {
        get {
            if let value = self.get(.lyricist) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.lyricist, stringValue: newValue)
        }
    }

    public var lyrics: String? {
        get {
            if let value = self.get(.lyrics) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.lyrics, stringValue: newValue)
        }
    }

    // MARK: - Accesors M-O
    public var mood: String? {
        get {
            if let value = self.get(.mood) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.mood, stringValue: newValue)
        }
    }
    
    public var movement: String? {
        get {
            if let value = self.get(.movementName) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.movementName, stringValue: newValue)
        }
    }
    
    public var narrator: String? {
        get {
            if let value = self.get(.narrator) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.narrator, stringValue: newValue)
        }
    }
    
    public var originalAlbum: String? {
        get {
            if let value = self.get(.originalAlbum) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.originalAlbum, stringValue: newValue)
        }
    }
    
    public var originalArtist: String? {
        get {
            if let value = self.get(.originalArtist) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.originalArtist, stringValue: newValue)
        }
    }
    
    public var originalFilename: String? {
        get {
            if let value = self.get(.originalFilename) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.originalFilename, stringValue: newValue)
        }
    }
    
    public var originalLyricist: String? {
        get {
            if let value = self.get(.originalLyricist) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.originalLyricist, stringValue: newValue)
        }
    }
    
    public var owner: String? {
        get {
            if let value = self.get(.owner) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.owner, stringValue: newValue)
        }
    }
    
    public var paymentWebpage: String? {
        get {
            if let value = self.get(.paymentWebpage) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.paymentWebpage, stringValue: newValue)
        }
    }
    
    public var podcastCategory: String? {
        get {
            if let value = self.get(.podcastCategory) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.podcastCategory, stringValue: newValue)
        }
    }
 
    public var podcastDescription: String? {
        get {
            if let value = self.get(.podcastDescription) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.podcastDescription, stringValue: newValue)
        }
    }
    
    public var podcastFeed: String? {
        get {
            if let value = self.get(.podcastFeed) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.podcastFeed, stringValue: newValue)
        }
    }
    
    public var podcastID: String? {
        get {
            if let value = self.get(.podcastID) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.podcastID, stringValue: newValue)
        }
    }

    public var producedNotice: String? {
        get {
            if let value = self.get(.producedNotice) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.producedNotice, stringValue: newValue)
        }
    }
    
    public var producer: String? {
        get {
            if let value = self.get(.producer) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.producer, stringValue: newValue)
        }
    }
    
    public var publisher: String? {
        get {
            if let value = self.get(.publisher) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.publisher, stringValue: newValue)
        }
    }
   
    public var publisherWebpage: String? {
        get {
            if let value = self.get(.publisherWebpage) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.publisherWebpage, stringValue: newValue)
        }
    }
    
    // MARK: - Accessors R-S
    public var radioStation: String? {
        get {
            if let value = self.get(.radioStation) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.radioStation, stringValue: newValue)
        }
    }

    public var radioStationOwner: String? {
        get {
            if let value = self.get(.radioStationOwner) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.radioStationOwner, stringValue: newValue)
        }
    }
    
    public var radioStationWebpage: String? {
        get {
            if let value = self.get(.radioStationWebpage) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.radioStationWebpage, stringValue: newValue)
        }
    }
    
    public var recordCompany: String? {
        get {
            if let value = self.get(.recordCompany) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.recordCompany, stringValue: newValue)
        }
    }
    
    public var recordingCopyright: String? {
        get {
            if let value = self.get(.recordingCopyright) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.recordingCopyright, stringValue: newValue)
        }
    }
    
    public var requirements: String? {
        get {
            if let value = self.get(.requirements) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.requirements, stringValue: newValue)
        }
    }
    
    public var sellerID: String? {
        get {
            if let value = self.get(.sellerID) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.sellerID, stringValue: newValue)
        }
    }
    
    public var softwareVersion: String? {
        get {
            if let value = self.get(.softwareVersion) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.softwareVersion, stringValue: newValue)
        }
    }
    
    public var soloist: String? {
        get {
            if let value = self.get(.soloist) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.soloist, stringValue: newValue)
        }
    }
    public var songDescription: String? {
        get {
            if let value = self.get(.songDescription) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.songDescription, stringValue: newValue)
        }
    }
    
    public var soundEngineer: String? {
        get {
            if let value = self.get(.soundEngineer) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.soundEngineer, stringValue: newValue)
        }
    }
    
    public var sourceCredit: String? {
        get {
            if let value = self.get(.sourceCredit) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.sourceCredit, stringValue: newValue)
        }
    }
    
    public var subtitle: String? {
        get {
            if let value = self.get(.subtitle) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.subtitle, stringValue: newValue)
        }
    }
    
    // MARK: - Accesors T-Z
    public var title: String? {
        get {
            if let value = self.get(.title) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.title, stringValue: newValue)
        }
    }

    public var titleSort: String? {
        get {
            if let value = self.get(.titleSort) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.titleSort, stringValue: newValue)
        }
    }

    public var thanks: String? {
        get {
            if let value = self.get(.thanks) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.thanks, stringValue: newValue)
        }
    }

    public var trackSubtitle: String? {
        get {
            if let value = self.get(.trackSubtitle) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.trackSubtitle, stringValue: newValue)
        }
    }
    
    public var tvEpisodeTitle: String? {
        get {
            if let value = self.get(.tvEpisodeTitle) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.tvEpisodeTitle, stringValue: newValue)
        }
    }

    public var tvNetwork: String? {
        get {
            if let value = self.get(.tvNetwork) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.tvNetwork, stringValue: newValue)
        }
    }

    public var tvShow: String? {
        get {
            if let value = self.get(.tvShow) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.tvShow, stringValue: newValue)
        }
    }

    public var tvShowDescription: String? {
        get {
            if let value = self.get(.tvShowDescription) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.tvShowDescription, stringValue: newValue)
        }
    }

    public var tvShowSort: String? {
        get {
            if let value = self.get(.tvShowSort) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.tvShowSort, stringValue: newValue)
        }
    }

    public var website: String? {
        get {
            if let value = self.get(.website) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.website, stringValue: newValue)
        }
    }

    public var work: String? {
        get {
            if let value = self.get(.work) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.work, stringValue: newValue)
        }
    }

    public var writer: String? {
        get {
            if let value = self.get(.writer) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.writer, stringValue: newValue)
        }
    }
    
    public subscript(_ metadataDescription: String) -> String? {
        get {
            switch library {
                case .mp4:
                    return mp4Tag[metadataDescription]
                case .id3:
                    return id3Tag[metadataDescription]
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .mp4:
                        mp4Tag[metadataDescription] = new
                    case .id3:
                        id3Tag[metadataDescription] = new
                }
            } else {
                switch library {
                    case .mp4:
                        mp4Tag[metadataDescription] = nil
                    case .id3:
                        id3Tag[metadataDescription] = nil
                }
            }
        }
    }
}
