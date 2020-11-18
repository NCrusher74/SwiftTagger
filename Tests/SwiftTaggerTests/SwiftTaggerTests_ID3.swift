//
//  SwiftTaggerTests_ID3.swift
//  SwiftTagger
//
//  Created by Nolaine Crusher on 10/1/20.
//

import XCTest
@testable import SwiftTagger

final class SwiftTaggerTests_ID3: XCTestCase {
    
    func testRead() throws {
        var file = try AudioFile(location: sampleMp3)
        var tag = file.id3Tag
        
        XCTAssertEqual(tag.album, "Album")
        XCTAssertEqual(tag.albumArtist, "Album Artist")
        XCTAssertEqual(tag.albumSort, "Album Sort")
        XCTAssertEqual(tag.albumArtistSort, "Album Artist Sort")
        XCTAssertEqual(tag.arranger, "Arranger")
        XCTAssertEqual(tag.artist, "Artist")
        XCTAssertEqual(tag.artistSort, "Artist Sort")
        XCTAssertEqual(tag.composer, "Composer")
        XCTAssertEqual(tag.composerSort, "Composer Sort")
        XCTAssertEqual(tag.conductor, "Conductor")
        XCTAssertEqual(tag.contentGroup, "Content Group")
        XCTAssertEqual(tag.copyright, "2020 Copyright")
        XCTAssertEqual(tag.encodedBy, "Encoded By")
        XCTAssertEqual(tag.encodingSettings, "Encoding Settings")
        XCTAssertEqual(tag.fileOwner, "File Owner")
        XCTAssertEqual(tag.grouping, "Grouping")
        XCTAssertEqual(tag.initialKey, .aFlatMinor)
        XCTAssertEqual(tag.lyricist, "Lyricist")
        XCTAssertEqual(tag.mood, "Mood")
        XCTAssertEqual(tag.movement, "Movement Name")
        XCTAssertEqual(tag.originalAlbum, "Original Album")
        XCTAssertEqual(tag.originalArtist, "Original Artist")
        XCTAssertEqual(tag.originalFilename, "Original Filename")
        XCTAssertEqual(tag.originalLyricist, "Original Lyricist")
        XCTAssertEqual(tag.podcastID, "Podcast ID")
        XCTAssertEqual(tag.podcastCategory, "Podcast Category")
        XCTAssertEqual(tag.podcastFeed, "http://podcast.url")
        XCTAssertEqual(tag.podcastDescription, "Podcast Description")
        XCTAssertEqual(tag.podcastKeywords, ["Podcast", "Keywords"])
        XCTAssertEqual(tag.publisher, "Publisher")
        XCTAssertEqual(tag.producedNotice, "2020 Produced Notice")
        XCTAssertEqual(tag.radioStation, "Radio Station")
        XCTAssertEqual(tag.radioStationOwner, "Radio Station Owner")
        XCTAssertEqual(tag.subtitle, "Subtitle")
        XCTAssertEqual(tag.setSubtitle, "Set Subtitle")
        XCTAssertEqual(tag.title, "Title")
        XCTAssertEqual(tag.titleSort, "Title Sort")
        
        XCTAssertEqual(tag.compilation, true)
        XCTAssertEqual(tag.bpm, 99)
        XCTAssertEqual(tag.isrc, "987654321098")
        XCTAssertEqual(tag.movementNumber, 5)
        XCTAssertEqual(tag.movementCount, 6)
        XCTAssertEqual(tag.playlistDelay, 0)
        
        XCTAssertEqual(tag.audioSourceWebpage, "http://audiosource.url")
        XCTAssertEqual(tag.audioFileWebpage, "http://audiofile.url")
        XCTAssertEqual(tag.artistWebpage, "http://artist.url")
        XCTAssertEqual(tag.copyrightWebpage, "http://copyright.url")
        XCTAssertEqual(tag.paymentWebpage, "http://payment.url")
        XCTAssertEqual(tag.publisherWebpage, "http://publisher.url")
        XCTAssertEqual(tag.radioStationWebpage, "http://radiostation.url")
        
        XCTAssertEqual(tag.languages, [.english])
        
        XCTAssertEqual(tag.trackNumber.track, 6)
        XCTAssertEqual(tag.trackNumber.totalTracks, 7)
        XCTAssertEqual(tag.discNumber.disc, 4)
        XCTAssertEqual(tag.discNumber.totalDiscs, 5)
        
        XCTAssertEqual(tag.involvementCreditsList[.director], ["Director Name"])
        XCTAssertEqual(tag.involvementCreditsList[.producer], ["Producer Name"])
        XCTAssertEqual(tag.musicianCreditsList[.soprano], ["Soprano Name"])
        XCTAssertEqual(tag.musicianCreditsList[.alto], ["Alto Name"])
        XCTAssertEqual(tag.encodingDateTime, testAllDate)
        XCTAssertEqual(tag.taggingDateTime, testAllDate)
        XCTAssertEqual(tag.releaseDateTime, testAllDate)
        XCTAssertEqual(tag.originalRelease, testAllDate)
        XCTAssertEqual(tag.recordingDateTime, testAllDate)
        
        XCTAssertEqual(tag[comment: "Comment", .eng], "Comment Content")
        XCTAssertEqual(tag[lyrics: "Lyrics", .eng], "Lyrics Content")
        XCTAssertEqual(tag[userDefinedUrl: "UserURL"], "http://userdefined.url")
        XCTAssertEqual(tag["UserText"], "User Text Content")
        
        XCTAssertEqual(tag.discNumber.disc, 4)
        XCTAssertEqual(tag.discNumber.totalDiscs, 5)
        XCTAssertEqual(tag.trackNumber.track, 6)
        XCTAssertEqual(tag.trackNumber.totalTracks, 7)
        
        XCTAssertEqual(tag.genre.genreCategory, .Blues)
        XCTAssertEqual(tag.genre.genre, "Blues Refinement")
        
        XCTAssertEqual(tag.mediaType.mediaType, .otherDigital)
        XCTAssertEqual(tag.mediaType.mediaTypeRefinement, .analogTransfer)
        XCTAssertEqual(tag.mediaType.additionalInformation, "Additional Information")
        
        XCTAssertEqual(tag.fileType.fileType, .MPG)
        XCTAssertEqual(tag.fileType.fileTypeRefinement, .mpegLayerIII)
        XCTAssertEqual(tag.fileType.additionalInformation, "Additional Information")
        
        let chapter1 = tag.chapterList[0]
        let chapter2 = tag.chapterList[1]
        let chapter3 = tag.chapterList[2]
        let chapter4 = tag.chapterList[3]
        let chapter5 = tag.chapterList[4]
        XCTAssertEqual(chapter1.startTime, 0)
        XCTAssertEqual(chapter2.startTime, 900)
        XCTAssertEqual(chapter3.startTime, 1950)
        XCTAssertEqual(chapter4.startTime, 3120)
        XCTAssertEqual(chapter5.startTime, 4230)
        XCTAssertEqual(chapter1.title, "Chapter 01")
        XCTAssertEqual(chapter2.title, "Chapter 02")
        XCTAssertEqual(chapter3.title, "Chapter 03")
        XCTAssertEqual(chapter4.title, "Chapter 04")
        XCTAssertEqual(chapter5.title, "Chapter 05")

        XCTAssertEqual(file.album, "Album")
        XCTAssertEqual(file.albumArtist, "Album Artist")
        XCTAssertEqual(file.albumSort, "Album Sort")
        XCTAssertEqual(file.albumArtistSort, "Album Artist Sort")
        XCTAssertEqual(file.arranger, "Arranger")
        XCTAssertEqual(file.artist, "Artist")
        XCTAssertEqual(file.artistSort, "Artist Sort")
        XCTAssertEqual(file.composer, "Composer")
        XCTAssertEqual(file.composerSort, "Composer Sort")
        XCTAssertEqual(file.conductor, "Conductor")
        XCTAssertEqual(file.work, "Content Group")
        XCTAssertEqual(file.copyright, "2020 Copyright")
        XCTAssertEqual(file.encodedBy, "Encoded By")
        XCTAssertEqual(file.encoderSettings, "Encoding Settings")
        XCTAssertEqual(file.owner, "File Owner")
        XCTAssertEqual(file.grouping, "Grouping")
        XCTAssertEqual(file.initialKey, .aFlatMinor)
        XCTAssertEqual(file.lyricist, "Lyricist")
        XCTAssertEqual(file.mood, "Mood")
        XCTAssertEqual(file.movement, "Movement Name")
        XCTAssertEqual(file.originalAlbum, "Original Album")
        XCTAssertEqual(file.originalArtist, "Original Artist")
        XCTAssertEqual(file.originalFilename, "Original Filename")
        XCTAssertEqual(file.originalLyricist, "Original Lyricist")
        XCTAssertEqual(file.podcastID, "Podcast ID")
        XCTAssertEqual(file.podcastCategory, "Podcast Category")
        XCTAssertEqual(file.podcastFeed, "http://podcast.url")
        XCTAssertEqual(file.podcastDescription, "Podcast Description")
        XCTAssertEqual(file.podcastKeywords, ["Podcast", "Keywords"])
        XCTAssertEqual(file.publisher, "Publisher")
        XCTAssertEqual(file.recordingCopyright, "2020 Produced Notice")
        XCTAssertEqual(file.radioStation, "Radio Station")
        XCTAssertEqual(file.radioStationOwner, "Radio Station Owner")
        XCTAssertEqual(file.subtitle, "Subtitle")
        XCTAssertEqual(file.trackOrSetSubtitle, "Set Subtitle")
        XCTAssertEqual(file.title, "Title")
        XCTAssertEqual(file.titleSort, "Title Sort")
        
        XCTAssertEqual(file.compilation, true)
        XCTAssertEqual(file.bpm, 99)
        XCTAssertEqual(file.isrc, "987654321098")
        XCTAssertEqual(file.movementNumber, 5)
        XCTAssertEqual(file.movementCount, 6)
        XCTAssertEqual(file.playlistDelay, 0)
        
        XCTAssertEqual(file.officialAudioSourceWebpage, "http://audiosource.url")
        XCTAssertEqual(file.officialAudioFileWebpage, "http://audiofile.url")
        XCTAssertEqual(file.artistWebpage, "http://artist.url")
        XCTAssertEqual(file.copyrightWebpage, "http://copyright.url")
        XCTAssertEqual(file.paymentWebpage, "http://payment.url")
        XCTAssertEqual(file.publisherWebpage, "http://publisher.url")
        XCTAssertEqual(file.radioStationWebpage, "http://radiostation.url")
        
        XCTAssertEqual(file.language, [.english])
        
        XCTAssertEqual(file.trackNumber.track, 6)
        XCTAssertEqual(file.trackNumber.totalTracks, 7)
        XCTAssertEqual(file.discNumber.disc, 4)
        XCTAssertEqual(file.discNumber.totalDiscs, 5)
        
        XCTAssertEqual(file.involvementCreditsList[.director], ["Director Name"])
        XCTAssertEqual(file.involvementCreditsList[.producer], ["Producer Name"])
        XCTAssertEqual(file.musicianCreditsList[.soprano], ["Soprano Name"])
        XCTAssertEqual(file.musicianCreditsList[.alto], ["Alto Name"])
        XCTAssertEqual(file.encodingDateTime, testAllDate)
        XCTAssertEqual(file.taggingDateTime, testAllDate)
        XCTAssertEqual(file.releaseDateTime, testAllDate)
        XCTAssertEqual(file.originalReleaseDateTime, testAllDate)
        XCTAssertEqual(file.recordingDateTime, testAllDate)
        
        XCTAssertEqual(file["UserText"], "User Text Content")
        
        XCTAssertEqual(file.discNumber.disc, 4)
        XCTAssertEqual(file.discNumber.totalDiscs, 5)
        XCTAssertEqual(file.trackNumber.track, 6)
        XCTAssertEqual(file.trackNumber.totalTracks, 7)
        
        XCTAssertEqual(file.genrePredefined.id3, .Blues)
        XCTAssertEqual(file.genreCustom, "Blues Refinement")
        
        let fileChapter1 = file.chapterList[0]
        let fileChapter2 = file.chapterList[1]
        let fileChapter3 = file.chapterList[2]
        let fileChapter4 = file.chapterList[3]
        let fileChapter5 = file.chapterList[4]
        XCTAssertEqual(fileChapter1.startTime, 0)
        XCTAssertEqual(fileChapter2.startTime, 900)
        XCTAssertEqual(fileChapter3.startTime, 1950)
        XCTAssertEqual(fileChapter4.startTime, 3120)
        XCTAssertEqual(fileChapter5.startTime, 4230)
        XCTAssertEqual(fileChapter1.title, "Chapter 01")
        XCTAssertEqual(fileChapter2.title, "Chapter 02")
        XCTAssertEqual(fileChapter3.title, "Chapter 03")
        XCTAssertEqual(fileChapter4.title, "Chapter 04")
        XCTAssertEqual(fileChapter5.title, "Chapter 05")
    }
    
