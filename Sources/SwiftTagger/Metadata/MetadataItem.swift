//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/15/20.
//

import Foundation
import SwiftTaggerID3
import SwiftTaggerMP4

@available(OSX 10.13, *)
public enum MetadataItem: String, CaseIterable {
    // MARK: A
    case acknowledgment
    case album
    case albumArtist
    case albumArtistSort
    case albumID
    case albumSort
    case appleStoreCountryID
    case arranger
    case arrangerKeywords
    case artDirector
    case artist
    case artistID
    case artistKeywords
    case artistSort
    case artistWebpage
    case audioFileWebpage
    case audioSourceWebpage
    // MARK: - B-C
    case bpm
    case comment
    case compilation
    case composer
    case composerID
    case composerKeywords
    case composerSort
    case conductor
    case conductorID
    case contentRating
    case copyright
    case copyrightWebpage
    case coverArt
    // MARK: - D-F
    case description
    case director
    case discNumber
    case encodedBy
    case encodingSettings
    case encodingTime
    case encodingTool
    case executiveProducer
    case fileType
    // MARK: - G-L
    case gaplessPlayback
    case genre
    case genreID
    case grouping
    case information
    case initialKey
    case involvedPeopleList
    case isrc
    case label
    case labelWebpage
    case languages
    case length
    case linerNotes
    case longDescription
    case lyricist
    case lyrics
    // MARK: - M-N
    case mediaType
    case mood
    case movementName
    case movementCount
    case movementNumber
    case musicianCreditsList
    case narrator
    case originalAlbum
    case originalArtist
    case originalFilename
    case originalLyricist
    case originalReleaseTime
    case owner
    // MARK: - P
    case paymentWebpage
    case performers
    case playlistDelay
    case playlistID
    case podcast
    case podcastCategory
    case podcastDescription
    case podcastFeed
    case podcastID
    case podcastKeywords
    case predefinedGenre
    case producedNotice
    case producer
    case producerKeywords
    case publisher
    case publisherWebpage
    case purchaseDate
    // MARK: - R-S
    case radioStation
    case radioStationOwner
    case radioStationWebpage
    case rating
    case recordCompany
    case recordingDate
    case recordingCopyright
    case releaseDate
    case requirements
    case sellerID
    case showWork
    case soundEngineer
    case softwareVersion
    case soloist
    case songDescription
    case songwriter
    case songwriterKeywords
    case sourceCredit
    case subtitle
    case subtitleKeywords
    // MARK: - T-Z
    case taggingTime
    case title
    case titleKeywords
    case titleSort
    case thanks
    case trackNumber
    case trackSubtitle
    case tvEpisodeNumber
    case tvEpisodeTitle
    case tvNetwork
    case tvSeason
    case tvShow
    case tvShowDescription
    case tvShowSort
    case website
    case work
    case writer
    case unknown
    case year
    
