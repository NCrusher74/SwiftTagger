//
//  TestMedia.swift
//  SwiftTagger
//
//  Created by Nolaine Crusher on 9/29/20.
//

import Foundation
@testable import SwiftTagger

let testMediaDirectory = URL(fileURLWithPath: #file)
    .deletingLastPathComponent()
    .appendingPathComponent("TestMedia")

public let sampleMp3 = testMediaDirectory
    .appendingPathComponent("sampleMp3")
    .appendingPathExtension("mp3")

public let sampleMp4 = testMediaDirectory
    .appendingPathComponent("sampleMp4")
    .appendingPathExtension("m4a")

public let sampleMp3NoMeta = testMediaDirectory
    .appendingPathComponent("mp3-nometa")
    .appendingPathExtension("mp3")

public let sampleMp4NoMeta = testMediaDirectory
    .appendingPathComponent("mp4-nometa")
    .appendingPathExtension("m4a")

public let sampleCover = testMediaDirectory
    .appendingPathComponent("samplecover-green")
    .appendingPathExtension("jpg")

func tempOutputDirectory(fileExtension: FileType) -> URL {
    let tempDirectory = FileManager.default.temporaryDirectory
        .appendingPathComponent("SwiftTaggerTemp", isDirectory: true)
    let ext = fileExtension.rawValue
    do {
        try FileManager.default.createDirectory(
            at: tempDirectory,
            withIntermediateDirectories: true)
        return tempDirectory.appendingPathComponent("test").appendingPathExtension(ext)
    } catch {
        fatalError("Unable to create temporary directory")
    }
}

/// Creates the test file on the desktop in the directory `TestOutput`
func localOutputDirectory(fileName: String, fileExtension: FileType) throws -> URL {
    let home = FileManager.default.homeDirectoryForCurrentUser
    let desktopPath = "Desktop/TestOutput"
    let directory = home.appendingPathComponent(
        desktopPath, isDirectory: true)
    let ext = fileExtension.rawValue
    return directory.appendingPathComponent(fileName).appendingPathExtension(ext)
}

enum FileType: String {
    case mp3
    case m4a
    case m4b
}

let testAllDate: Date = {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = .withInternetDateTime
    formatter.timeZone = TimeZone(secondsFromGMT: 0) ?? .current
    
    guard let date = formatter.date(from: "2002-11-07T09:23:00Z") else {
        fatalError()
    }
    return date
}()

let formatter: ISO8601DateFormatter = {
    let formatter = ISO8601DateFormatter()
    formatter.timeZone = TimeZone(secondsFromGMT: 0) ?? .current
    formatter.formatOptions = .withInternetDateTime
    return formatter
}()

let components: DateComponents = {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = .withInternetDateTime
    formatter.timeZone = TimeZone(secondsFromGMT: 0) ?? .current
    
    guard let date = formatter.date(from: "2002-11-07T09:23:00Z") else {
        fatalError()
    }
    let calendar = Calendar(identifier: .iso8601)
    let timeZone = TimeZone(secondsFromGMT: 0) ?? .current
    let components = calendar.dateComponents(in: timeZone, from: date)
    return components
}()

func testSettings(_ file: inout AudioFile) throws -> AudioFile {
//    let chapters: [(startTime: Int, title: String)] = [
//        (0, "Chapter 01"),
//        (700, "Chapter 02"),
//        (1670, "Chapter 03"),
//        (3165, "Chapter 04"),
//        (3976, "Chapter 05")
//    ]
//
//    for chapter in chapters {
//        file.addChapter(startTime: chapter.startTime, title: chapter.title)
//    }
    
    file.addChapter(startTime: 0, title: "Chapter 01")
    file.addChapter(startTime: 700, title: "Chapter 02")
    file.addChapter(startTime: 1670, title: "Chapter 03")
    file.addChapter(startTime: 3165, title: "Chapter 04")
    file.addChapter(startTime: 3976, title: "Chapter 05")
    
    file.acknowledgment = "Acknowledgment"
    file.album = "Album"
    file.albumArtist = "Album Artist Name"
    file.albumArtistSort = "Album Artist Sort"
    file.albumSort = "Album Sort"
    file.appleStoreCountryID = 12345678
    file.arranger = "Arranger Name"
    file.arrangerKeywords = ["Arranger", "Key", "Words"]
    file.artDirector = "Art Director Name"
    file.artist = "Artist Name"
    file.artistID = 23456789
    file.artistKeywords = ["Artist", "Key", "Words"]
    file.artistSort = "Artist Sort"
    file.artistWebpage = "ArtistURL.com"
    file.bpm = 99
    file.comments = "Comments"
    file.compilation = true
    file.composer = "Composer Name"
    file.composerKeywords = ["Composer", "Key", "Words"]
    file.composerID = 34567890
    file.composerSort = "Composer Sort"
    file.conductor = "Conductor Name"
    file.conductorID = 45678901
    file.contentRating.contentRating = .au_Movie_G
    file.contentRating.ratingNotes = "Notes"
    file.copyright = "2020 Copyright"
    file.copyrightWebpage = "CopyrightURL.com"
    try file.setCoverArt(imageLocation: sampleCover)
    file.description = "Description"
    file.director = "Director Name"
    file.discNumber.disc = 1
    file.discNumber.totalDiscs = 2
    file.encodedBy = "Encoded By"
    file.encoderSettings = "Encoding Tool And Settings"
    file.encodingDateTime = testAllDate
    file.executiveProducer = "Exec Producer Name"
    file.gaplessPlayback = true
    file.genreCustom = "Genre"
    file.genrePredefined.mp4 = .audiobooks
    file.genrePredefined.id3 = .Audiobook
    file.grouping = "Grouping"
    file.iTunesAccount = "iTunes Account"
    file.iTunesAccountType = 1
    file.information = "Information"
    file.initialKey = .aFlatMajor
    file.involvementCreditsList[.accounting] = ["Accountant Name"]
    file.isrc = "987654321098"
    file.label = "Label"
    file.labelWebpage = "LabelURL.com"
    file.language.mp4 = [.englishWorld]
    file.language.id3 = [.eng]
    file.linerNotes = "Liner Notes"
    file.longDescription = "Long Description"
    file.lyricist = "Lyricist Name"
    file.lyrics = "Lyrics"
    file.mediaKind = .audiobook
    file.mood = "Mood"
    file.movement = "Movement"
    file.movementCount = 4
    file.movementNumber = 3
    file.musicianCreditsList[.accompaniedBy] = ["Accompanist Name"]
    file.narrator = "Narrator Name"
    file.officialAudioFileWebpage = "AudioFileURL.com"
    file.officialAudioSourceWebpage = "AudioSourceURL.com"
    file.originalAlbum = "Original Album"
    file.originalArtist = "Original Artist Name"
    file.originalFilename = "Original Filename"
    file.originalLyricist = "Original Lyricist Name"
    file.originalReleaseDateTime = testAllDate
    file.owner = "Owner Name"
    file.paymentWebpage = "PaymentURL.com"
    file.performers = ["Singer Name", "Guitarist Name"]
    file.playlistID = 56789012
    file.podcast = true
    file.podcastCategory = "Podcast Category"
    file.podcastDescription = "Podcast Description"
    file.podcastFeed = "PodcastFeedUrl.com"
    file.podcastID = "PodcastID"
    file.podcastKeywords = ["Podcast", "Key", "Words"]
    file.publisher = "Publisher Name"
    file.publisherWebpage = "PublisherURL.com"
    file.purchaseDateTime = testAllDate
    file.radioStation = "Radio Station"
    file.radioStationOwner = "Radio Station Owner"
    file.radioStationWebpage = "RadioStationURL.com"
    file.rating = .clean
    file.recordCompany = "Record Company"
    file.recordCompanyWebpage = "RecordCompanyURL.com"
    file.recordingCopyright = "2020 Recording Copyright"
    file.recordingDateTime = testAllDate
    file.releaseDateTime = testAllDate
    file.requirements = "Requirements"
    file.sellerID = "SellerID"
    file.series = "Series"
    file.seriesDescription = "Series Description"
    file.seriesEpisodeNumber = 5
    file.seriesEpisodeTitle = "Episode Title"
    file.seriesNetworkOrChannel = "Network"
    file.seriesSeason = 6
    file.seriesSort = "Series Sort"
    file.showWorkAndMovement = true
    file.softwareVersion = "Software Version"
    file.soloist = "Soloist Name"
    file.songDescription = "Song Description"
    file.songwriter = "Songwriter Name"
    file.songwriterKeywords = ["Songwriter", "Key", "Words"]
    file.soundEngineer = "Sound Engineer Name"
    file.sourceCredit = "Source Credit"
    file.subtitle = "Subtitle"
    file.subtitleKeywords = ["Subtitle", "Key", "Words"]
    file.taggingDateTime = testAllDate
    file.thanks = "Thanks"
    file.title = "Title"
    file.titleKeywords = ["Title", "Key", "Words"]
    file.titleSort = "Title Sort"
    file.trackNumber.track = 7
    file.trackNumber.totalTracks = 8
    file.trackOrSetSubtitle = "Track/Set Subtitle"
    file.work = "Work"
    file.writer = "Writer Name"
    return file
}