    func testRemoveAll() throws {
        var file = try AudioFile(location: sampleMp3)

        file.removeAllChapters()
        let tag1 = file.id3Tag

        XCTAssertTrue(file.chapterList.isEmpty)
        XCTAssertTrue(tag1.chapterList.isEmpty)
        XCTAssertFalse(tag1.frames.isEmpty)
        
        file.removeAllMetadata()
        let tag2 = file.id3Tag
        XCTAssertTrue(tag2.frames.isEmpty)

        let outputUrl = tempOutputDirectory(fileExtension: .mp3)
        try file.write(outputLocation: outputUrl)
        let output = try AudioFile(location: outputUrl)

        XCTAssertTrue(output.id3Tag.frames.isEmpty)
        XCTAssertTrue(output.chapterList.isEmpty)

    }
    
    func testRemoveChapter() throws {
        var file = try AudioFile(location: sampleMp3)
        file.removeChapter(startTime: 1950)

        let outputUrl = tempOutputDirectory(fileExtension: .mp3)
        try file.write(outputLocation: outputUrl)
        var output = try AudioFile(location: outputUrl)

        let knownTitles = ["Chapter 01",
                           "Chapter 02",
                           "Chapter 04",
                           "Chapter 05"]
        let knownStarts = [0, 900, 3120, 4230]

        let tag = output.id3Tag
        
        var titles = [String]()
        var starts = [Int]()
        for chapter in tag.chapterList {
            titles.append(chapter.title)
            starts.append(chapter.startTime)
        }
        
        XCTAssertEqual(titles, knownTitles)
        XCTAssertEqual(starts, knownStarts)
        
        XCTAssertEqual(output.album, "Album")
        XCTAssertEqual(output.albumArtist, "Album Artist")
        XCTAssertEqual(output.albumSort, "Album Sort")
        XCTAssertEqual(output.albumArtistSort, "Album Artist Sort")
        XCTAssertEqual(output.arranger, "Arranger")
        XCTAssertEqual(output.artist, "Artist")
        XCTAssertEqual(output.artistSort, "Artist Sort")
        XCTAssertEqual(output.composer, "Composer")
        XCTAssertEqual(output.composerSort, "Composer Sort")
        XCTAssertEqual(output.conductor, "Conductor")
        XCTAssertEqual(output.work, "Content Group")
        XCTAssertEqual(output.copyright, "2020 Copyright")
        XCTAssertEqual(output.encodedBy, "Encoded By")
        XCTAssertEqual(output.encoderSettings, "Encoding Settings")
        XCTAssertEqual(output.owner, "File Owner")
        XCTAssertEqual(output.grouping, "Grouping")
        XCTAssertEqual(output.initialKey, .aFlatMinor)
        XCTAssertEqual(output.lyricist, "Lyricist")
        XCTAssertEqual(output.mood, "Mood")
        XCTAssertEqual(output.movement, "Movement Name")
        XCTAssertEqual(output.originalAlbum, "Original Album")
        XCTAssertEqual(output.originalArtist, "Original Artist")
        XCTAssertEqual(output.originalFilename, "Original Filename")
        XCTAssertEqual(output.originalLyricist, "Original Lyricist")
        XCTAssertEqual(output.podcastID, "Podcast ID")
        XCTAssertEqual(output.podcastCategory, "Podcast Category")
        XCTAssertEqual(output.podcastFeed, "http://podcast.url")
        XCTAssertEqual(output.podcastDescription, "Podcast Description")
        XCTAssertEqual(output.podcastKeywords, ["Podcast", "Keywords"])
        XCTAssertEqual(output.publisher, "Publisher")
        XCTAssertEqual(output.recordingCopyright, "2020 Produced Notice")
        XCTAssertEqual(output.radioStation, "Radio Station")
        XCTAssertEqual(output.radioStationOwner, "Radio Station Owner")
        XCTAssertEqual(output.subtitle, "Subtitle")
        XCTAssertEqual(output.trackOrSetSubtitle, "Set Subtitle")
        XCTAssertEqual(output.title, "Title")
        XCTAssertEqual(output.titleSort, "Title Sort")
        
        XCTAssertEqual(output.compilation, true)
        XCTAssertEqual(output.bpm, 99)
        XCTAssertEqual(output.isrc, "987654321098")
        XCTAssertEqual(output.movementNumber, 5)
        XCTAssertEqual(output.movementCount, 6)
        XCTAssertEqual(output.playlistDelay, 0)
        
        XCTAssertEqual(output.officialAudioSourceWebpage, "http://audiosource.url")
        XCTAssertEqual(output.officialAudioFileWebpage, "http://audiofile.url")
        XCTAssertEqual(output.artistWebpage, "http://artist.url")
        XCTAssertEqual(output.copyrightWebpage, "http://copyright.url")
        XCTAssertEqual(output.paymentWebpage, "http://payment.url")
        XCTAssertEqual(output.publisherWebpage, "http://publisher.url")
        XCTAssertEqual(output.radioStationWebpage, "http://radiostation.url")
        
        XCTAssertEqual(output.language, [.english])
        
        XCTAssertEqual(output.trackNumber.track, 6)
        XCTAssertEqual(output.trackNumber.totalTracks, 7)
        XCTAssertEqual(output.discNumber.disc, 4)
        XCTAssertEqual(output.discNumber.totalDiscs, 5)
        
        XCTAssertEqual(output.involvementCreditsList[.director], ["Director Name"])
        XCTAssertEqual(output.involvementCreditsList[.producer], ["Producer Name"])
        XCTAssertEqual(output.musicianCreditsList[.soprano], ["Soprano Name"])
        XCTAssertEqual(output.musicianCreditsList[.alto], ["Alto Name"])
        XCTAssertEqual(output.encodingDateTime, testAllDate)
        XCTAssertEqual(output.taggingDateTime, testAllDate)
        XCTAssertEqual(output.releaseDateTime, testAllDate)
        XCTAssertEqual(output.originalReleaseDateTime, testAllDate)
        XCTAssertEqual(output.recordingDateTime, testAllDate)
        
        XCTAssertEqual(output["UserText"], "User Text Content")
        
        XCTAssertEqual(output.discNumber.disc, 4)
        XCTAssertEqual(output.discNumber.totalDiscs, 5)
        XCTAssertEqual(output.trackNumber.track, 6)
        XCTAssertEqual(output.trackNumber.totalTracks, 7)
        
        XCTAssertEqual(output.genrePredefined.id3, .Blues)
        XCTAssertEqual(output.genreCustom, "Blues Refinement")
    }
    