    // MARK: - ID3 Frame Keys
    var id3Key: FrameKey {
        switch self {
            case .acknowledgment: return .userDefinedText(description: "Acknowledgment")
            case .album: return .album
            case .albumArtist: return .albumArtist
            case .albumArtistSort: return .albumArtistSort
            case .albumID: return .userDefinedText(description: "AlbumID")
            case .albumSort: return .albumSort
            case .appleStoreCountryID: return .userDefinedText(description: "AppleStoreCountryID")
            case .arranger: return .arranger
            case .arrangerKeywords: return .userDefinedText(description: "ArrangerKeywords")
            case .artDirector: return .involvedPeopleList
            case .artist: return .artist
            case .artistID: return .userDefinedText(description: "ArtistID")
            case .artistKeywords: return .userDefinedText(description: "ArtistKeywords")
            case .artistSort: return .artistSort
            case .artistWebpage: return .artistWebpage
            case .audioFileWebpage: return .audioFileWebpage
            case .audioSourceWebpage: return .audioSourceWebpage
            // MARK: - B-C
            case .bpm: return .bpm
            case .comment: return .comments(description: "Comment")
            case .compilation: return .compilation
            case .composer: return .composer
            case .composerID: return .userDefinedText(description: "ComposerID")
            case .composerKeywords: return .userDefinedText(description: "ComposerKeywords")
            case .composerSort: return .composerSort
            case .conductor: return .conductor
            case .conductorID: return .userDefinedText(description: "ConductorID")
            case .contentRating: return .userDefinedText(description: "ContentRating")
            case .rating: return .userDefinedText(description: "Rating")
            case .copyright: return .copyright
            case .copyrightWebpage: return .copyrightWebpage
            case .coverArt: return .attachedPicture(description: "Front Cover")
            // MARK: - D-F
            case .description: return .comments(description: "Description")
            case .director: return .involvedPeopleList
            case .discNumber: return .discNumber
            case .encodedBy: return .encodedBy
            case .encodingSettings: return .encodingSettings
            case .encodingTime: return .encodingTime
            case .encodingTool: return .userDefinedText(description: "EncodingTool")
            case .executiveProducer: return .involvedPeopleList
            case .fileType: return .fileType
            case .labelWebpage: return .userDefinedWebpage(description: "FilmMakerWebpage")
            // MARK: - G-L
            case .gaplessPlayback: return .playlistDelay
            case .genre: return .genre
            case .genreID: return .userDefinedText(description: "GenreID")
            case .grouping: return .grouping
            case .information: return .userDefinedText(description: "Information")
            case .initialKey: return .initialKey
            case .involvedPeopleList: return .involvedPeopleList
            case .isrc: return .isrc
            case .label: return .userDefinedText(description: "Label")
            case .languages: return .languages
            case .length: return .length
            case .linerNotes: return .comments(description: "LinerNotes")
            case .longDescription: return .comments(description: "LongDescription")
            case .lyricist: return .lyricist
            case .lyrics: return .unsynchronizedLyrics(description: "Lyrics")
            // MARK: - M-N
            case .mediaType: return .userDefinedText(description: "ContentType")
            case .mood: return .mood
            case .movementName: return .movementName
            case .movementCount: return .movementCount
            case .movementNumber: return .movementNumber
            case .musicianCreditsList: return .musicianCreditsList
            case .narrator: return .userDefinedText(description: "Narrator")
            case .originalAlbum: return .originalAlbum
            case .originalArtist: return .originalArtist
            case .originalFilename: return .originalFilename
            case .originalLyricist: return .originalLyricist
            case .originalReleaseTime: return .originalReleaseTime
            case .owner: return .fileOwner
            // MARK: - P
            case .paymentWebpage: return .paymentWebpage
            case .performers: return .musicianCreditsList
            case .playlistDelay: return .playlistDelay
            case .playlistID: return .userDefinedWebpage(description: "PlaylistID")
            case .podcast: return .userDefinedText(description: "Podcast")
            case .podcastCategory: return .podcastCategory
            case .podcastDescription: return .podcastDescription
            case .podcastFeed: return .podcastFeedLink
            case .podcastID: return .podcastID
            case .podcastKeywords: return .podcastKeywords
            case .predefinedGenre: return .userDefinedText(description: "PredefinedGenre")
            case .producedNotice: return .producedNotice
            case .producer: return .involvedPeopleList
            case .producerKeywords: return .userDefinedText(description: "ProducerKeywords")
            case .publisher: return .publisher
            case .publisherWebpage: return .publisherWebpage
            case .purchaseDate: return .userDefinedText(description: "PurchaseDate")
            // MARK: - R-S
            case .radioStation: return .radioStation
            case .radioStationOwner: return .radioStationOwner
            case .radioStationWebpage: return .radioStationWebpage
            case .recordCompany: return .userDefinedText(description: "RecordCompany")
            case .recordingDate: return .recordingDate
            case .recordingCopyright: return .userDefinedText(description: "RecordingCopyright")
            case .releaseDate: return .releaseTime
            case .requirements: return .userDefinedText(description: "Requirements")
            case .sellerID: return .userDefinedText(description: "SellerID")
            case .showWork: return .userDefinedText(description: "ShowWork")
            case .soundEngineer: return .involvedPeopleList
            case .softwareVersion: return .userDefinedText(description: "SoftwareVersion")
            case .soloist: return .musicianCreditsList
            case .songDescription: return .comments(description: "SongDescription")
            case .songwriter: return .userDefinedText(description: "Songwriter")
            case .songwriterKeywords: return .userDefinedText(description: "SongwriterKeywords")
            case .sourceCredit: return .userDefinedText(description: "SourceCredit")
            case .subtitle: return .subtitle
            case .subtitleKeywords: return .userDefinedText(description: "SubtitleKeywords")
            // MARK: - T-Z
            case .taggingTime: return .taggingTime
            case .title: return .title
            case .titleKeywords: return .userDefinedText(description: "TitleKeywords")
            case .titleSort: return .titleSort
            case .thanks: return .userDefinedText(description: "Thanks")
            case .trackNumber: return .trackNumber
            case .trackSubtitle: return .setSubtitle
            case .tvEpisodeNumber: return .userDefinedWebpage(description: "TVEpisodeNumber")
            case .tvEpisodeTitle: return .userDefinedText(description: "TVEpisodeTitle")
            case .tvNetwork: return .userDefinedText(description: "TVNetwork")
            case .tvSeason: return .userDefinedText(description: "TVSeason")
            case .tvShow: return .userDefinedText(description: "TVShow")
            case .tvShowDescription: return .comments(description: "TVShowDescription")
            case .tvShowSort: return .userDefinedText(description: "TVShowSort")
            case .website: return .userDefinedWebpage(description: "Website")
            case .work: return .contentGroup
            case .writer: return .userDefinedText(description: "Writer")
            case .unknown: return .userDefinedText(description: "Unknown")
            case .year: return .year
        }
    }
    
