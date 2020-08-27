import XCTest
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests_AllMetadata: XCTestCase {

    func testMp4All() throws {
        var source = try AudioFile(location: mp4NoMeta)

        var components = DateComponents()
        var calendar = Calendar(identifier: .iso8601)
        calendar.timeZone = TimeZone(secondsFromGMT: 0) ?? .current
        components.year = 1995
        components.month = 06
        components.day = 17
        let date = calendar.date(from: components)

        try source.setCoverArt(from: sampleCover)
        source.acknowledgment = "Acknowledgement"
        source.addInvolvementCredit(.accounting, person: "Accountant")
        source.addPerformanceCredit(.accompaniment, person: "Accompanist")
        source.addPerformanceCredit(.additional, person: "Additional")
        source.album = "Album"
        source.albumArtist = "Album Artist"
        source.albumArtistSort = "Album Artist Sort"
        source.albumID = 12345678
        source.albumSort = "Album Sort"
        source.appleStoreCountryID = 23456789
        source.arranger = "Arranger"
        source.arrangerKeywords = ["Arranger", "Keywords"]
        source.artDirector = "Art Director"
        source.artist = "Artist"
        source.artistID = 34567890
        source.artistKeywords = ["Artist", "Keywords"]
        source.artistSort = "Artist Sort"
        source.artistWebpage = "Artist Webpage"
        source.audioFileWebpage = "Audio File Webpage"
        source.audioSourceWebpage = "Audio Source Webpage"
        source.bpm = 99
        source.comment = "Comment"
        source.compilation = true
        source.composer = "Composer"
        source.composerID = 45678901
        source.composerKeywords = ["Composer", "Keywords"]
        source.composerSort = "Composer Sort"
        source.conductor = "Conductor"
        source.conductorID = 56789012
        source.contentAdvisory.rating = .au_Movie_G
        source.contentAdvisory.ratingNotes = "Rating Notation"
        source.contentRating = .explicit
        source.contentType = .audiobook
        source.copyright = "Copyright"
        source.copyrightWebpage = "Copyright Webpage"
        source.description = "Description"
        source.director = "Director"
        source.discNumber.disc = 2
        source.discNumber.totalDiscs = 3
        source.encodedBy = "Encoded By"
        source.encodingDate = date
        source.encodingSettings = "Encoding Settings"
        source.encodingTool = "Encoding Tool"
        source.executiveProducer = "Executive Producer"
        source.filmMakerWebpage = "FilmMaker Webpage"
        source.gaplessPlayback = true
        source.genre = "Genre"
        source.genreID.mp4Genre = .audiobooks
        source.grouping = "Grouping"
        source.information = "Information"
        source.isrc = "123456789012"
        source.keySignature = .bFlatMajor
        source.label = "Label"
        source.language.mp4Language = .English
        source.length = 9999
        source.linerNotes = "Liner Notes"
        source.longDescription = "Long Description"
        source.lyricist = "Lyricist"
        source.lyrics = "Lyrics"
        source.mood = "Mood"
        source.movement = "Movement"
        source.movementCount = 5
        source.movementNumber = 4
        source.narrator = "Narrator"
        source.originalAlbum = "Original Album"
        source.originalArtist = "Original Artist"
        source.originalFilename = "Original Filename"
        source.originalLyricist = "Original Lyricist"
        source.originalReleaseDate = date
        source.owner = "Owner"
        source.paymentWebpage = "Payment Webpage"
        source.playlistDelay = 0
        source.playlistID = 67890123
        source.podcast = true
        source.podcastCategory = "Podcast Category"
        source.podcastDescription = "Podcast Description"
        source.podcastFeed = "Podcast Feed"
        source.podcastID = "Podcast ID"
        source.podcastKeywords = ["Podcast", "Keywords"]
        source.predefinedGenre.mp4Genre = .audiobooks
        source.producedNotice = "Produced Notice"
        source.producer = "Producer"
        source.producerKeywords = ["Producer", "Keywords"]
        source.publisher = "Publisher"
        source.publisherWebpage = "Publisher Webpage"
        source.purchaseDate = date
        source.radioStation = "Radio Station"
        source.radioStationOwner = "Radio Station Owner"
        source.radioStationWebpage = "Radio Station Webpage"
        source.recordCompany = "Record Company"
        source.recordingCopyright = "Recording Copyright"
        source.recordingDate = date
        source.releaseDate = date
        source.requirements = "Requirements"
        source.sellerID = "Seller ID"
        source.showWork = true
        source.softwareVersion = "Software Version"
        source.soloist = "Soloist"
        source.songDescription = "Song Description"
        source.songwriter = "Songwriter"
        source.songwriterKeywords = ["Songwriter", "Keywords"]
        source.soundEngineer = "Sound Engineer"
        source.sourceCredit = "Source Credit"
        source.subtitle = "Subtitle"
        source.subtitleKeywords = ["Subtitle", "Keywords"]
        source.taggingDate = date
        source.thanks = "Thanks"
        source.title = "Title"
        source.titleKeywords = ["Title", "Keywords"]
        source.titleSort = "Title Sort"
        source.trackNumber.track = 7
        source.trackNumber.totalTracks = 8
        source.trackSubtitle = "Track Subtitle"
        source.tvEpisodeNumber = 9
        source.tvEpisodeTitle = "TV Episode Title"
        source.tvSeason = 1
        source.tvNetwork = "TV Network"
        source.tvShow = "TV Show"
        source.tvShowDescription = "TV Show Description"
        source.tvShowSort = "TV Show Sort"
        source.website = "Website"
        source.work = "Work"
        source.writer = "Writer"
        source.year = 1992
        
        let outputUrl = try localDirectory(fileName: "testMp4-All", fileExtension: "m4a")
        try source.write(outputLocation: outputUrl)
        let output = try AudioFile(location: outputUrl)
        
        XCTAssertNotNil(output.getCoverArt)
        XCTAssertEqual(output.acknowledgment, "Acknowledgement")
        XCTAssertEqual(output["Accounting"], "Accountant")
        XCTAssertEqual(output.performers, ["Accompanist", "Additional"])
        XCTAssertEqual(output.album, "Album")
        XCTAssertEqual(output.albumArtist, "Album Artist")
        XCTAssertEqual(output.albumArtistSort, "Album Artist Sort")
        XCTAssertEqual(output.albumID, 12345678)
        XCTAssertEqual(output.albumSort, "Album Sort")
        XCTAssertEqual(output.appleStoreCountryID, 23456789)
        XCTAssertEqual(output.arranger, "Arranger")
        XCTAssertEqual(output.arrangerKeywords, ["Arranger", "Keywords"])
        XCTAssertEqual(output.artDirector, "Art Director")
        XCTAssertEqual(output.artist, "Artist")
        XCTAssertEqual(output.artistID, 34567890)
        XCTAssertEqual(output.artistKeywords, ["Artist", "Keywords"])
        XCTAssertEqual(output.artistSort, "Artist Sort")
        XCTAssertEqual(output.artistWebpage, "Artist Webpage")
        XCTAssertEqual(output.audioFileWebpage, "Audio File Webpage")
        XCTAssertEqual(output.audioSourceWebpage, "Audio Source Webpage")
        XCTAssertEqual(output.bpm, 99)
        XCTAssertEqual(output.comment, "Comment")
        XCTAssertEqual(output.compilation, true)
        XCTAssertEqual(output.composer, "Composer")
        XCTAssertEqual(output.composerID, 45678901)
        XCTAssertEqual(output.composerKeywords, ["Composer", "Keywords"])
        XCTAssertEqual(output.composerSort, "Composer Sort")
        XCTAssertEqual(output.conductor, "Conductor")
        XCTAssertEqual(output.conductorID, 56789012)
        XCTAssertEqual(output.contentAdvisory.rating, .au_Movie_G)
        XCTAssertEqual(output.contentAdvisory.ratingNotes, "Rating Notation")
        XCTAssertEqual(output.contentRating, .explicit)
        XCTAssertEqual(output.contentType, .audiobook)
        XCTAssertEqual(output.copyright, "Copyright")
        XCTAssertEqual(output.copyrightWebpage, "Copyright Webpage")
        XCTAssertEqual(output.description, "Description")
        XCTAssertEqual(output.director, "Director")
        XCTAssertEqual(output.discNumber.disc, 2)
        XCTAssertEqual(output.discNumber.totalDiscs, 3)
        XCTAssertEqual(output.encodedBy, "Encoded By")
        XCTAssertEqual(output.encodingDate, date)
        XCTAssertEqual(output.encodingSettings, "Encoding Settings")
        XCTAssertEqual(output.encodingTool, "Encoding Tool")
        XCTAssertEqual(output.executiveProducer, "Executive Producer")
        XCTAssertEqual(output.filmMakerWebpage, "FilmMaker Webpage")
        XCTAssertEqual(output.gaplessPlayback, true)
        XCTAssertEqual(output.genre, "Genre")
        XCTAssertEqual(output.genreID.mp4Genre, .audiobooks)
        XCTAssertEqual(output.grouping, "Grouping")
        XCTAssertEqual(output.information, "Information")
        XCTAssertEqual(output.isrc, "123456789012")
        XCTAssertEqual(output.keySignature, .bFlatMajor)
        XCTAssertEqual(output.label, "Label")
        XCTAssertEqual(output.language.mp4Language, .English)
        XCTAssertEqual(output.length, 5016)
        XCTAssertEqual(output.linerNotes, "Liner Notes")
        XCTAssertEqual(output.longDescription, "Long Description")
        XCTAssertEqual(output.lyricist, "Lyricist")
        XCTAssertEqual(output.lyrics, "Lyrics")
        XCTAssertEqual(output.mood, "Mood")
        XCTAssertEqual(output.movement, "Movement")
        XCTAssertEqual(output.movementCount, 5)
        XCTAssertEqual(output.movementNumber, 4)
        XCTAssertEqual(output.narrator, "Narrator")
        XCTAssertEqual(output.originalAlbum, "Original Album")
        XCTAssertEqual(output.originalArtist, "Original Artist")
        XCTAssertEqual(output.originalFilename, "Original Filename")
        XCTAssertEqual(output.originalLyricist, "Original Lyricist")
        XCTAssertEqual(output.originalReleaseDate, date)
        XCTAssertEqual(output.owner, "Owner")
        XCTAssertEqual(output.paymentWebpage, "Payment Webpage")
        XCTAssertEqual(output.playlistID, 67890123)
        XCTAssertNil(output.playlistDelay)
        XCTAssertEqual(output.podcast, true)
        XCTAssertEqual(output.podcastCategory, "Podcast Category")
        XCTAssertEqual(output.podcastDescription, "Podcast Description")
        XCTAssertEqual(output.podcastFeed, "Podcast Feed")
        XCTAssertEqual(output.podcastID, "Podcast ID")
        XCTAssertEqual(output.podcastKeywords, ["Podcast", "Keywords"])
        XCTAssertEqual(output.predefinedGenre.mp4Genre, .audiobooks)
        XCTAssertEqual(output.producedNotice, "Produced Notice")
        XCTAssertEqual(output.producer, "Producer")
        XCTAssertEqual(output.producerKeywords, ["Producer", "Keywords"])
        XCTAssertEqual(output.publisher, "Publisher")
        XCTAssertEqual(output.publisherWebpage, "Publisher Webpage")
        XCTAssertEqual(output.purchaseDate, date)
        XCTAssertEqual(output.radioStation, "Radio Station")
        XCTAssertEqual(output.radioStationOwner, "Radio Station Owner")
        XCTAssertEqual(output.radioStationWebpage, "Radio Station Webpage")
        XCTAssertEqual(output.recordCompany, "Record Company")
        XCTAssertEqual(output.recordingCopyright, "Recording Copyright")
        XCTAssertEqual(output.recordingDate, date)
        XCTAssertEqual(output.releaseDate, date)
        XCTAssertEqual(output.requirements, "Requirements")
        XCTAssertEqual(output.sellerID, "Seller ID")
        XCTAssertEqual(output.showWork, true)
        XCTAssertEqual(output.softwareVersion, "Software Version")
        XCTAssertEqual(output.soloist, "Soloist")
        XCTAssertEqual(output.songDescription, "Song Description")
        XCTAssertEqual(output.songwriter, "Songwriter")
        XCTAssertEqual(output.songwriterKeywords, ["Songwriter", "Keywords"])
        XCTAssertEqual(output.soundEngineer, "Sound Engineer")
        XCTAssertEqual(output.sourceCredit, "Source Credit")
        XCTAssertEqual(output.subtitle, "Subtitle")
        XCTAssertEqual(output.subtitleKeywords, ["Subtitle", "Keywords"])
        XCTAssertEqual(output.taggingDate, date)
        XCTAssertEqual(output.thanks, "Thanks")
        XCTAssertEqual(output.title, "Title")
        XCTAssertEqual(output.titleKeywords, ["Title", "Keywords"])
        XCTAssertEqual(output.titleSort, "Title Sort")
        XCTAssertEqual(output.trackNumber.track, 7)
        XCTAssertEqual(output.trackNumber.totalTracks, 8)
        XCTAssertEqual(output.trackSubtitle, "Track Subtitle")
        XCTAssertEqual(output.tvEpisodeNumber, 9)
        XCTAssertEqual(output.tvEpisodeTitle, "TV Episode Title")
        XCTAssertEqual(output.tvSeason, 1)
        XCTAssertEqual(output.tvNetwork, "TV Network")
        XCTAssertEqual(output.tvShow, "TV Show")
        XCTAssertEqual(output.tvShowDescription, "TV Show Description")
        XCTAssertEqual(output.tvShowSort, "TV Show Sort")
        XCTAssertEqual(output.website, "Website")
        XCTAssertEqual(output.work, "Work")
        XCTAssertEqual(output.writer, "Writer")
        XCTAssertEqual(output.year, 1992)
    }
    
    func testMp3All() throws {
        var source = try AudioFile(location: mp3NoMeta)
        
        var components = DateComponents()
        var calendar = Calendar(identifier: .iso8601)
        calendar.timeZone = TimeZone(secondsFromGMT: 0) ?? .current
        components.year = 1995
        components.month = 06
        components.day = 17
        let date = calendar.date(from: components)
        
        try source.setCoverArt(from: sampleCover)
        source.acknowledgment = "Acknowledgement"
        source.addInvolvementCredit(.accounting, person: "Accountant")
        source.addPerformanceCredit(.accompaniment, person: "Accompanist")
        source.addPerformanceCredit(.additional, person: "Additional")
        source.album = "Album"
        source.albumArtist = "Album Artist"
        source.albumArtistSort = "Album Artist Sort"
        source.albumID = 12345678
        source.albumSort = "Album Sort"
        source.appleStoreCountryID = 23456789
        source.arranger = "Arranger"
        source.arrangerKeywords = ["Arranger", "Keywords"]
        source.artDirector = "Art Director"
        source.artist = "Artist"
        source.artistID = 34567890
        source.artistKeywords = ["Artist", "Keywords"]
        source.artistSort = "Artist Sort"
        source.artistWebpage = "Artist Webpage"
        source.audioFileWebpage = "Audio File Webpage"
        source.audioSourceWebpage = "Audio Source Webpage"
        source.bpm = 99
        source.comment = "Comment"
        source.compilation = true
        source.composer = "Composer"
        source.composerID = 45678901
        source.composerKeywords = ["Composer", "Keywords"]
        source.composerSort = "Composer Sort"
        source.conductor = "Conductor"
        source.conductorID = 56789012
        source.contentAdvisory.rating = .au_Movie_G
        source.contentAdvisory.ratingNotes = "Rating Notation"
        source.contentRating = .explicit
        source.contentType = .audiobook
        source.copyright = "Copyright"
        source.copyrightWebpage = "Copyright Webpage"
        source.description = "Description"
        source.director = "Director"
        source.discNumber.disc = 2
        source.discNumber.totalDiscs = 3
        source.encodedBy = "Encoded By"
        source.encodingDate = date
        source.encodingSettings = "Encoding Settings"
        source.encodingTool = "Encoding Tool"
        source.executiveProducer = "Executive Producer"
        source.filmMakerWebpage = "FilmMaker Webpage"
        source.gaplessPlayback = true
        source.genre = "Genre"
        source.genreID.id3Genre = .Audiobook
        source.grouping = "Grouping"
        source.information = "Information"
        source.isrc = "123456789012"
        source.keySignature = .bFlatMajor
        source.language.id3Languages = [.eng, .und]
        source.length = 9999
        source.linerNotes = "Liner Notes"
        source.longDescription = "Long Description"
        source.lyricist = "Lyricist"
        source.lyrics = "Lyrics"
        source.mood = "Mood"
        source.movement = "Movement"
        source.movementCount = 5
        source.movementNumber = 4
        source.originalAlbum = "Original Album"
        source.originalArtist = "Original Artist"
        source.originalFilename = "Original Filename"
        source.originalLyricist = "Original Lyricist"
        source.originalReleaseDate = date
        source.owner = "Owner"
        source.paymentWebpage = "Payment Webpage"
        source.playlistDelay = 0
        source.playlistID = 67890123
        source.podcastCategory = "Podcast Category"
        source.podcastDescription = "Podcast Description"
        source.podcastFeed = "Podcast Feed"
        source.podcastID = "Podcast ID"
        source.podcastKeywords = ["Podcast", "Keywords"]
        source.predefinedGenre.id3Genre = .Audiobook
        source.producedNotice = "Produced Notice"
        source.producer = "Producer"
        source.producerKeywords = ["Producer", "Keywords"]
        source.publisher = "Publisher"
        source.publisherWebpage = "Publisher Webpage"
        source.purchaseDate = date
        source.radioStation = "Radio Station"
        source.radioStationOwner = "Radio Station Owner"
        source.radioStationWebpage = "Radio Station Webpage"
        source.recordingCopyright = "Recording Copyright"
        source.recordingDate = date
        source.releaseDate = date
        source.requirements = "Requirements"
        source.sellerID = "Seller ID"
        source.showWork = true
        source.softwareVersion = "Software Version"
        source.soloist = "Soloist"
        source.songDescription = "Song Description"
        source.songwriter = "Songwriter"
        source.songwriterKeywords = ["Songwriter", "Keywords"]
        source.soundEngineer = "Sound Engineer"
        source.sourceCredit = "Source Credit"
        source.subtitle = "Subtitle"
        source.subtitleKeywords = ["Subtitle", "Keywords"]
        source.taggingDate = date
        source.thanks = "Thanks"
        source.title = "Title"
        source.titleKeywords = ["Title", "Keywords"]
        source.titleSort = "Title Sort"
        source.trackNumber.track = 7
        source.trackNumber.totalTracks = 8
        source.trackSubtitle = "Track Subtitle"
        source.tvEpisodeNumber = 9
        source.tvEpisodeTitle = "TV Episode Title"
        source.tvSeason = 1
        source.tvNetwork = "TV Network"
        source.tvShow = "TV Show"
        source.tvShowDescription = "TV Show Description"
        source.tvShowSort = "TV Show Sort"
        source.website = "Website"
        source.work = "Work"
        source.writer = "Writer"
        
        let outputUrl = try localDirectory(fileName: "testMp3-All", fileExtension: "mp3")
        try source.write(outputLocation: outputUrl)
        let output = try AudioFile(location: outputUrl)
        
        XCTAssertNotNil(output.getCoverArt)
        XCTAssertEqual(output.acknowledgment, "Acknowledgement")
        XCTAssertEqual(output.involvementCreditsList[.accounting], ["Accountant"])
        XCTAssertEqual(output.performanceCreditsList[.additional], ["Additional"])
        XCTAssertEqual(output.performanceCreditsList[.accompaniment], ["Accompanist"])
        XCTAssertEqual(output.album, "Album")
        XCTAssertEqual(output.albumArtist, "Album Artist")
        XCTAssertEqual(output.albumArtistSort, "Album Artist Sort")
        XCTAssertEqual(output.albumID, 12345678)
        XCTAssertEqual(output.albumSort, "Album Sort")
        XCTAssertEqual(output.appleStoreCountryID, 23456789)
        XCTAssertEqual(output.arranger, "Arranger")
        XCTAssertEqual(output.arrangerKeywords, ["Arranger", "Keywords"])
        XCTAssertEqual(output.artDirector, "Art Director")
        XCTAssertEqual(output.artist, "Artist")
        XCTAssertEqual(output.artistID, 34567890)
        XCTAssertEqual(output.artistKeywords, ["Artist", "Keywords"])
        XCTAssertEqual(output.artistSort, "Artist Sort")
        XCTAssertEqual(output.artistWebpage, "Artist Webpage")
        XCTAssertEqual(output.audioFileWebpage, "Audio File Webpage")
        XCTAssertEqual(output.audioSourceWebpage, "Audio Source Webpage")
        XCTAssertEqual(output.bpm, 99)
        XCTAssertEqual(output.comment, "Comment")
        XCTAssertEqual(output.compilation, true)
        XCTAssertEqual(output.composer, "Composer")
        XCTAssertEqual(output.composerID, 45678901)
        XCTAssertEqual(output.composerKeywords, ["Composer", "Keywords"])
        XCTAssertEqual(output.composerSort, "Composer Sort")
        XCTAssertEqual(output.conductor, "Conductor")
        XCTAssertEqual(output.conductorID, 56789012)
        XCTAssertEqual(output.contentAdvisory.rating, .au_Movie_G)
        XCTAssertEqual(output.contentAdvisory.ratingNotes, "Rating Notation")
        XCTAssertEqual(output.contentRating, .explicit)
        XCTAssertEqual(output.contentType, .audiobook)
        XCTAssertEqual(output.copyright, "Copyright")
        XCTAssertEqual(output.copyrightWebpage, "Copyright Webpage")
        XCTAssertEqual(output.description, "Description")
        XCTAssertEqual(output.director, "Director")
        XCTAssertEqual(output.discNumber.disc, 2)
        XCTAssertEqual(output.discNumber.totalDiscs, 3)
        XCTAssertEqual(output.encodedBy, "Encoded By")
        XCTAssertEqual(output.encodingDate, date)
        XCTAssertEqual(output.encodingSettings, "Encoding Settings")
        XCTAssertEqual(output.encodingTool, "Encoding Tool")
        XCTAssertEqual(output.executiveProducer, "Executive Producer")
        XCTAssertEqual(output.filmMakerWebpage, "FilmMaker Webpage")
        XCTAssertEqual(output.gaplessPlayback, true)
        XCTAssertEqual(output.genre, "Genre")
        XCTAssertEqual(output.genreID.id3Genre, .Audiobook)
        XCTAssertEqual(output.grouping, "Grouping")
        XCTAssertEqual(output.information, "Information")
        XCTAssertEqual(output.isrc, "123456789012")
        XCTAssertEqual(output.keySignature, .bFlatMajor)
        XCTAssertEqual(output.language.id3Languages, [.eng, .und])
        XCTAssertEqual(output.length, 5041)
        XCTAssertEqual(output.linerNotes, "Liner Notes")
        XCTAssertEqual(output.longDescription, "Long Description")
        XCTAssertEqual(output.lyricist, "Lyricist")
        XCTAssertEqual(output.lyrics, "Lyrics")
        XCTAssertEqual(output.mood, "Mood")
        XCTAssertEqual(output.movement, "Movement")
        XCTAssertEqual(output.movementCount, 5)
        XCTAssertEqual(output.movementNumber, 4)
        XCTAssertEqual(output.originalAlbum, "Original Album")
        XCTAssertEqual(output.originalArtist, "Original Artist")
        XCTAssertEqual(output.originalFilename, "Original Filename")
        XCTAssertEqual(output.originalLyricist, "Original Lyricist")
        XCTAssertEqual(output.originalReleaseDate, date)
        XCTAssertEqual(output.owner, "Owner")
        XCTAssertEqual(output.paymentWebpage, "Payment Webpage")
        XCTAssertEqual(output.playlistID, 67890123)
        XCTAssertEqual(output.playlistDelay, 0)
        XCTAssertEqual(output.podcastCategory, "Podcast Category")
        XCTAssertEqual(output.podcastDescription, "Podcast Description")
        XCTAssertEqual(output.podcastFeed, "Podcast Feed")
        XCTAssertEqual(output.podcastID, "Podcast ID")
        XCTAssertEqual(output.podcastKeywords, ["Podcast", "Keywords"])
        XCTAssertEqual(output.predefinedGenre.id3Genre, .Audiobook)
        XCTAssertEqual(output.producedNotice, "Produced Notice")
        XCTAssertEqual(output.producer, "Producer")
        XCTAssertEqual(output.producerKeywords, ["Producer", "Keywords"])
        XCTAssertEqual(output.publisher, "Publisher")
        XCTAssertEqual(output.publisherWebpage, "Publisher Webpage")
        XCTAssertEqual(output.purchaseDate, date)
        XCTAssertEqual(output.radioStation, "Radio Station")
        XCTAssertEqual(output.radioStationOwner, "Radio Station Owner")
        XCTAssertEqual(output.radioStationWebpage, "Radio Station Webpage")
        XCTAssertEqual(output.recordingCopyright, "Recording Copyright")
        XCTAssertEqual(output.recordingDate, date)
        XCTAssertEqual(output.releaseDate, date)
        XCTAssertEqual(output.requirements, "Requirements")
        XCTAssertEqual(output.sellerID, "Seller ID")
        XCTAssertEqual(output.showWork, true)
        XCTAssertEqual(output.softwareVersion, "Software Version")
        XCTAssertEqual(output.soloist, "Soloist")
        XCTAssertEqual(output.songDescription, "Song Description")
        XCTAssertEqual(output.songwriter, "Songwriter")
        XCTAssertEqual(output.songwriterKeywords, ["Songwriter", "Keywords"])
        XCTAssertEqual(output.soundEngineer, "Sound Engineer")
        XCTAssertEqual(output.sourceCredit, "Source Credit")
        XCTAssertEqual(output.subtitle, "Subtitle")
        XCTAssertEqual(output.subtitleKeywords, ["Subtitle", "Keywords"])
        XCTAssertEqual(output.taggingDate, date)
        XCTAssertEqual(output.thanks, "Thanks")
        XCTAssertEqual(output.title, "Title")
        XCTAssertEqual(output.titleKeywords, ["Title", "Keywords"])
        XCTAssertEqual(output.titleSort, "Title Sort")
        XCTAssertEqual(output.trackNumber.track, 7)
        XCTAssertEqual(output.trackNumber.totalTracks, 8)
        XCTAssertEqual(output.trackSubtitle, "Track Subtitle")
        XCTAssertEqual(output.tvEpisodeNumber, 9)
        XCTAssertEqual(output.tvEpisodeTitle, "TV Episode Title")
        XCTAssertEqual(output.tvSeason, 1)
        XCTAssertEqual(output.tvNetwork, "TV Network")
        XCTAssertEqual(output.tvShow, "TV Show")
        XCTAssertEqual(output.tvShowDescription, "TV Show Description")
        XCTAssertEqual(output.tvShowSort, "TV Show Sort")
        XCTAssertEqual(output.website, "Website")
        XCTAssertEqual(output.work, "Work")
        XCTAssertEqual(output.writer, "Writer")
    }

}
