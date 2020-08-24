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
public enum MetadataItem: CaseIterable {
    // MARK: A
    case acknowledgment
    case album
    case albumArtist
    case albumArtistSort
    case albumID // int 1
    case albumSort
    case appleStoreCountryID // int 2
    case arranger
    case arrangerKeywords // array 1
    case artDirector // other 1
    case artist
    case artistID // int 3
    case artistKeywords // array 2
    case artistSort
    case artistWebpage
    case audioFileWebpage
    case audioSourceWebpage
    // MARK: - B-C
    case bpm // int 4
    case comment
    case compilation // bool 1
    case composer
    case composerID // int 5
    case composerKeywords // array 3
    case composerSort
    case conductor
    case conductorID // int 6
    case contentAdvisory // other 2
    case contentRating // other 14
    case copyright
    case copyrightWebpage
    case coverArt // image 1
    // MARK: - D-F
    case description
    case director // other 3
    case discNumber // tuple 1
    case encodedBy
    case encodingSettings
    case encodingTime // date 2
    case encodingTool
    case executiveProducer // other 4
    case fileType // other 5
    case filmMakerWebpage
    // MARK: - G-L
    case gaplessPlayback // bool 2
    case genre
    case genreID // int 7
    case grouping
    case information
    case initialKey // other 6
    case involvedPeopleList // other 7
    case isrc
    case label
    case languages // other 8
    case length // int 8
    case linerNotes
    case longDescription
    case lyricist
    case lyrics
    // MARK: - M-N
    case mediaType // other 9
    case mood
    case movementName
    case movementCount // int 9
    case movementNumber // int 10
    case musicianCreditsList // other 10
    case narrator
    case originalAlbum
    case originalArtist
    case originalFilename
    case originalLyricist
    case originalReleaseTime // date 3
    case owner
    // MARK: - P
    case paymentWebpage
    case performers // other 11
    case playlistDelay
    case playlistID // int 11
    case podcast // bool 3
    case podcastCategory
    case podcastDescription
    case podcastFeed
    case podcastID
    case podcastKeywords // array 4
    case predefinedGenre // other 12
    case producedNotice
    case producer // other 13
    case producerKeywords // array 5
    case publisher
    case publisherWebpage
    case purchaseDate // date 4
    // MARK: - R-S
    case radioStation
    case radioStationOwner
    case radioStationWebpage
    case recordCompany
    case recordingDate // date 5
    case recordingCopyright
    case releaseDate // date 6
    case requirements
    case sellerID
    case showWorkAndMovement // bool 4
    case soundEngineer // other 15
    case softwareVersion
    case soloist // other 16
    case songDescription
    case songwriterKeywords // array 6
    case sourceCredit
    case subtitle
    case subtitleKeywords // array 7
    // MARK: - T-Z
    case taggingTime // date 7
    case title
    case titleKeywords // array 8
    case titleSort
    case thanks
    case trackNumber // tuple 2
    case trackSubtitle
    case tvEpisodeNumber // int 12
    case tvEpisodeTitle
    case tvNetwork
    case tvSeason // int 13
    case tvShow
    case tvShowDescription
    case tvShowSort
    case website
    case work
    case writer
    case unknown // other 17
    case year // date 9
    