    // MARK: - Init from FrameKey
    private static let id3KeyToMetadataMapping: [SwiftTaggerID3.FrameKey : MetadataItem] = {
        var mapping = [SwiftTaggerID3.FrameKey : MetadataItem]()
        for item in MetadataItem.allCases {
            let id3Key = item.id3Key
            mapping[id3Key] = item
        }
        return mapping
    }()
    
    init?(from id3Key: SwiftTaggerID3.FrameKey) {
        if let metadata = MetadataItem.id3KeyToMetadataMapping[id3Key] {
            self = metadata
        } else {
            return nil
        }
    }
    
    // MARK: - MP4 Atom Identifiers
    var mp4StringKey: StringMetadataIdentifier? {
        switch self {
            case .acknowledgment: return .acknowledgment
            case .album: return .album
            case .albumArtist: return .albumArtist
            case .albumArtistSort: return .albumArtistSort
            case .albumSort: return .albumSort
            case .arranger: return .arranger
            case .arrangerKeywords: return .arrangerKeywords
            case .artDirector: return .artDirector
            case .artist: return .artist
            case .artistKeywords: return .artistKeywords
            case .artistSort: return .artistSort
            case .artistWebpage: return .artistUrl
            // MARK: - B-C
            case .comment: return .comment
            case .composer: return .composer
            case .composerKeywords: return .composerKeywords
            case .composerSort: return .composerSort
            case .conductor: return .conductor
            case .copyright: return .copyright
            // MARK: - D-F
            case .description: return .description
            case .director: return .director
            case .encodedBy: return .encodedBy
            case .encodingTool: return .encodingTool
            case .executiveProducer: return .executiveProducer
            case .fileType: return .format
            // MARK: - G-L
            case .genre: return .customGenre
            case .grouping: return .grouping
            case .information: return .information
            case .isrc: return .isrc
            case .label: return .label
            case .linerNotes: return .linerNotes
            case .longDescription: return .longDescription
            case .lyricist: return .lyricist
            case .lyrics: return .lyrics
            // MARK: - M-N
            case .movementName: return .movementName
            case .narrator: return .narrator
            case .originalArtist: return .originalArtist
            case .owner: return .owner
            // MARK: - P
            case .performers: return .performers
            case .podcastCategory: return .category
            case .podcastFeed: return .podcastUrl
            case .podcastID: return .podcastID
            case .podcastKeywords: return .keywords
            case .predefinedGenre: return .predefinedGenre
            case .producer: return .producer
            case .producerKeywords: return .producerKeywords
            case .publisher: return .publisher
            case .publisherWebpage: return .recordCompanyUrl
            case .purchaseDate: return .purchaseDate
            // MARK: - R-S
            case .recordCompany: return .recordCompany
            case .recordingDate: return .recordingDate
            case .recordingCopyright: return .recordingCopyright
            case .releaseDate: return .releaseDate
            case .requirements: return .requirements
            case .sellerID: return .sellerID
            case .soundEngineer: return .soundEngineer
            case .softwareVersion: return .softwareVersion
            case .soloist: return .soloist
            case .songDescription: return .songDescription
            case .songwriter: return .songwriter
            case .songwriterKeywords: return .songwriterKeywords
            case .sourceCredit: return .sourceCredit
            case .subtitle: return .subtitle
            case .subtitleKeywords: return .subtitleKeywords
            // MARK: - T-Z
            case .title: return .title
            case .titleKeywords: return .titleKeywords
            case .titleSort: return .titleSort
            case .thanks: return .thanks
            case .trackSubtitle: return .trackSubtitle
            case .tvEpisodeTitle: return .tvEpisodeTitle
            case .tvNetwork: return .tvNetwork
            case .tvShow: return .tvShow
            case .tvShowDescription: return .tvShowDescription
            case .tvShowSort: return .tvShowSort
            case .website: return .website
            case .work: return .workName
            case .writer: return .writer
            default: return nil
        }
    }
    
