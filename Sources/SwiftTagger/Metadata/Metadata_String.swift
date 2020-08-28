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
    case songwriter
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
            case .songwriter: return .songwriter
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
    /// Accesses the MP4 `\u{00A9}cak` atom.
    ///
    /// There is no equivalent frame for ID3. Instead, this will get and set a user-defined text (`TXXX`) frame with the descriptor `Acknowledgment`
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
    
    /// Accesses the MP4 atom `\u{00A9}alb`, or the ID3 frame `TALB`
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

    /// Accesses the MP4 atom `aART`, or the ID3 frame `TPE2`
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

    /// Accesses the MP4 atom `soaaa`, or the ID3 frame `TSO2`
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

    /// Accesses the MP4 atom `soal`, or the ID3 frame `TSOA`
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

    /// Accesses the MP4 atom `\u{00A9}arg`, or the ID3 frame `TPE4`
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
    
    /// Accesses the MP4 atom `\u{00A9}ard`
    ///
    /// There is no ID3 equivalent. Instead, this will get and set an entry in the `TIPL` (involved people list) frame with the role `artDirection`
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
    
    /// Accesses the MP4 atom `\u{00A9}ART`, or the ID3 frame `TPE1`
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
    
    /// Accesses the MP4 atom `soar`, or the ID3 frame `TSOP`
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

    /// Accesses the MP4 atom `\u{00A9}prl`, or the ID3 frame `WOAR`
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

    /// Accesses the ID3 frame `WOAF`
    ///
    /// There is no MP4 equivalent. Instead this will get and set a freeform text atom with the descriptor `AudioFileWebpage`
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

    /// Accesses the ID3 frame `WOAS`
    ///
    /// There is no MP4 equivalent. Instead this will get and set a freeform text atom with the descriptor `AudioSourceWebpage`
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
    /// Accesses the MP4 atom `\u{00A9}cmt` or the ID3 frame `COMM`
    ///
    /// ID allows multiple comment frames, each with a different description and/or language. This one will have the descriptor `Comment` and the languge `.und`
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
    
    /// Accesses the MP4 atom `\u{00A9}com` or the ID3 frame `TCOM`
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
    
    /// Accesses the MP4 atom `soco` or the ID3 frame `TSOC`
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
    
    /// Accesses the MP4 atom `\u{00A9}con` or the ID3 frame `TPE3`
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
    
    /// Accesses the MP4 atom `cprt` or the ID3 frame `TCOP`
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
    
    /// Accesses the ID3 frame `WCOP`
    ///
    /// There is no equivalent MP4 atom. Instead, this will get and set a freeform atom with the descriptor `CopyrightWebpage`
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
    /// Accesses the MP4 atom `\u{00A9}des`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a `COMM` frame with the descriptor `Description` and language `.und`
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
    
    /// Accesses the MP4 atom `\u{00A9}dir`
    ///
    /// There is no ID3 equivalent. Instead, this will get and set an entry in the `TIPL` (involved people list) frame with the role `director`
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
    
    /// Accesses the MP4 atom `\u{00A9}enc` or the ID3 frame `TENC`
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
    
    /// Accesses the ID3 frame `TSSE`
    ///
    /// There is no equivalent MP4 atom. Instead, this will get and set a freeform atom with the descriptor `EncodingSettings`
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
    
    /// Accesses the MP4 atom `\u{00A9}too`
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a user-defined text (`TXXX`) frame with the descriptor `EncodingTool`
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
    
    /// Accesses the MP4 atom `\u{00A9}xpd`
    ///
    /// There is no ID3 equivalent. Instead, this will get and set an entry in the `TIPL` (involved people list) frame with the role `executiveProducer`
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
    
    /// Accesses the MP4 atom `\u{00A9}mal`
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a user-defined text (`TXXX`) frame with the descriptor `FilmMakerWebpage`
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
    /// Accesses the MP4 atom `\u{00A9}gen` or the custom genre property of the ID3 frame `TCON`
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

    /// Accesses the MP4 atom `\u{00A9}grp` or the ID3 frame `GRP1`
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

    /// Accesses the MP4 atom `\u{00A9}inf`
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a user-defined text (`TXXX`) frame with the descriptor `Information`
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

    /// Accesses the MP4 atom `\u{00A9}isr` or the ID3 frame `TSRC`
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

    /// Accesses the MP4 atom `\u{00A9}lab` or the ID3 frame `TPUB`
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

    /// Accesses the MP4 atom `\u{00A9}lnt`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a `COMM` frame with the descriptor `LinerNotes` and language `.und`
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

    /// Accesses the MP4 atom `ldes`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a `COMM` frame with the descriptor `LongDescription` and language `.und`
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

    /// Accesses the MP4 atom `\u{00A9}aut` or the ID3 frame `TEXT`
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

    /// Accesses the MP4 atom `\u{00A9}lyr` or the ID3 frame `USLT` with the descriptor `lyrics` and the language `.und`
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
    /// Accesses the ID3 frame `TMOO`.
    ///
    /// There is no equivalent MP4 atom. Instead, this will get and set a freeform text atom with the descriptor `Mood`
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
    
    /// Accesses the MP4 atom `\u{00A9}mvn` or the ID3 frame `MVNM`
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
    
    /// Accesses the MP4 atom `\u{00A9}nrt`.
    ///
    /// There is no equivalent ID3 frame. Most audiobook apps seem to use the `composer` tag for narrator, so this will set the `TCOM` (composer) frame
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
    
    /// Accesses the ID3 frame `TOAL`.
    ///
    /// There is no equivalent MP4 atom. Instead, this will get and set a freeform text atom with the descriptor `OriginalAlbum`
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
    
    /// Accesses the MP4 atom `\u{00A9}ope` or the ID3 frame `TOPE`
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
    
    /// Accesses the ID3 frame `TOFN`.
    ///
    /// There is no equivalent MP4 atom. Instead, this will get and set a freeform text atom with the descriptor `OriginalFilename`
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
    
    /// Accesses the ID3 frame `TOLY`.
    ///
    /// There is no equivalent MP4 atom. Instead, this will get and set a freeform text atom with the descriptor `OriginalLyricist`
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
    
    /// Accesses the MP4 atom `ownr` or the ID3 frame `TOWN`
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
    
    /// Accesses the ID3 frame `WPAY`.
    ///
    /// There is no equivalent MP4 atom. Instead, this will get and set a freeform text atom with the descriptor `PaymentWebpage`
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
    
    /// Accesses the MP4 atom `catg` or the ID3 frame `TCAT`
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
 
    /// Accesses the ID3 frame `TDES`.
    ///
    /// There is no equivalent MP4 atom. Instead, this will get and set a freeform text atom with the descriptor `PodcastDescription`
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
    
    /// Accesses the MP4 atom `purl` or the ID3 frame `WFED`
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
    
    /// Accesses the MP4 atom `egid` or the ID3 frame `TGID`
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

    /// Accesses the ID3 frame `TPRO`.
    ///
    /// There is no equivalent MP4 atom. Instead, this will get and set a freeform text atom with the descriptor `ProducedNotice`
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
    
    /// Accesses the MP4 atom `\u{00A9}prd`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set an entry in the `TIPL` (involved people list) frame with the role `producer`
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
    
    /// Accesses the MP4 atom `\u{00A9}pub` or the ID3 frame `TPUB`
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
   
    /// Accesses the MP4 atom `\u{00A9}lal` or the ID3 frame `WPUB`
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
    /// Accesses the ID3 frame `TRSN`.
    ///
    /// There is no equivalent MP4 atom. Instead, this will get and set a freeform text atom with the descriptor `RadioStation`
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

    /// Accesses the ID3 frame `TRSO`.
    ///
    /// There is no equivalent MP4 atom. Instead, this will get and set a freeform text atom with the descriptor `RadioStationOwner`
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
    
    /// Accesses the ID3 frame `WORS`.
    ///
    /// There is no equivalent MP4 atom. Instead, this will get and set a freeform text atom with the descriptor `RadioStationWebpage`
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
    
    /// Accesses the MP4 atom `\u{00A9}mak` or the ID3 frame `TPUB`
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
    
    /// Accesses the MP4 atom `\u{00A9}phg` (phonogram rights).
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a user-defined text (`TXXX`) frame with the descriptor `RecordingCopyright`
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
    
    /// Accesses the MP4 atom `\u{00A9}req`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a user-defined text (`TXXX`) frame with the descriptor `Requirements`
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
    
    /// Accesses the MP4 atom `xid `.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a user-defined text (`TXXX`) frame with the descriptor `SellerID`
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
    
    /// Accesses the MP4 atom `\u{00A9}swr`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a user-defined text (`TXXX`) frame with the descriptor `SoftwareVersion`
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
    
    /// Accesses the MP4 atom `\u{00A9}sol`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set an entry in the `TMCL` (musician credit list) frame with the role `soloist`
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

    /// Accesses the MP4 atom `desc`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a comment (`COMM`) frame with the descriptor `SongDescription` and language `.und`
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
    
    /// Accesses the MP4 atom `\u{00A9}swf`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set an entry in the `TIPL` (involved people list) frame with the role `songwriter`
    public var songwriter: String? {
        get {
            if let value = self.get(.songwriter) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.songwriter, stringValue: newValue)
        }
    }

    /// Accesses the MP4 atom `\u{00A9}sne`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set an entry in the `TIPL` (involved people list) frame with the role `soundEngineer`
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
    
    /// Accesses the MP4 atom `\u{00A9}src`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a user-defined text (`TXXX`) frame with the descriptor `SourceCredit`
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
    
    /// Accesses the MP4 atom `\u{00A9}snm` or the ID3 frame `TIT3`
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
    /// Accesses the MP4 atom `\u{00A9}nam` or the ID3 frame `TIT2`
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

    /// Accesses the MP4 atom `sonm` or the ID3 frame `TSOT`
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

    /// Accesses the MP4 atom `\u{00A9}thx`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a user-defined text (`TXXX`) frame with the descriptor `Thanks`
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

    /// Accesses the MP4 atom `\u{00A9}st3` (track subtitle) or the ID3 frame `TSST` (set subtitle)
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
    
    /// Accesses the MP4 atom `tves`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a user-defined text (`TXXX`) frame with the descriptor `TVEpisodeTitle`
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

    /// Accesses the MP4 atom `tvnn`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a user-defined text (`TXXX`) frame with the descriptor `TVNetwork`
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

    /// Accesses the MP4 atom `tvsh`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a user-defined text (`TXXX`) frame with the descriptor `TVShow`
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

    /// Accesses the MP4 atom `sdes`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a comment (`COMM`) frame with the descriptor `TVShowDescription` and language `.und`
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

    /// Accesses the MP4 atom `sosn`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a user-defined text (`TXXX`) frame with the descriptor `TVShowSort`
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

    /// Accesses the MP4 atom `\u{00A9}url`
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a user-defined website (`WXXX`) frame with the descriptor `Website`
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

    /// Accesses the MP4 atom `\u{00A9}wrk` or the ID3 frame `TIT1` (content group)
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

    /// Accesses the MP4 atom `\u{00A9}wrt`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set an entry in the `TIPL` (involved people list) frame with the role `writer`
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
    
    /// Accesses the MP4 freeform atom `----` or the ID3 user-defined text frame `TXXX`
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
    
    public subscript(comment commentDescription: String, language: ISO6392Codes) -> String? {
        get {
            switch library {
                case .mp4: return mp4Tag[commentDescription]
                case .id3: return id3Tag[commentDescription, language]
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .mp4: mp4Tag[commentDescription] = new
                    case .id3: id3Tag[commentDescription, language] = new
                }
            } else {
                switch library {
                    case .mp4: mp4Tag[commentDescription] = nil
                    case .id3: id3Tag[commentDescription, language] = nil
                }
            }
        }
    }
    
    public subscript(lyrics lyricsDescription: String, language: ISO6392Codes) -> String? {
        get {
            switch library {
                case .mp4: return mp4Tag[lyricsDescription]
                case .id3: return id3Tag[lyrics: lyricsDescription, language]
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .mp4: mp4Tag[lyricsDescription] = new
                    case .id3: id3Tag[lyrics: lyricsDescription, language] = new
                }
            } else {
                switch library {
                    case .mp4: mp4Tag[lyricsDescription] = nil
                    case .id3: id3Tag[lyrics: lyricsDescription, language] = nil
                }
            }
        }
    }

}