    // MARK: - ID3 Frame Keys
    var id3Key: SwiftTaggerID3.FrameKey {
        switch self {
            case .acknowledgment:
                return .userDefinedText(description: "Acknowledgment")
            case .album:
                return .album
            case .albumArtist:
                return .albumArtist
            case .albumArtistSort:
                return .albumArtistSort
            case .albumID:
                return .userDefinedText(description: "AlbumID")
            case .albumSort:
                return .albumSort
            case .appleStoreCountryID:
                return .userDefinedText(description: "AppleStoreCountryID")
            case .arranger:
                return .arranger
            case .arrangerKeywords:
                return .userDefinedText(description: "Arranger Keywords")
            case .artDirector:
                return .involvedPeopleList
            case .artist:
                return .artist
            case .artistID:
                return .userDefinedText(description: "ArtistID")
            case .artistKeywords:
                return .userDefinedText(description: "Artist Keywords")
            case .artistSort:
                return .artistSort
            case .artistWebpage:
                return .artistWebpage
            case .audioFileWebpage:
                return .audioFileWebpage
            case .audioSourceWebpage:
                return .audioSourceWebpage
            // MARK: - B-C
            case .bpm:
                return .bpm
            case .comment:
                return .comments(description: "Comment")
            case .compilation:
                return .compilation
            case .composer:
                return .composer
            case .composerID:
                return .userDefinedText(description: "ComposerID")
            case .composerKeywords:
                return .userDefinedText(description: "Composer Keywords")
            case .composerSort:
                return .composerSort
            case .conductor:
                return .conductor
            case .conductorID:
                return .userDefinedText(description: "ConductorID")
            case .contentAdvisory:
                return .userDefinedText(description: "Content Advisory")
            case .contentRating:
                return .userDefinedText(description: "Content Rating")
            case .copyright:
                return .copyright
            case .copyrightWebpage:
                return .copyrightWebpage
            case .coverArt:
                return .attachedPicture(description: "FrontCover")
            // MARK: - D-F
            case .description:
                return .comments(description: "Description")
            case .director:
                return .involvedPeopleList
            case .discNumber:
                return .discNumber
            case .encodedBy:
                return .encodedBy
            case .encodingSettings:
                return .encodingSettings
            case .encodingTime:
                return .encodingTime
            case .encodingTool:
                return .userDefinedText(description: "Encoding Tool")
            case .executiveProducer:
                return .involvedPeopleList
            case .fileType:
                return .fileType
            case .filmMakerWebpage:
                return .userDefinedWebpage(description: "FilmMaker Webpage")
            // MARK: - G-L
            case .gaplessPlayback:
                return .playlistDelay
            case .genre:
                return .genre
            case .genreID:
                return .userDefinedText(description: "GenreID")
            case .grouping:
                return .grouping
            case .information:
                return .userDefinedText(description: "Information")
            case .initialKey:
                return .initialKey
            case .involvedPeopleList:
                return .involvedPeopleList
            case .isrc:
                return .isrc
            case .label:
                return .userDefinedText(description: "Label")
            case .languages:
                return .languages
            case .length:
                return .length
            case .linerNotes:
                return .comments(description: "Liner Notes")
            case .longDescription:
                return .comments(description: "Long Description")
            case .lyricist:
                return .lyricist
            case .lyrics:
                return .unsynchronizedLyrics(description: "Lyrics")
            // MARK: - M-N
            case .mediaType:
                return .mediaType
            case .mood:
                return .mood
            case .movementName:
                return .movementName
            case .movementCount:
                return .movementCount
            case .movementNumber:
                return .movementNumber
            case .musicianCreditsList:
                return .musicianCreditsList
            case .narrator:
                return .userDefinedText(description: "Narrator")
            case .originalAlbum:
                return .originalAlbum
            case .originalArtist:
                return .originalArtist
            case .originalFilename:
                return .originalFilename
            case .originalLyricist:
                return .originalLyricist
            case .originalReleaseTime:
                return .originalReleaseTime
            case .owner:
                return .fileOwner
            // MARK: - P
            case .paymentWebpage:
                return .paymentWebpage
            case .performers:
                return .musicianCreditsList
            case .playlistDelay:
                return .playlistDelay
            case .playlistID:
                return .userDefinedWebpage(description: "PlaylistID")
            case .podcast:
                return .userDefinedText(description: "Podcast")
            case .podcastCategory:
                return .podcastCategory
            case .podcastDescription:
                return .podcastDescription
            case .podcastFeed:
                return .podcastFeedLink
            case .podcastID:
                return .podcastID
            case .podcastKeywords:
                return .podcastKeywords
            case .predefinedGenre:
                return .userDefinedText(description: "Predefined Genre")
            case .producedNotice:
                return .producedNotice
            case .producer:
                return .involvedPeopleList
            case .producerKeywords:
                return .userDefinedText(description: "Producer Keywords")
            case .publisher:
                return .publisher
            case .publisherWebpage:
                return .publisherWebpage
            case .purchaseDate:
                return .userDefinedText(description: "Purchase Date")
            // MARK: - R-S
            case .radioStation:
                return .radioStation
            case .radioStationOwner:
                return .radioStationOwner
            case .radioStationWebpage:
                return .radioStationWebpage
            case .recordCompany:
                return .userDefinedText(description: "Record Company")
            case .recordingDate:
                return .recordingDate
            case .recordingCopyright:
                return .userDefinedText(description: "Recording Copyright")
            case .releaseDate:
                return .releaseTime
            case .requirements:
                return .userDefinedText(description: "Requirements")
            case .sellerID:
                return .userDefinedText(description: "Seller")
            case .showWorkAndMovement:
                return .userDefinedText(description: "Show Work And Movement")
            case .soundEngineer:
                return .involvedPeopleList
            case .softwareVersion:
                return .userDefinedText(description: "Software Version")
            case .soloist:
                return .musicianCreditsList
            case .songDescription:
                return .comments(description: "Song Description")
            case .songwriterKeywords:
                return .userDefinedText(description: "Songwriter Keywords")
            case .sourceCredit:
                return .userDefinedText(description: "Source Credit")
            case .subtitle:
                return .subtitle
            case .subtitleKeywords:
                return .userDefinedText(description: "Subtitle Keywords")
            // MARK: - T-Z
            case .taggingTime:
                return .taggingTime
            case .title:
                return .title
            case .titleKeywords:
                return .userDefinedText(description: "Title Keywords")
            case .titleSort:
                return .titleSort
            case .thanks:
                return .userDefinedText(description: "Thanks")
            case .trackNumber:
                return .trackNumber
            case .trackSubtitle:
                return .setSubtitle
            case .tvEpisodeNumber:
                return .userDefinedWebpage(description: "Episode Number")
            case .tvEpisodeTitle:
                return .userDefinedText(description: "Episode Name")
            case .tvNetwork:
                return .userDefinedText(description: "Network")
            case .tvSeason:
                return .userDefinedText(description: "Season")
            case .tvShow:
                return .userDefinedText(description: "Series Name")
            case .tvShowDescription:
                return .comments(description: "Series Description")
            case .tvShowSort:
                return .userDefinedText(description: "Series Sort")
            case .website:
                return .userDefinedWebpage(description: "Webpage")
            case .work:
                return .contentGroup
            case .writer:
                return .userDefinedText(description: "Writer")
            case .unknown:
                return .userDefinedText(description: "Unknown")
            case .year:
                return .year
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
    var mp4Key: SwiftTaggerMP4.AtomIdentifier {
        switch self {
            case .acknowledgment:
                return .acknowledgment
            case .album:
                return .album
            case .albumArtist:
                return .albumArtist
            case .albumArtistSort:
                return .albumArtistSort
            case .albumID:
                return .albumID
            case .albumSort:
                return .albumSort
            case .appleStoreCountryID:
                return .appleStoreCountryID
            case .arranger:
                return .arranger
            case .arrangerKeywords:
                return .arrangerKeywords
            case .artDirector:
                return .artDirector
            case .artist:
                return .artist
            case .artistID:
                return .artistID
            case .artistKeywords:
                return .artistKeywords
            case .artistSort:
                return .artistSort
            case .artistWebpage:
                return .artistUrl
            case .audioFileWebpage:
                return .unknown
            case .audioSourceWebpage:
                return .unknown
            // MARK: - B-C
            case .bpm:
                return .bpm
            case .comment:
                return .comment
            case .compilation:
                return .compilation
            case .composer:
                return .composer
            case .composerID:
                return .composerID
            case .composerKeywords:
                return .composerKeywords
            case .composerSort:
                return .composerSort
            case .conductor:
                return .conductor
            case .conductorID:
                return .conductorID
            case .contentAdvisory:
                return .unknown
            case .contentRating:
                return .rating
            case .copyright:
                return .copyright
            case .copyrightWebpage:
                return .unknown
            case .coverArt:
                return .coverArt
            // MARK: - D-F
            case .description:
                return .description
            case .director:
                return .director
            case .discNumber:
                return .discNumber
            case .encodedBy:
                return .encodedBy
            case .encodingSettings:
                return .unknown
            case .encodingTime:
                return .unknown
            case .encodingTool:
                return .encodingTool
            case .executiveProducer:
                return .executiveProducer
            case .fileType:
                return .format
            case .filmMakerWebpage:
                return .filmMakerUrl
            // MARK: - G-L
            case .gaplessPlayback:
                return .gaplessPlayback
            case .genre:
                return .customGenre
            case .genreID:
                return .genreID
            case .grouping:
                return .grouping
            case .information:
                return .information
            case .initialKey:
                return .unknown
            case .involvedPeopleList:
                return .unknown
            case .isrc:
                return .isrc
            case .label:
                return .label
            case .languages:
                return .unknown
            case .length:
                return .unknown
            case .linerNotes:
                return .linerNotes
            case .longDescription:
                return .longDescription
            case .lyricist:
                return .lyricist
            case .lyrics:
                return .lyrics
            // MARK: - M-N
            case .mediaType:
                return .mediaType
            case .mood:
                return .unknown
            case .movementName:
                return .movementName
            case .movementCount:
                return .movementCount
            case .movementNumber:
                return .movementNumber
            case .musicianCreditsList:
                return .unknown
            case .narrator:
                return .narrator
            case .originalAlbum:
                return .unknown
            case .originalArtist:
                return .originalArtist
            case .originalFilename:
                return .unknown
            case .originalLyricist:
                return .unknown
            case .originalReleaseTime:
                return .unknown
            case .owner:
                return .owner
            // MARK: - P
            case .paymentWebpage:
                return .unknown
            case .performers:
                return .performers
            case .playlistDelay:
                return .gaplessPlayback
            case .playlistID:
                return .playlistID
            case .podcast:
                return .podcast
            case .podcastCategory:
                return .category
            case .podcastDescription:
                return .unknown
            case .podcastFeed:
                return .podcastUrl
            case .podcastID:
                return .podcastID
            case .podcastKeywords:
                return .keywords
            case .predefinedGenre:
                return .predefinedGenre
            case .producedNotice:
                return .unknown
            case .producer:
                return .producer
            case .producerKeywords:
                return .producerKeywords
            case .publisher:
                return .publisher
            case .publisherWebpage:
                return .publisherUrl
            case .purchaseDate:
                return .purchaseDate
            // MARK: - R-S
            case .radioStation:
                return .unknown
            case .radioStationOwner:
                return .unknown
            case .radioStationWebpage:
                return .unknown
            case .recordCompany:
                return .recordCompany
            case .recordingDate:
                return .recordingDate
            case .recordingCopyright:
                return .recordingCopyright
            case .releaseDate:
                return .releaseDate
            case .requirements:
                return .requirements
            case .sellerID:
                return .sellerID
            case .showWorkAndMovement:
                return .showWorkAndMovement
            case .soundEngineer:
                return .soundEngineer
            case .softwareVersion:
                return .softwareVersion
            case .soloist:
                return .soloist
            case .songDescription:
                return .songDescription
            case .songwriterKeywords:
                return .songwriterKeywords
            case .sourceCredit:
                return .sourceCredit
            case .subtitle:
                return .subtitle
            case .subtitleKeywords:
                return .subtitleKeywords
            // MARK: - T-Z
            case .taggingTime:
                return .unknown
            case .title:
                return .title
            case .titleKeywords:
                return .titleKeywords
            case .titleSort:
                return .titleSort
            case .thanks:
                return .thanks
            case .trackNumber:
                return .trackNumber
            case .trackSubtitle:
                return .trackSubtitle
            case .tvEpisodeNumber:
                return .tvEpisodeNumber
            case .tvEpisodeTitle:
                return .tvEpisodeTitle
            case .tvNetwork:
                return .tvNetwork
            case .tvSeason:
                return .tvSeason
            case .tvShow:
                return .tvShow
            case .tvShowDescription:
                return .tvShowDescription
            case .tvShowSort:
                return .tvShowSort
            case .website:
                return .website
            case .work:
                return .workName
            case .writer:
                return .writer
            case .unknown:
                return .unknown
            case .year:
                return .recordingYear
        }
    }
    
    // MARK: Init From AtomID
    private static let mp4KeyToMetadataMapping: [SwiftTaggerMP4.AtomIdentifier : MetadataItem] = {
        var mapping = [SwiftTaggerMP4.AtomIdentifier : MetadataItem]()
        for item in MetadataItem.allCases {
            let mp4Key = item.mp4Key
            mapping[mp4Key] = item
        }
        return mapping
    }()
    
    init?(from mp4Key: SwiftTaggerMP4.AtomIdentifier) {
        if let metadata = MetadataItem.mp4KeyToMetadataMapping[mp4Key] {
            self = metadata
        } else {
            return nil
        }
    }
}

@available(OSX 10.13, *)
enum MetadataID_Other: CaseIterable {
    case contentRating
    case contentAdvisory
    case fileType
    case mediaType
    case initialKey
    case languages
    case predefinedGenre
    case coverArt
    case involvedPeopleList
    case musicianCreditsList
    case unknown
    
    var metadataItem: MetadataItem {
        switch self {
            case .initialKey: return .initialKey
            case .languages: return .languages
            case .fileType: return .fileType
            case .mediaType: return .mediaType
            case .predefinedGenre: return .predefinedGenre
            case .contentAdvisory: return .contentAdvisory
            case .contentRating: return .contentRating
            case .coverArt: return .coverArt
            case .involvedPeopleList: return .involvedPeopleList
            case .musicianCreditsList: return .musicianCreditsList
            case .unknown: return .unknown
        }
    }
}
