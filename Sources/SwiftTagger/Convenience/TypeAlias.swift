//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/24/20.
//

import Foundation
import SwiftTaggerID3
import SwiftTaggerMP4
import SwiftLanguageAndLocaleCodes

typealias Id3Tag = SwiftTaggerID3.Tag
typealias Mp4Tag = SwiftTaggerMP4.Tag

typealias Atom = SwiftTaggerMP4.Atom

public typealias MusicianCredits = MusicianAndPerformerCredits
public typealias InvolvementCredits = InvolvedPersonCredits
public typealias GenreID3 = GenreType
public typealias KeySignature = SwiftTaggerID3.KeySignature

public typealias GenreMP4 = Genre
public typealias ContentRating = SwiftTaggerMP4.ContentRating
public typealias Stik = SwiftTaggerMP4.Stik
public typealias Rating = SwiftTaggerMP4.Rating

public typealias ISO6392Code = SwiftLanguageAndLocaleCodes.ISO6392Code
public typealias ICULocaleCode = SwiftLanguageAndLocaleCodes.ICULocaleCode

//    func atomKey(_ additionalIdentifier: String?) -> AtomKey {
//        switch self {
//            case .acknowledgment: return .acknowledgment
//            case .album: return .album
//            case .albumArtist: return .albumArtist
//            case .albumArtistSort: return .albumArtistSort
//            case .albumSort: return .albumSort
//            case .appleStoreCountryID: return .appleStoreCountryID
//            case .arranger: return .arranger
//            case .arrangerKeywords: return .arrangerKeywords
//            case .artDirector: return .artDirector
//            case .artist: return .artist
//            case .artistID: return .artistID
//            case .artistKeywords: return .artistKeywords
//            case .artistSort: return .artistSort
//            case .artistWebpage: return .artistUrl
//            case .audioFileWebpage: return .unknown("Audio File Webpage")
//            case .audioSourceWebpage: return .unknown("Audio Source Webpage")
//            case .bpm: return .bpm
//            case .comments: return .comment
//            case .compilation: return .compilation
//            case .composer: return .composer
//            case .composerID: return .composerID
//            case .composerKeywords: return .composerKeywords
//            case .composerSort: return .composerSort
//            case .conductor: return .conductor
//            case .conductorID: return .conductorID
//            case .contentRating: return .unknown("iTunEXTC")
//            case .copyright: return .copyright
//            case .copyrightWebpage: return .unknown("Copyright Webpage")
//            case .coverArt: return .coverArt
//            case .description: return .description
//            case .director: return .director
//            case .discNumber: return .discNumber
//            case .encodingDateTime: return .unknown("Encoding Date/Time")
//            case .encodedBy: return .encodedBy
//            case .encoderAndSettings: return .encodingTool
//            case .executiveProducer: return .executiveProducer
//            case .gaplessPlayback: return .gaplessPlayback
//            case .genreCustom: return .customGenre
//            case .genrePredefined: return .predefinedGenre
//            case .genreID: return .genreID
//            case .grouping: return .grouping
//            case .information: return .information
//            case .initialKey: return .unknown("Initial Key")
//            case .involvedPeopleList: return .unknown(additionalIdentifier ?? "Involved Person")
//            case .isrc: return .isrc
//            case .iTunesAccount: return .iTunesAccount
//            case .iTunesAccountType: return .iTunesAccountType
//            case .label: return .label
//            case .labelWebpage: return .labelUrl
//            case .languages: return .unknown(additionalIdentifier ?? "Language")
//            case .length: return .unknown(additionalIdentifier ?? "Length")
//            case .linerNotes: return .linerNotes
//            case .longDescription: return .longDescription
//            case .lyrics: return .lyrics
//            case .lyricist: return .lyricist
//            case .mediaKind: return .mediaKind
//            case .mood: return .unknown("Mood")
//            case .movementCount: return .movementCount
//            case .movement: return .movementName
//            case .movementNumber: return .movementNumber
//            case .musicianCreditsList: return .unknown(additionalIdentifier ?? "Performer")
//            case .narrator: return .narrator
//            case .originalAlbum: return .unknown("Original Album")
//            case .originalArtist: return .originalArtist
//            case .originalFilename: return .unknown("Original Filename")
//            case .originalLyricist: return .unknown("Original Lyricist")
//            case .originalReleaseDateTime: return .unknown("Original Release Date/Time")
//            case .owner: return .owner
//            case .paymentWebpage: return .unknown("Payment Webpage")
//            case .performers: return .performers
//            case .playlistDelay: return .unknown(additionalIdentifier ?? "")
//            case .playlistID: return .playlistID
//            case .podcast: return .podcast
//            case .podcastCategory: return .category
//            case .podcastDescription: return .unknown("Podcast Description")
//            case .podcastID: return .podcastID
//            case .podcastKeywords: return .keywords
//            case .podcastFeed: return .podcastUrl
//            case .producer: return .producer
//            case .producerKeywords: return .producerKeywords
//            case .producedNotice: return .unknown("Produced Notice")
//            case .publisher: return .publisher
//            case .publisherWebpage: return .unknown("Publisher Webpage")
//            case .purchaseDateTime: return .purchaseDate
//            case .radioStation: return .unknown("Radio Station")
//            case .radioStationOwner: return .unknown("Radio Station Owner")
//            case .radioStationWebpage: return .unknown("Radio Station Webpage")
//            case .rating: return .rating
//            case .recordCompany: return .recordCompany
//            case .recordCompanyWebpage: return .recordCompanyUrl
//            case .recordingCopyright: return .recordingCopyright
//            case .recordingDateTime: return .recordingDate
//            case .releaseDateTime: return .releaseDate
//            case .requirements: return .requirements
//            case .sellerID: return .sellerID
//            case .setOrTrackSubtitle: return .trackSubtitle
//            case .showWorkAndMovement: return .showWorkAndMovement
//            case .soundEngineer: return .soundEngineer
//            case .softwareVersion: return .softwareVersion
//            case .soloist: return .soloist
//            case .songDescription: return .songDescription
//            case .songwriter: return .songwriter
//            case .songwriterKeywords: return .songwriterKeywords
//            case .sourceCredit: return .sourceCredit
//            case .subtitle: return .subtitle
//            case .subtitleKeywords: return .subtitleKeywords
//            case .taggingDateTime: return .unknown("Tagging Date/Time")
//            case .title: return .title
//            case .titleKeywords: return .titleKeywords
//            case .titleSort: return .titleSort
//            case .thanks: return .thanks
//            case .trackNumber: return .trackNumber
//            case .seriesEpisodeNumber: return .tvEpisodeNumber
//            case .seriesEpisodeTitle: return .tvEpisodeTitle
//            case .seriesDistributor: return .tvNetwork
//            case .seriesSeason: return .tvSeason
//            case .series: return .tvShow
//            case .seriesDescription: return .tvShowDescription
//            case .seriesSort: return .tvShowSort
//            case .userDefined: return .unknown(additionalIdentifier ?? "")
//            case .userDefinedWebpage: return .unknown(additionalIdentifier ?? "Webpage")
//            case .work: return .workName
//            case .writer: return .writer
//            case .year: return .year
//        }
//    }
//
//    func frameKey(_ language: ISO6392Code?, _ additionalIdentifier: String?) -> FrameKey {
//        switch self {
//            case .acknowledgment: return .userDefinedText("Acknowledgments")
//            case .album: return .album
//            case .albumArtist: return .albumArtist
//            case .albumArtistSort: return .albumArtistSort
//            case .albumSort: return .albumSort
//            case .appleStoreCountryID: return .userDefinedText("AppleStoreCountryID")
//            case .arranger: return .arranger
//            case .arrangerKeywords: return .userDefinedText("Arranger Keywords")
//            case .artDirector: return .involvedPeopleList
//            case .artist: return .artist
//            case .artistID: return .userDefinedText("ArtistID")
//            case .artistKeywords: return .userDefinedText("Artist Keywords")
//            case .artistSort: return .artistSort
//            case .artistWebpage: return .artistWebpage
//            case .audioFileWebpage: return .audioFileWebpage
//            case .audioSourceWebpage: return .audioSourceWebpage
//            case .bpm: return .bpm
//            case .comments: return .comments(language: language ?? .und, description: additionalIdentifier ?? "Comment")
//            case .compilation: return .compilation
//            case .composer: return .composer
//            case .composerID: return .userDefinedText("ComposerID")
//            case .composerKeywords: return .userDefinedText("Composer Keywords")
//            case .composerSort: return .composerSort
//            case .conductor: return .conductor
//            case .conductorID: return .userDefinedText("ConductorID")
//            case .contentRating: return .userDefinedText("iTunEXTC")
//            case .copyright: return .copyright
//            case .copyrightWebpage: return .copyrightWebpage
//            case .coverArt: return .attachedPicture(imageType: .other)
//            case .description: return .comments(language: language ?? .und, description: "Description")
//            case .director: return .involvedPeopleList
//            case .discNumber: return .discNumber
//            case .encodingDateTime: return .encodingTime
//            case .encodedBy: return .encodedBy
//            case .encoderAndSettings: return .encodingSettings
//            case .executiveProducer: return .involvedPeopleList
//            case .gaplessPlayback: return .playlistDelay
//            case .genreCustom: return .genre
//            case .genrePredefined: return .genre
//            case .genreID: return .userDefinedText("GenreID")
//            case .grouping: return .grouping
//            case .information: return .userDefinedText("Information")
//            case .initialKey: return .initialKey
//            case .involvedPeopleList: return .involvedPeopleList
//            case .isrc: return .isrc
//            case .iTunesAccount: return .userDefinedText("iTunes Account")
//            case .iTunesAccountType: return .userDefinedText("iTunes Account Type")
//            case .label: return .userDefinedText("Label")
//            case .labelWebpage: return .userDefinedWebpage("Label Webpage")
//            case .languages: return .languages
//            case .length: return .length
//            case .linerNotes: return .comments(language: language ?? .und, description: "Liner Notes")
//            case .longDescription:return .comments(language: language ?? .und, description: "Long Description")
//            case .lyrics:return .unsynchronizedLyrics(language: language ?? .und, description: additionalIdentifier ?? "Lyrics")
//            case .lyricist: return .lyricist
//            case .mediaKind: return .userDefinedText("Media Kind")
//            case .mood: return .mood
//            case .movementCount: return .movementCount
//            case .movement: return .movement
//            case .movementNumber: return .movementNumber
//            case .musicianCreditsList: return .musicianCreditsList
//            case .narrator: return .userDefinedText("Narrator")
//            case .originalAlbum: return .originalAlbum
//            case .originalArtist: return .originalArtist
//            case .originalFilename: return .originalFilename
//            case .originalLyricist: return .originalLyricist
//            case .originalReleaseDateTime: return .originalReleaseTime
//            case .owner: return .fileOwner
//            case .paymentWebpage: return .paymentWebpage
//            case .performers: return .musicianCreditsList
//            case .playlistDelay: return .playlistDelay
//            case .playlistID: return .userDefinedText("PlaylistID")
//            case .podcast: return .userDefinedText("podcast")
//            case .podcastCategory: return .podcastCategory
//            case .podcastDescription: return .podcastDescription
//            case .podcastID: return .podcastID
//            case .podcastKeywords: return .podcastKeywords
//            case .podcastFeed: return .podcastFeed
//            case .producer: return .involvedPeopleList
//            case .producerKeywords: return .userDefinedText("Producer Keywords")
//            case .producedNotice: return .producedNotice
//            case .publisher: return .publisher
//            case .publisherWebpage: return .publisherWebpage
//            case .purchaseDateTime: return .userDefinedText("Purchase Date/Time")
//            case .radioStation: return .radioStation
//            case .radioStationOwner: return .radioStationOwner
//            case .radioStationWebpage: return .radioStationWebpage
//            case .rating: return .userDefinedText("Rating")
//            case .recordCompany: return .userDefinedText("Record Company")
//            case .recordCompanyWebpage: return .userDefinedWebpage("Record Company Webpage")
//            case .recordingCopyright: return .userDefinedText("Recording Copyright")
//            case .recordingDateTime: return .recordingDate
//            case .releaseDateTime: return .releaseTime
//            case .requirements: return .userDefinedText("Requirements")
//            case .sellerID: return .userDefinedText("SellerID")
//            case .setOrTrackSubtitle: return .setSubtitle
//            case .showWorkAndMovement: return .userDefinedText("Show Work And Movement")
//            case .soundEngineer: return .involvedPeopleList
//            case .softwareVersion: return .userDefinedText("Software Version")
//            case .soloist: return .musicianCreditsList
//            case .songDescription: return .comments(language: language ?? .und, description: "Song Description")
//            case .songwriter: return .involvedPeopleList
//            case .songwriterKeywords: return .userDefinedText("Songwriter Keywords")
//            case .sourceCredit: return .userDefinedText("Source Credit")
//            case .subtitle: return .subtitle
//            case .subtitleKeywords: return .userDefinedText("Subtitle Keywords")
//            case .taggingDateTime: return .taggingTime
//            case .title: return .title
//            case .titleKeywords: return .userDefinedText("Title Keywords")
//            case .titleSort: return .titleSort
//            case .thanks: return .userDefinedText("Thanks")
//            case .trackNumber: return .trackNumber
//            case .seriesEpisodeNumber: return .userDefinedText("Series Episode Number")
//            case .seriesEpisodeTitle:return .userDefinedText("Series Episode Title")
//            case .seriesDistributor:return .userDefinedText("Series Distributor")
//            case .seriesSeason:return .userDefinedText("Series Season")
//            case .series:return .userDefinedText("Series Title")
//            case .seriesDescription:return .userDefinedText("Series Description")
//            case .seriesSort:return .userDefinedText("Series Sort")
//            case .userDefined: return .userDefinedText(additionalIdentifier ?? "")
//            case .userDefinedWebpage: return .userDefinedWebpage(additionalIdentifier ?? "")
//            case .work: return .contentGroup
//            case .writer: return .involvedPeopleList
//            case .year: return .recordingDate
//        }
//    }
