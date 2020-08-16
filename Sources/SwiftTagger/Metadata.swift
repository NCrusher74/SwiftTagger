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
public enum Metadata {
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
    case copyright
    case copyrightWebpage
    case coverArt
    // MARK: - D-F
    case date
    case description
    case director
    case discNumber
    case encodedBy
    case encodingSettings
    case encodingTime
    case encodingTool
    case executiveProducer
    case fileType
    case filmMakerWebpage
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
    case languages
    case length
    case linerNotes
    case longDescription
    case lyrics
    case lyricist
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
    case showWorkAndMovement
    case soundEngineer
    case softwareVersion
    case soloist
    case songDescription
    case songwriterKeywords
    case sourceCredit
    case subtitle
    case subtitleKeywords
    // MARK: - T-Z
    case taggingTime
    case time
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
            case .bpm:
                return .bpm
            case .comment:
                return .comments(description: "")
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
            case .copyright:
                return .copyright
            case .copyrightWebpage:
                return .copyrightWebpage
            case .coverArt:
                return .attachedPicture(description: "FrontCover")
            case .date:
                return .date
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
            case .lyrics:
                return .unsynchronizedLyrics(description: "Lyrics")
            case .lyricist:
                return .lyricist
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
            case .paymentWebpage:
                return .paymentWebpage
            case .performers:
                return .musicianCreditsList
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
            case .radioStation:
                return .radioStation
            case .radioStationOwner:
                return .radioStationOwner
            case .radioStationWebpage:
                return .radioStationWebpage
            case .rating:
                return .userDefinedText(description: "Content Rating")
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
            case .taggingTime:
                return .taggingTime
            case .time:
                return .time
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
            case .copyright:
                return .copyright
            case .copyrightWebpage:
                return .unknown
            case .coverArt:
                return .coverArt
            case .date:
                return .unknown
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
            case .lyrics:
                return .lyrics
            case .lyricist:
                return .lyricist
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
            case .paymentWebpage:
                return .unknown
            case .performers:
                return .performers
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
            case .radioStation:
                return .unknown
            case .radioStationOwner:
                return .unknown
            case .radioStationWebpage:
                return .unknown
            case .rating:
                return .rating
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
            case .taggingTime:
                return .unknown
            case .time:
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
}