    func testAddAll() throws {
        var file = try AudioFile(location: sampleMp3NoMeta)
        let test = try testSettings(&file)
        let outputUrl = try localOutputDirectory(fileName: "mp3Test", fileExtension: .mp3)
        try test.write(outputLocation: outputUrl)
        var output = try AudioFile(location: outputUrl)
        
        XCTAssertEqual(output.acknowledgment, "Acknowledgment")
        XCTAssertEqual(output.id3Tag["Acknowledgment"], "Acknowledgment")
        XCTAssertEqual(output.album, "Album")
        XCTAssertEqual(output.albumArtist, "Album Artist Name")
        XCTAssertEqual(output.albumArtistSort, "Album Artist Sort")
        XCTAssertEqual(output.albumSort, "Album Sort")
        XCTAssertEqual(output.appleStoreCountryID, 12345678)
        XCTAssertEqual(output.id3Tag["AppleStoreCountryID"], "12345678")
        XCTAssertEqual(output.arranger, "Arranger Name")
        XCTAssertEqual(output.involvementCreditsList[.arranger], ["Arranger Name"])
        XCTAssertEqual(output.arrangerKeywords, ["Arranger", "Key", "Words"])
        XCTAssertEqual(output.id3Tag["Arranger Keywords"], "Arranger; Key; Words")
        XCTAssertEqual(output.artDirector, "Art Director Name")
        XCTAssertEqual(output.involvementCreditsList[.artDirection], ["Art Director Name"])
        XCTAssertEqual(output.artist, "Artist Name")
        XCTAssertEqual(output.musicianCreditsList[.artist], ["Artist Name"])
        XCTAssertEqual(output.artistID, 23456789)
        XCTAssertEqual(output.id3Tag["ArtistID"], "23456789")
        XCTAssertEqual(output.artistKeywords, ["Artist", "Key", "Words"])
        XCTAssertEqual(output.id3Tag["Artist Keywords"], "Artist; Key; Words")
        XCTAssertEqual(output.artistSort, "Artist Sort")
        XCTAssertEqual(output.artistWebpage, "ArtistURL.com")
        XCTAssertEqual(output.bpm, 99)
        XCTAssertEqual(output.comments, "Comments")
        XCTAssertEqual(output.compilation, true)
        XCTAssertEqual(output.composer, "Composer Name")
        XCTAssertEqual(output.involvementCreditsList[.composer], ["Composer Name"])
        XCTAssertEqual(output.composerKeywords, ["Composer", "Key", "Words"])
        XCTAssertEqual(output.id3Tag["Composer Keywords"], "Composer; Key; Words")
        XCTAssertEqual(output.composerID, 34567890)
        XCTAssertEqual(output.id3Tag["ComposerID"], "34567890")
        XCTAssertEqual(output.composerSort, "Composer Sort")
        XCTAssertEqual(output.conductor, "Conductor Name")
        XCTAssertEqual(output.conductorID, 45678901)
        XCTAssertEqual(output.id3Tag["ConductorID"], "45678901")
        XCTAssertEqual(output.contentRating.contentRating, .au_Movie_G)
        XCTAssertEqual(output.contentRating.ratingNotes, "Notes")
        XCTAssertEqual(output.id3Tag["iTunEXTC"], "au-movie|G|100|Notes")
        XCTAssertEqual(output.copyright, "\u{00A9}2020 Copyright")
        XCTAssertEqual(output.copyrightWebpage, "CopyrightURL.com")
        XCTAssertNotNil(output.coverArt)
        XCTAssertEqual(output.description, "Description")
        XCTAssertEqual(output.id3Tag[comment: "Description", .und], "Description")
        XCTAssertEqual(output.director, "Director Name")
        XCTAssertEqual(output.involvementCreditsList[.director], ["Director Name"])
        XCTAssertEqual(output.discNumber.disc, 1)
        XCTAssertEqual(output.discNumber.totalDiscs, 2)
        XCTAssertEqual(output.encodedBy, "Encoded By")
        XCTAssertEqual(output.encoderSettings, "Encoding Tool And Settings")
        XCTAssertEqual(output.encodingDateTime, testAllDate)
        XCTAssertEqual(output.executiveProducer, "Exec Producer Name")
        XCTAssertEqual(output.involvementCreditsList[.executiveProducer], ["Exec Producer Name"])
        XCTAssertEqual(output.gaplessPlayback, true)
        XCTAssertEqual(output.genreCustom, "Genre")
        XCTAssertEqual(output.genreID, 183)
        XCTAssertEqual(output.genrePredefined.id3, .Audiobook)
        XCTAssertEqual(output.grouping, "Grouping")
        XCTAssertEqual(output.iTunesAccount, "iTunes Account")
        XCTAssertEqual(output.id3Tag["iTunes Account"], "iTunes Account")
        XCTAssertEqual(output.iTunesAccountType, 1)
        XCTAssertEqual(output.id3Tag["iTunes Account Type"], "1")
        XCTAssertEqual(output.information, "Information")
        XCTAssertEqual(output.id3Tag["Information"], "Information")
        XCTAssertEqual(output.initialKey, .aFlatMajor)
        XCTAssertEqual(output.involvementCreditsList[.accounting], ["Accountant Name"])
        XCTAssertEqual(output.isrc, "987654321098")
        XCTAssertEqual(output.label, "Label")
        XCTAssertEqual(output.id3Tag["Label"], "Label")
        XCTAssertEqual(output.labelWebpage, "LabelURL.com")
        XCTAssertEqual(output.id3Tag[userDefinedUrl: "Label Webpage"], "LabelURL.com")
        XCTAssertEqual(output.language, [.english])
        XCTAssertEqual(output.linerNotes, "Liner Notes")
        XCTAssertEqual(output.id3Tag[comment: "Liner Notes", .und], "Liner Notes")
        XCTAssertEqual(output.longDescription, "Long Description")
        XCTAssertEqual(output.id3Tag[comment: "Long Description", .und], "Long Description")
        XCTAssertEqual(output.lyricist, "Lyricist Name")
        XCTAssertEqual(output.involvementCreditsList[.lyricist], ["Lyricist Name"])
        XCTAssertEqual(output.lyrics, "Lyrics")
        XCTAssertEqual(output.mediaKind, .audiobook)
        XCTAssertEqual(output.id3Tag["Media Kind"], "Audiobook")
        XCTAssertEqual(output.mood, "Mood")
        XCTAssertEqual(output.movement, "Movement")
        XCTAssertEqual(output.movementCount, 4)
        XCTAssertEqual(output.movementNumber, 3)
        XCTAssertEqual(output.musicianCreditsList[.accompaniedBy], ["Accompanist Name"])
        XCTAssertEqual(output.narrator, "Narrator Name")
        XCTAssertEqual(output.musicianCreditsList[.narrator], ["Narrator Name"])
        XCTAssertEqual(output.officialAudioFileWebpage, "AudioFileURL.com")
        XCTAssertEqual(output.officialAudioSourceWebpage, "AudioSourceURL.com")
        XCTAssertEqual(output.originalAlbum, "Original Album")
        XCTAssertEqual(output.originalArtist, "Original Artist Name")
        XCTAssertEqual(output.originalFilename, "Original Filename")
        XCTAssertEqual(output.originalLyricist, "Original Lyricist Name")
        XCTAssertEqual(output.originalReleaseDateTime, testAllDate)
        XCTAssertEqual(output.owner, "Owner Name")
        XCTAssertEqual(output.id3Tag.fileOwner, "Owner Name")
        XCTAssertEqual(output.paymentWebpage, "PaymentURL.com")
        XCTAssertEqual(output.performers, ["Singer Name", "Guitarist Name"])
        XCTAssertEqual(output.musicianCreditsList[.performer], ["Singer Name", "Guitarist Name"])
        XCTAssertEqual(output.playlistDelay, 0)
        XCTAssertEqual(output.playlistID, 56789012)
        XCTAssertEqual(output.id3Tag["PlaylistID"], "56789012")
        XCTAssertNil(output.podcast)
        XCTAssertEqual(output.podcastCategory, "Podcast Category")
        XCTAssertEqual(output.podcastDescription, "Podcast Description")
        XCTAssertEqual(output.podcastFeed, "PodcastFeedUrl.com")
        XCTAssertEqual(output.podcastID, "PodcastID")
        XCTAssertEqual(output.podcastKeywords, ["Podcast", "Key", "Words"])
        XCTAssertEqual(output.publisher, "Publisher Name")
        XCTAssertEqual(output.involvementCreditsList[.publisher], ["Publisher Name"])
        XCTAssertEqual(output.publisherWebpage, "PublisherURL.com")
        XCTAssertEqual(output.purchaseDateTime, testAllDate)
        XCTAssertEqual(output.id3Tag["Purchase Date/Time"], formatter.string(from: testAllDate))
        XCTAssertEqual(output.radioStation, "Radio Station")
        XCTAssertEqual(output.radioStationOwner, "Radio Station Owner")
        XCTAssertEqual(output.radioStationWebpage, "RadioStationURL.com")
        XCTAssertEqual(output.rating, .clean)
        XCTAssertEqual(output.id3Tag["Rating"], "Clean")
        XCTAssertEqual(output.recordCompany, "Record Company")
        XCTAssertEqual(output.id3Tag["Record Company"], "Record Company")
        XCTAssertEqual(output.recordCompanyWebpage, "RecordCompanyURL.com")
        XCTAssertEqual(output.id3Tag[userDefinedUrl: "Record Company Webpage"], "RecordCompanyURL.com")
        XCTAssertEqual(output.recordingCopyright, "\u{2117}2020 Recording Copyright")
        XCTAssertEqual(output.id3Tag.producedNotice, "\u{2117}2020 Recording Copyright")
        XCTAssertEqual(output.recordingDateTime, testAllDate)
        XCTAssertEqual(output.releaseDateTime, testAllDate)
        XCTAssertEqual(output.requirements, "Requirements")
        XCTAssertEqual(output.id3Tag["Requirements"], "Requirements")
        XCTAssertEqual(output.sellerID, "SellerID")
        XCTAssertEqual(output.id3Tag["SellerID"], "SellerID")
        XCTAssertEqual(output.series, "Series")
        XCTAssertEqual(output.id3Tag["series"], "Series")
        XCTAssertEqual(output.seriesDescription, "Series Description")
        XCTAssertEqual(output.id3Tag[comment: "seriesDescription", .und], "Series Description")
        XCTAssertEqual(output.seriesEpisodeNumber, 5)
        XCTAssertEqual(output.id3Tag["seriesEpisodeNumber"], "5")
        XCTAssertEqual(output.seriesEpisodeTitle, "Episode Title")
        XCTAssertEqual(output.id3Tag["seriesEpisodeTitle"], "Episode Title")
        XCTAssertEqual(output.seriesNetworkOrChannel, "Network")
        XCTAssertEqual(output.id3Tag["seriesNetworkOrChannel"], "Network")
        XCTAssertEqual(output.seriesSeason, 6)
        XCTAssertEqual(output.id3Tag["seriesSeason"], "6")
        XCTAssertEqual(output.seriesSort, "Series Sort")
        XCTAssertEqual(output.id3Tag["seriesSort"], "Series Sort")
        XCTAssertEqual(output.showWorkAndMovement, true)
        XCTAssertEqual(output.id3Tag["Show Work and Movement"], "1")
        XCTAssertEqual(output.softwareVersion, "Software Version")
        XCTAssertEqual(output.id3Tag["Software Version"], "Software Version")
        XCTAssertEqual(output.soloist, "Soloist Name")
        XCTAssertEqual(output.musicianCreditsList[.soloist], ["Soloist Name"])
        XCTAssertEqual(output.songDescription, "Song Description")
        XCTAssertEqual(output.id3Tag[comment: "Song Description", .und], "Song Description")
        XCTAssertEqual(output.songwriter, "Songwriter Name")
        XCTAssertEqual(output.involvementCreditsList[.songwriter], ["Songwriter Name"])
        XCTAssertEqual(output.songwriterKeywords, ["Songwriter", "Key", "Words"])
        XCTAssertEqual(output.id3Tag["Songwriter Keywords"], "Songwriter; Key; Words")
        XCTAssertEqual(output.soundEngineer, "Sound Engineer Name")
        XCTAssertEqual(output.involvementCreditsList[.soundEngineer], ["Sound Engineer Name"])
        XCTAssertEqual(output.sourceCredit, "Source Credit")
        XCTAssertEqual(output.id3Tag["Source Credit"], "Source Credit")
        XCTAssertEqual(output.subtitle, "Subtitle")
        XCTAssertEqual(output.subtitleKeywords, ["Subtitle", "Key", "Words"])
        XCTAssertEqual(output.id3Tag["Subtitle Keywords"], "Subtitle; Key; Words")
        XCTAssertEqual(output.taggingDateTime, testAllDate)
        XCTAssertEqual(output.thanks, "Thanks")
        XCTAssertEqual(output.id3Tag["Thanks"], "Thanks")
        XCTAssertEqual(output.title, "Title")
        XCTAssertEqual(output.titleKeywords, ["Title", "Key", "Words"])
        XCTAssertEqual(output.id3Tag["Title Keywords"], "Title; Key; Words")
        XCTAssertEqual(output.titleSort, "Title Sort")
        XCTAssertEqual(output.trackNumber.track, 7)
        XCTAssertEqual(output.trackNumber.totalTracks, 8)
        XCTAssertEqual(output.trackOrSetSubtitle, "Track/Set Subtitle")
        XCTAssertEqual(output.id3Tag.setSubtitle, "Track/Set Subtitle")
        XCTAssertEqual(output.work, "Work")
        XCTAssertEqual(output.id3Tag.contentGroup, "Work")
        XCTAssertEqual(output.writer, "Writer Name")
        XCTAssertEqual(output.involvementCreditsList[.writer], ["Writer Name"])
        XCTAssertEqual(output.year, components.year)
        
        let chapter1 = output.chapterList[0]
        XCTAssertEqual(chapter1.startTime, 0)
        XCTAssertEqual(chapter1.title, "Chapter 01")
        let chapter2 = output.chapterList[1]
        XCTAssertEqual(chapter2.startTime, 700)
        XCTAssertEqual(chapter2.title, "Chapter 02")
        let chapter3 = output.chapterList[2]
        XCTAssertEqual(chapter3.startTime, 1670)
        XCTAssertEqual(chapter3.title, "Chapter 03")
        let chapter4 = output.chapterList[3]
        XCTAssertEqual(chapter4.startTime, 3165)
        XCTAssertEqual(chapter4.title, "Chapter 04")
        let chapter5 = output.chapterList[4]
        XCTAssertEqual(chapter5.startTime, 3976)
        XCTAssertEqual(chapter5.title, "Chapter 05")
    }
}