    var mp4IntegerKey: IntegerMetadataIdentifier? {
        switch self {
            case .albumID: return .albumID
            case .appleStoreCountryID: return .appleStoreCountryID
            case .artistID: return .artistID
            case .bpm: return .bpm
            case .compilation: return .compilation
            case .composerID: return .composerID
            case .conductorID: return .conductorID
            case .gaplessPlayback: return .gaplessPlayback
            case .genreID: return .genreID
            case .mediaType: return .mediaKind
            case .movementCount: return .movementCount
            case .movementNumber: return .movementNumber
            case .playlistID: return .playlistID
            case .podcast: return .podcast
            case .rating: return .rating
            case .showWork: return .showWorkAndMovement
            case .tvEpisodeNumber: return .tvEpisodeNumber
            case .tvSeason: return .tvSeason
            case .year: return .year
            default: return nil
        }
    }
    
    var mp4KeyOther: String? {
        switch self {
            case .discNumber: return "disk"
            case .trackNumber: return "trkn"
            case .coverArt: return "covr"
            case .audioFileWebpage, .audioSourceWebpage, .copyrightWebpage, .encodingSettings, .initialKey, .mood, .originalAlbum, .originalFilename, .originalLyricist, .originalReleaseTime, .paymentWebpage, .producedNotice, .radioStation, .radioStationOwner, .radioStationWebpage, .taggingTime, .unknown: return "----"
            default: return nil
        }
    }
    
    // MARK: Init From AtomID
    private static let mp4StringIDToMetadataMapping: [StringMetadataIdentifier : MetadataItem] = {
        var mapping = [StringMetadataIdentifier : MetadataItem]()
        for item in [
            MetadataItem.acknowledgment,
            MetadataItem.album,
            MetadataItem.albumArtist,
            MetadataItem.albumArtistSort,
            MetadataItem.albumSort,
            MetadataItem.arranger,
            MetadataItem.arrangerKeywords,
            MetadataItem.artDirector,
            MetadataItem.artist,
            MetadataItem.artistKeywords,
            MetadataItem.artistSort,
            MetadataItem.artistWebpage,
            MetadataItem.comment,
            MetadataItem.composer,
            MetadataItem.composerKeywords,
            MetadataItem.composerSort,
            MetadataItem.conductor,
            MetadataItem.copyright,
            MetadataItem.description,
            MetadataItem.director,
            MetadataItem.encodedBy,
            MetadataItem.encodingTool,
            MetadataItem.executiveProducer,
            MetadataItem.fileType,
            MetadataItem.genre,
            MetadataItem.grouping,
            MetadataItem.information,
            MetadataItem.isrc,
            MetadataItem.label,
            MetadataItem.linerNotes,
            MetadataItem.longDescription,
            MetadataItem.lyricist,
            MetadataItem.lyrics,
            MetadataItem.movementName,
            MetadataItem.narrator,
            MetadataItem.originalArtist,
            MetadataItem.owner,
            MetadataItem.performers,
            MetadataItem.podcastCategory,
            MetadataItem.podcastFeed,
            MetadataItem.podcastID,
            MetadataItem.podcastKeywords,
            MetadataItem.predefinedGenre,
            MetadataItem.publisher,
            MetadataItem.publisherWebpage,
            MetadataItem.purchaseDate,
            MetadataItem.recordCompany,
            MetadataItem.recordingDate,
            MetadataItem.recordingCopyright,
            MetadataItem.releaseDate,
            MetadataItem.requirements,
            MetadataItem.sellerID,
            MetadataItem.soundEngineer,
            MetadataItem.softwareVersion,
            MetadataItem.soloist,
            MetadataItem.songDescription,
            MetadataItem.songwriter,
            MetadataItem.songwriterKeywords,
            MetadataItem.sourceCredit,
            MetadataItem.subtitle,
            MetadataItem.subtitleKeywords,
            MetadataItem.title,
            MetadataItem.titleKeywords,
            MetadataItem.titleSort,
            MetadataItem.thanks,
            MetadataItem.trackSubtitle,
            MetadataItem.tvEpisodeTitle,
            MetadataItem.tvNetwork,
            MetadataItem.tvShow,
            MetadataItem.tvShowDescription,
            MetadataItem.tvShowSort,
            MetadataItem.website,
            MetadataItem.work,
            MetadataItem.writer] {
                if let mp4Key = item.mp4StringKey {
                    mapping[mp4Key] = item
                }
        }
        return mapping
    }()

    // MARK: Init From AtomID
    private static let mp4IntIDToMetadataMapping: [IntegerMetadataIdentifier : MetadataItem] = {
        var mapping = [IntegerMetadataIdentifier : MetadataItem]()
        for item in [
            MetadataItem.albumID,
            MetadataItem.appleStoreCountryID,
            MetadataItem.artistID,
            MetadataItem.bpm,
            MetadataItem.compilation,
            MetadataItem.composerID,
            MetadataItem.conductorID,
            MetadataItem.gaplessPlayback,
            MetadataItem.genreID,
            MetadataItem.mediaType,
            MetadataItem.movementCount,
            MetadataItem.movementNumber,
            MetadataItem.playlistID,
            MetadataItem.podcast,
            MetadataItem.rating,
            MetadataItem.showWork,
            MetadataItem.tvEpisodeNumber,
            MetadataItem.tvSeason,
            MetadataItem.year] {
                if let mp4Key = item.mp4IntegerKey {
                    mapping[mp4Key] = item
                }
        }
        return mapping
    }()

    private static let mp4OtherToMetadataMapping: [String: MetadataItem] = {
        var mapping = [String: MetadataItem]()
        for item in [
            MetadataItem.audioFileWebpage,
            MetadataItem.audioSourceWebpage,
            MetadataItem.coverArt,
            MetadataItem.discNumber,
            MetadataItem.copyrightWebpage,
            MetadataItem.encodingSettings,
            MetadataItem.initialKey,
            MetadataItem.mood,
            MetadataItem.originalAlbum,
            MetadataItem.originalFilename,
            MetadataItem.originalLyricist,
            MetadataItem.originalReleaseTime,
            MetadataItem.paymentWebpage,
            MetadataItem.producedNotice,
            MetadataItem.radioStation,
            MetadataItem.radioStationOwner,
            MetadataItem.taggingTime,
            MetadataItem.trackNumber,
            MetadataItem.unknown] {
                if let mp4Key = item.mp4KeyOther {
                    mapping[mp4Key] = item
                }
        }
        return mapping
    }()

    init?(from mp4ID: String) {
        if let stringID = StringMetadataIdentifier(rawValue: mp4ID), MetadataItem.mp4StringIDToMetadataMapping[stringID] != nil {
            self = MetadataItem.mp4StringIDToMetadataMapping[stringID]!
        } else if let intID = IntegerMetadataIdentifier(rawValue: mp4ID),
            MetadataItem.mp4IntIDToMetadataMapping[intID] != nil {
            self = MetadataItem.mp4IntIDToMetadataMapping[intID]!
        } else if let metadata = MetadataItem.mp4OtherToMetadataMapping[mp4ID] {
                self = metadata
        } else {
            return nil
        }
    }
}
