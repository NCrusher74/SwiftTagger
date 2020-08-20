import XCTest
import SwiftTaggerID3
import SwiftTaggerMP4
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests_StringMetadata: XCTestCase {
    
    // MARK: - Mp4 String
    func testReadWriteMp4StringMetadata() throws {
        var file = try AudioFile(location: mp4Meta)
        XCTAssertEqual(file.acknowledgment, "Acknowledgment")
        XCTAssertEqual(file.album, "Album")
        XCTAssertEqual(file.albumArtist, "Album Artist")
        XCTAssertEqual(file.albumArtistSort, "Album Artist Sort")
        XCTAssertEqual(file.albumSort, "Album Sort")
        XCTAssertEqual(file.arranger, "Arranger")
        XCTAssertEqual(file.artist, "Artist")
        XCTAssertEqual(file.artistSort, "Artist Sort")
        XCTAssertEqual(file.artistWebpage, "Artist Url")
        XCTAssertEqual(file.audioFileWebpage, "audio file webpage")
        XCTAssertEqual(file.audioSourceWebpage, "audio source webpage")
        XCTAssertEqual(file.comment, "Comment")
        XCTAssertEqual(file.composer, "Composer")
        XCTAssertEqual(file.composerSort, "Composer Sort")
        XCTAssertEqual(file.conductor, "Conductor")
        XCTAssertEqual(file.copyright, "Copyright")
        XCTAssertEqual(file.copyrightWebpage, "copyright webpage")
        XCTAssertEqual(file.description, "Description")
        XCTAssertEqual(file.encodedBy, "Encoded By")
        XCTAssertEqual(file.encodingSettings, "encoding settings")
        XCTAssertEqual(file.encodingTool, "Encoding Tool")
        XCTAssertEqual(file.filmMakerWebpage, "Filmmaker Url")
        XCTAssertEqual(file.genre, "Custom Genre")
        XCTAssertEqual(file.grouping, "Grouping")
        XCTAssertEqual(file.information, "Information")
        XCTAssertEqual(file.isrc, "123456789012")
        XCTAssertEqual(file.label, "Label")
        XCTAssertEqual(file.linerNotes, "Liner Notes")
        XCTAssertEqual(file.longDescription, "Long Description")
        XCTAssertEqual(file.lyricist, "Lyricist")
        XCTAssertEqual(file.lyrics, "Lyrics")
        XCTAssertNil(file.mood)
        XCTAssertEqual(file.movement, "Movement Name")
        XCTAssertEqual(file.narrator, "Narrator")
        XCTAssertNil(file.originalAlbum)
        XCTAssertEqual(file.originalArtist, "Original Artist")
        XCTAssertNil(file.originalFilename)
        XCTAssertNil(file.originalLyricist, "Original")
        XCTAssertEqual(file.owner, "Owner")
        XCTAssertEqual(file.paymentWebpage, "payment webpage")
        XCTAssertEqual(file.podcastCategory, "Category")
        XCTAssertNil(file.podcastDescription)
        XCTAssertEqual(file.podcastFeed, "Podcast Url")
        XCTAssertEqual(file.podcastID, "Podcast ID")
        XCTAssertNil(file.producedNotice)
        XCTAssertEqual(file.publisher, "Publisher")
        XCTAssertEqual(file.publisherWebpage, "Publisher Url")
        XCTAssertEqual(file.radioStation, "radio station")
        XCTAssertEqual(file.radioStationOwner, "radio station owner")
        XCTAssertEqual(file.radioStationWebpage, "radio station webpage")
        XCTAssertEqual(file.recordCompany, "Record Company")
        XCTAssertEqual(file.recordingCopyright, "Recording Copyright")
        XCTAssertEqual(file.requirements, "Requirements")
        XCTAssertEqual(file.sellerID, "Seller")
        XCTAssertEqual(file.softwareVersion, "Software Version")
        XCTAssertEqual(file.songDescription, "Song Description")
        XCTAssertEqual(file.sourceCredit, "Source Credit")
        XCTAssertEqual(file.subtitle, "Subtitle")
        XCTAssertEqual(file.title, "Title")
        XCTAssertEqual(file.titleSort, "Title Sort")
        XCTAssertEqual(file.thanks, "Thanks")
        XCTAssertEqual(file.trackSubtitle, "Track Subtitle")
        XCTAssertEqual(file.tvEpisodeTitle, "TV Episode Title")
        XCTAssertEqual(file.tvNetwork, "TV Network")
        XCTAssertEqual(file.tvShow, "TV Show")
        XCTAssertEqual(file.tvShowDescription, "TV Show Description")
        XCTAssertEqual(file.tvShowSort, "TV Show Sort")
        XCTAssertEqual(file.website, "Website")
        XCTAssertEqual(file.work, "Work")
        XCTAssertEqual(file.writer, "Writer")

        file.acknowledgment = "New Acknowledgment"
        file.album = "New Album"
        file.albumArtist = "New Album Artist"
        file.albumArtistSort = "New Album Artist Sort"
        file.albumSort = "New Album Sort"
        file.arranger = "New Arranger"
        file.artist = "New Artist"
        file.artistSort = "New Artist Sort"
        file.artistWebpage = "New Artist Webpage"
        file.audioFileWebpage = "New Audio File Webpage"
        file.audioSourceWebpage = "New Audio Source Webpage"
        file.comment = "New Comment"
        file.composer = "New Composer"
        file.composerSort = "New Composer Sort"
        file.conductor = "New Conductor"
        file.copyright = "New Copyright"
        file.copyrightWebpage = "New Copyright Webpage"
        file.description = "New Description"
        file.encodedBy = "New EncodedBy"
        file.encodingSettings = "New Encoding Settings"
        file.encodingTool = "New Encoding Tool"
        file.filmMakerWebpage = "New FilmMaker Webpage"
        file.genre = "New Genre"
        file.grouping = "New Grouping"
        file.information = "New Information"
        file.isrc = "1234ISRC5678"
        file.label = "New Label"
        file.linerNotes = "New Liner Notes"
        file.longDescription = "New Long Description"
        file.lyricist = "New Lyricist"
        file.lyrics = "New Lyrics"
        file.mood = "New Mood"
        file.movement = "New Movement"
        file.narrator = "New Narrator"
        file.originalAlbum = "New Original Album"
        file.originalArtist = "New Original Artist"
        file.originalFilename = "New Original Filename"
        file.originalLyricist = "New Original Lyricist"
        file.owner = "New Owner"
        file.paymentWebpage = "New Payment Webpage"
        file.podcastCategory = "New Podcast Category"
        file.podcastDescription = "New Podcast Description"
        file.podcastFeed = "New Podcast Feed"
        file.podcastID = "New PodcastID"
        file.producedNotice = "New Produced Notice"
        file.publisher = "New Publisher"
        file.publisherWebpage = "New Publisher Webpage"
        file.radioStation = "New Radio Station"
        file.radioStationOwner = "New Radio Station Owner"
        file.radioStationWebpage = "New Radio Station Webpage"
        file.recordCompany = "New Record Company"
        file.recordingCopyright = "New Recording Copyright"
        file.requirements = "New Requirements"
        file.sellerID = "New Seller ID"
        file.softwareVersion = "New Software Version"
        file.songDescription = "New Song Description"
        file.sourceCredit = "New Source Credit"
        file.subtitle = "New Subtitle"
        file.title = "New Title"
        file.titleSort = "New Title Sort"
        file.thanks = "New Thanks"
        file.trackSubtitle = "New Track Subtitle"
        file.tvEpisodeTitle = "New TV Episode Title"
        file.tvNetwork = "New TV Network"
        file.tvShow = "New TV Show"
        file.tvShowDescription = "New TV Show Description"
        file.tvShowSort = "New TV Show Sort"
        file.website = "New Website"
        file.work = "New Work"
        file.writer = "New Writer"

        let mp4Output = try localDirectory(fileName: "testMp4-string", fileExtension: "m4a")
        try file.write(outputLocation: mp4Output)
        
        let newFile = try AudioFile(location: mp4Output)
        XCTAssertEqual(newFile.acknowledgment, "New Acknowledgment")
        XCTAssertEqual(newFile.album, "New Album")
        XCTAssertEqual(newFile.albumArtist, "New Album Artist")
        XCTAssertEqual(newFile.albumArtistSort, "New Album Artist Sort")
        XCTAssertEqual(newFile.albumSort, "New Album Sort")
        XCTAssertEqual(newFile.arranger, "New Arranger")
        XCTAssertEqual(newFile.artist, "New Artist")
        XCTAssertEqual(newFile.artistSort, "New Artist Sort")
        XCTAssertEqual(newFile.artistWebpage, "New Artist Webpage")
        XCTAssertEqual(newFile.audioFileWebpage, "New Audio File Webpage")
        XCTAssertEqual(newFile.audioSourceWebpage, "New Audio Source Webpage")
        XCTAssertEqual(newFile.comment, "New Comment")
        XCTAssertEqual(newFile.composer, "New Composer")
        XCTAssertEqual(newFile.composerSort, "New Composer Sort")
        XCTAssertEqual(newFile.conductor, "New Conductor")
        XCTAssertEqual(newFile.copyright, "New Copyright")
        XCTAssertEqual(newFile.copyrightWebpage, "New Copyright Webpage")
        XCTAssertEqual(newFile.description, "New Description")
        XCTAssertEqual(newFile.encodedBy, "New EncodedBy")
        XCTAssertEqual(newFile.encodingSettings, "New Encoding Settings")
        XCTAssertEqual(newFile.encodingTool, "New Encoding Tool")
        XCTAssertEqual(newFile.filmMakerWebpage, "New FilmMaker Webpage")
        XCTAssertEqual(newFile.genre, "New Genre")
        XCTAssertEqual(newFile.grouping, "New Grouping")
        XCTAssertEqual(newFile.information, "New Information")
        XCTAssertEqual(newFile.isrc, "1234ISRC5678")
        XCTAssertEqual(newFile.label, "New Label")
        XCTAssertEqual(newFile.linerNotes,"New Liner Notes")
        XCTAssertEqual(newFile.longDescription,"New Long Description")
        XCTAssertEqual(newFile.lyricist,"New Lyricist")
        XCTAssertEqual(newFile.lyrics,"New Lyrics")
        XCTAssertEqual(newFile.mood, "New Mood")
        XCTAssertEqual(newFile.movement, "New Movement")
        XCTAssertEqual(newFile.narrator, "New Narrator")
        XCTAssertEqual(newFile.originalAlbum, "New Original Album")
        XCTAssertEqual(newFile.originalArtist, "New Original Artist")
        XCTAssertEqual(newFile.originalFilename, "New Original Filename")
        XCTAssertEqual(newFile.originalLyricist, "New Original Lyricist")
        XCTAssertEqual(newFile.owner, "New Owner")
        XCTAssertEqual(newFile.paymentWebpage, "New Payment Webpage")
        XCTAssertEqual(newFile.podcastCategory, "New Podcast Category")
        XCTAssertEqual(newFile.podcastDescription, "New Podcast Description")
        XCTAssertEqual(newFile.podcastFeed, "New Podcast Feed")
        XCTAssertEqual(newFile.podcastID, "New PodcastID")
        XCTAssertEqual(newFile.producedNotice, "New Produced Notice")
        XCTAssertEqual(newFile.publisher, "New Publisher")
        XCTAssertEqual(newFile.publisherWebpage, "New Publisher Webpage")
        XCTAssertEqual(newFile.radioStation, "New Radio Station")
        XCTAssertEqual(newFile.radioStationOwner, "New Radio Station Owner")
        XCTAssertEqual(newFile.radioStationWebpage, "New Radio Station Webpage")
        XCTAssertEqual(newFile.recordCompany, "New Record Company")
        XCTAssertEqual(newFile.recordingCopyright, "New Recording Copyright")
        XCTAssertEqual(newFile.requirements, "New Requirements")
        XCTAssertEqual(newFile.sellerID, "New Seller ID")
        XCTAssertEqual(newFile.softwareVersion, "New Software Version")
        XCTAssertEqual(newFile.songDescription, "New Song Description")
        XCTAssertEqual(newFile.sourceCredit, "New Source Credit")
        XCTAssertEqual(newFile.subtitle, "New Subtitle")
        XCTAssertEqual(newFile.title, "New Title")
        XCTAssertEqual(newFile.titleSort, "New Title Sort")
        XCTAssertEqual(newFile.thanks, "New Thanks")
        XCTAssertEqual(newFile.trackSubtitle, "New Track Subtitle")
        XCTAssertEqual(newFile.tvEpisodeTitle, "New TV Episode Title")
        XCTAssertEqual(newFile.tvNetwork, "New TV Network")
        XCTAssertEqual(newFile.tvShow, "New TV Show")
        XCTAssertEqual(newFile.tvShowDescription, "New TV Show Description")
        XCTAssertEqual(newFile.tvShowSort, "New TV Show Sort")
        XCTAssertEqual(newFile.website, "New Website")
        XCTAssertEqual(newFile.work, "New Work")
        XCTAssertEqual(newFile.writer, "New Writer")
    }
    
    // MARK: - Mp3 String
    func testReadWriteMp3StringMetadataA_P() throws {
        var file = try AudioFile(location: mp3v24)
        XCTAssertEqual(file.acknowledgment, "Acknowledgment")
        file.acknowledgment = "New Acknowledgment"
        XCTAssertEqual(file.album, "Album")
        file.album = "New Album"
        XCTAssertEqual(file.albumArtist, "Album Artist")
        file.albumArtist = "New Album Artist"
        XCTAssertEqual(file.albumArtistSort, "Album Artist Sort")
        file.albumArtistSort = "New Album Artist Sort"
        XCTAssertEqual(file.albumSort, "Album Sort")
        file.albumSort = "New Album Sort"
        XCTAssertEqual(file.arranger, "Arranger")
        file.arranger = "New Arranger"
        XCTAssertEqual(file.artist, "Artist")
        file.artist = "New Artist"
        XCTAssertEqual(file.artistSort, "Artist Sort")
        file.artistSort = "New Artist Sort"
        XCTAssertEqual(file.artistWebpage, "http://artist.url")
        file.artistWebpage = "New Artist Webpage"
        XCTAssertEqual(file.audioFileWebpage, "http://audiofile.url")
        file.audioFileWebpage = "New Audio File Webpage"
        XCTAssertEqual(file.audioSourceWebpage, "http://audiosource.url")
        file.audioSourceWebpage = "New Audio Source Webpage"
        XCTAssertEqual(file.comment, "Comment Content")
        file.comment = "New Comment"
        XCTAssertEqual(file.composer, "Composer")
        file.composer = "New Composer"
        XCTAssertEqual(file.composerSort, "Composer Sort")
        file.composerSort = "New Composer Sort"
        XCTAssertEqual(file.conductor, "Conductor")
        file.conductor = "New Conductor"
        XCTAssertEqual(file.copyright, "2020 Copyright")
        file.copyright = "New Copyright"
        XCTAssertEqual(file.copyrightWebpage, "http://copyright.url")
        file.copyrightWebpage = "New Copyright Webpage"
        XCTAssertEqual(file.description, "Description")
        file.description = "New Description"
        XCTAssertEqual(file.encodedBy, "Encoded By")
        file.encodedBy = "New EncodedBy"
        XCTAssertEqual(file.encodingSettings, "Encoding Settings")
        file.encodingSettings = "New Encoding Settings"
        XCTAssertNil(file.encodingTool)
        file.encodingTool = "New Encoding Tool"
        XCTAssertNil(file.filmMakerWebpage)
        file.filmMakerWebpage = "New FilmMaker Webpage"
        XCTAssertEqual(file.genre, "Blues Refinement")
        file.genre = "New Genre"
        XCTAssertEqual(file.grouping, "Grouping")
        file.grouping = "New Grouping"
        XCTAssertNil(file.information)
        file.information = "New Information"
        XCTAssertEqual(file.isrc, "987654321098")
        file.isrc = "1234ISRC5678"
        XCTAssertEqual(file.label, "Publisher")
        file.label = "New Label"
        XCTAssertEqual(file.linerNotes, "Liner Notes")
        file.linerNotes = "New Liner Notes"
        XCTAssertEqual(file.longDescription, "Long Description")
        file.longDescription = "New Long Description"
        XCTAssertEqual(file.lyricist, "Lyricist")
        file.lyricist = "New Lyricist"
        XCTAssertEqual(file.lyrics, "Lyrics Content")
        file.lyrics = "New Lyrics"
        XCTAssertEqual(file.mood, "Mood")
        file.mood = "New Mood"
        XCTAssertEqual(file.movement, "Movement Name")
        file.movement = "New Movement"
        XCTAssertEqual(file.narrator, "New Composer")
        file.narrator = "New Narrator"
        XCTAssertEqual(file.originalAlbum, "Original Album")
        file.originalAlbum = "New Original Album"
        XCTAssertEqual(file.originalArtist, "Original Artist")
        file.originalArtist = "New Original Artist"
        XCTAssertEqual(file.originalFilename, "Original Filename")
        file.originalFilename = "New Original Filename"
        XCTAssertEqual(file.originalLyricist, "Original Lyricist")
        file.originalLyricist = "New Original Lyricist"
        XCTAssertEqual(file.owner, "File Owner")
        file.owner = "New Owner"
        XCTAssertEqual(file.paymentWebpage, "http://payment.url")
        file.paymentWebpage = "New Payment Webpage"
        XCTAssertEqual(file.podcastCategory, "Podcast Category")
        file.podcastCategory = "New Podcast Category"
        XCTAssertEqual(file.podcastDescription, "Podcast Description")
        file.podcastDescription = "New Podcast Description"
        XCTAssertEqual(file.podcastFeed, "http://podcast.url")
        file.podcastFeed = "New Podcast Feed"
        XCTAssertEqual(file.podcastID, "Podcast ID")
        file.podcastID = "New PodcastID"
        XCTAssertEqual(file.producedNotice, "2020 Produced Notice")
        file.producedNotice = "New Produced Notice"
        XCTAssertEqual(file.publisher, "New Label")
        file.publisher = "New Publisher"
        XCTAssertEqual(file.publisherWebpage, "http://publisher.url")
        file.publisherWebpage = "New Publisher Webpage"
        XCTAssertEqual(file.radioStation, "Radio Station")
        file.radioStation = "New Radio Station"
        XCTAssertEqual(file.radioStationOwner, "Radio Station Owner")
        file.radioStationOwner = "New Radio Station Owner"
        XCTAssertEqual(file.radioStationWebpage, "http://radiostation.url")
        file.radioStationWebpage = "New Radio Station Webpage"
        XCTAssertEqual(file.recordCompany, "New Publisher")
        file.recordCompany = "New Record Company"
        XCTAssertNil(file.recordingCopyright)
        file.recordingCopyright = "New Recording Copyright"
        XCTAssertNil(file.requirements)
        file.requirements = "New Requirements"
        XCTAssertNil(file.sellerID)
        file.sellerID = "New Seller ID"
        XCTAssertNil(file.softwareVersion)
        file.softwareVersion = "New Software Version"
        XCTAssertEqual(file.songDescription, "Song Description")
        file.songDescription = "New Song Description"
        XCTAssertEqual(file.sourceCredit, "Source Credit")
        file.sourceCredit = "New Source Credit"
        XCTAssertEqual(file.subtitle, "Subtitle")
        file.subtitle = "New Subtitle"

        XCTAssertEqual(file.title, "Title")
        file.title = "New Title"
        XCTAssertEqual(file.titleSort, "Title Sort")
        file.titleSort = "New Title Sort"
        XCTAssertEqual(file.thanks, "Thanks")
        file.thanks = "New Thanks"
        XCTAssertEqual(file.trackSubtitle, "Set Subtitle")
        file.trackSubtitle = "New Track Subtitle"
        XCTAssertNil(file.tvEpisodeTitle)
        file.tvEpisodeTitle = "New TV Episode Title"
        XCTAssertNil(file.tvNetwork)
        file.tvNetwork = "New TV Network"
        XCTAssertNil(file.tvShow)
        file.tvShow = "New TV Show"
        XCTAssertNil(file.tvShowDescription)
        file.tvShowDescription = "New TV Show Description"
        XCTAssertNil(file.tvShowSort)
        file.tvShowSort = "New TV Show Sort"
        XCTAssertNil(file.website)
        file.website = "New Website"
        XCTAssertEqual(file.work, "Content Group")
        file.work = "New Work"
        XCTAssertNil(file.writer)
        file.writer = "New Writer"

        let mp3Output = try localDirectory(fileName: "testMp3-string", fileExtension: "mp3")
        try file.write(outputLocation: mp3Output)
        
        let newFile = try AudioFile(location: mp3Output)
        XCTAssertEqual(newFile.acknowledgment, "New Acknowledgment")
        XCTAssertEqual(newFile.album, "New Album")
        XCTAssertEqual(newFile.albumArtist, "New Album Artist")
        XCTAssertEqual(newFile.albumArtistSort, "New Album Artist Sort")
        XCTAssertEqual(newFile.albumSort, "New Album Sort")
        XCTAssertEqual(newFile.arranger, "New Arranger")
        XCTAssertEqual(newFile.artist, "New Artist")
        XCTAssertEqual(newFile.artistSort, "New Artist Sort")
        XCTAssertEqual(newFile.artistWebpage, "New Artist Webpage")
        XCTAssertEqual(newFile.audioFileWebpage, "New Audio File Webpage")
        XCTAssertEqual(newFile.audioSourceWebpage, "New Audio Source Webpage")
        XCTAssertEqual(newFile.comment, "New Comment")
        XCTAssertEqual(newFile.composer, "New Narrator")
        XCTAssertEqual(newFile.composerSort, "New Composer Sort")
        XCTAssertEqual(newFile.conductor, "New Conductor")
        XCTAssertEqual(newFile.copyright, "New Copyright")
        XCTAssertEqual(newFile.copyrightWebpage, "New Copyright Webpage")
        XCTAssertEqual(newFile.description, "New Description")
        XCTAssertEqual(newFile.encodedBy, "New EncodedBy")
        XCTAssertEqual(newFile.encodingSettings, "New Encoding Settings")
        XCTAssertEqual(newFile.encodingTool, "New Encoding Tool")
        XCTAssertEqual(newFile.filmMakerWebpage, "New FilmMaker Webpage")
        XCTAssertEqual(newFile.genre, "New Genre")
        XCTAssertEqual(newFile.grouping, "New Grouping")
        XCTAssertEqual(newFile.information, "New Information")
        XCTAssertEqual(newFile.isrc, "1234ISRC5678")
        XCTAssertEqual(newFile.label, "New Record Company")
        XCTAssertEqual(newFile.linerNotes,"New Liner Notes")
        XCTAssertEqual(newFile.longDescription,"New Long Description")
        XCTAssertEqual(newFile.lyricist,"New Lyricist")
        XCTAssertEqual(newFile.lyrics,"New Lyrics")
        XCTAssertEqual(newFile.mood, "New Mood")
        XCTAssertEqual(newFile.movement, "New Movement")
        XCTAssertEqual(newFile.narrator, "New Narrator")
        XCTAssertEqual(newFile.originalAlbum, "New Original Album")
        XCTAssertEqual(newFile.originalArtist, "New Original Artist")
        XCTAssertEqual(newFile.originalFilename, "New Original Filename")
        XCTAssertEqual(newFile.originalLyricist, "New Original Lyricist")
        XCTAssertEqual(newFile.owner, "New Owner")
        XCTAssertEqual(newFile.paymentWebpage, "New Payment Webpage")
        XCTAssertEqual(newFile.podcastCategory, "New Podcast Category")
        XCTAssertEqual(newFile.podcastDescription, "New Podcast Description")
        XCTAssertEqual(newFile.podcastFeed, "New Podcast Feed")
        XCTAssertEqual(newFile.podcastID, "New PodcastID")
        XCTAssertEqual(newFile.producedNotice, "New Produced Notice")
        XCTAssertEqual(newFile.publisher, "New Record Company")
        XCTAssertEqual(newFile.publisherWebpage, "New Publisher Webpage")
        XCTAssertEqual(newFile.radioStation, "New Radio Station")
        XCTAssertEqual(newFile.radioStationOwner, "New Radio Station Owner")
        XCTAssertEqual(newFile.radioStationWebpage, "New Radio Station Webpage")
        XCTAssertEqual(newFile.recordCompany, "New Record Company")
        XCTAssertEqual(newFile.recordingCopyright, "New Recording Copyright")
        XCTAssertEqual(newFile.requirements, "New Requirements")
        XCTAssertEqual(newFile.sellerID, "New Seller ID")
        XCTAssertEqual(newFile.softwareVersion, "New Software Version")
        XCTAssertEqual(newFile.songDescription, "New Song Description")
        XCTAssertEqual(newFile.sourceCredit, "New Source Credit")
        XCTAssertEqual(newFile.subtitle, "New Subtitle")
        XCTAssertEqual(newFile.title, "New Title")
        XCTAssertEqual(newFile.titleSort, "New Title Sort")
        XCTAssertEqual(newFile.thanks, "New Thanks")
        XCTAssertEqual(newFile.trackSubtitle, "New Track Subtitle")
        XCTAssertEqual(newFile.tvEpisodeTitle, "New TV Episode Title")
        XCTAssertEqual(newFile.tvNetwork, "New TV Network")
        XCTAssertEqual(newFile.tvShow, "New TV Show")
        XCTAssertEqual(newFile.tvShowDescription, "New TV Show Description")
        XCTAssertEqual(newFile.tvShowSort, "New TV Show Sort")
        XCTAssertEqual(newFile.website, "New Website")
        XCTAssertEqual(newFile.work, "New Work")
        XCTAssertEqual(newFile.writer, "New Writer")
    }
    
    func testRemovalMp4() throws {
        var file = try AudioFile(location: mp4Meta)

        XCTAssertEqual(file.acknowledgment, "Acknowledgment")
        file.acknowledgment = nil
        XCTAssertEqual(file.album, "Album")
        file.album = nil
        XCTAssertEqual(file.albumArtist, "Album Artist")
        file.albumArtist = nil
        XCTAssertEqual(file.albumArtistSort, "Album Artist Sort")
        file.albumArtistSort = nil
        XCTAssertEqual(file.albumSort, "Album Sort")
        file.albumSort = nil
        XCTAssertEqual(file.arranger, "Arranger")
        file.arranger = nil
        XCTAssertEqual(file.artist, "Artist")
        file.artist = nil
        XCTAssertEqual(file.artistSort, "Artist Sort")
        file.artistSort = nil
        XCTAssertEqual(file.artistWebpage, "Artist Url")
        file.artistWebpage = nil
        XCTAssertEqual(file.audioFileWebpage, "audio file webpage")
        file.audioFileWebpage = nil
        XCTAssertEqual(file.audioSourceWebpage, "audio source webpage")
        file.audioSourceWebpage = nil
        XCTAssertEqual(file.comment, "Comment")
        file.comment = nil
        XCTAssertEqual(file.composer, "Composer")
        file.composer = nil
        XCTAssertEqual(file.composerSort, "Composer Sort")
        file.composerSort = nil
        XCTAssertEqual(file.conductor, "Conductor")
        file.conductor = nil
        XCTAssertEqual(file.copyright, "Copyright")
        file.copyright = nil
        XCTAssertEqual(file.copyrightWebpage, "copyright webpage")
        file.copyrightWebpage = nil
        XCTAssertEqual(file.description, "Description")
        file.description = nil
        XCTAssertEqual(file.encodedBy, "Encoded By")
        file.encodedBy = nil
        XCTAssertEqual(file.encodingSettings, "encoding settings")
        file.encodingSettings = nil
        XCTAssertEqual(file.encodingTool, "Encoding Tool")
        file.encodingTool = nil
        XCTAssertEqual(file.filmMakerWebpage, "Filmmaker Url")
        file.filmMakerWebpage = nil
        XCTAssertEqual(file.genre, "Custom Genre")
        file.genre = nil
        XCTAssertEqual(file.grouping, "Grouping")
        file.grouping = nil
        XCTAssertEqual(file.information, "Information")
        file.information = nil
        XCTAssertEqual(file.isrc, "123456789012")
        file.isrc = nil
        XCTAssertEqual(file.label, "Label")
        file.label = nil
        XCTAssertEqual(file.linerNotes, "Liner Notes")
        file.linerNotes = nil
        XCTAssertEqual(file.longDescription, "Long Description")
        file.longDescription = nil
        XCTAssertEqual(file.lyricist, "Lyricist")
        file.lyricist = nil
        XCTAssertEqual(file.lyrics, "Lyrics")
        file.lyrics = nil
        XCTAssertNil(file.mood)
        file.mood = nil
        XCTAssertEqual(file.movement, "Movement Name")
        file.movement = nil
        XCTAssertEqual(file.narrator, "Narrator")
        file.narrator = nil
        XCTAssertNil(file.originalAlbum)
        file.originalAlbum = nil
        XCTAssertEqual(file.originalArtist, "Original Artist")
        file.originalArtist = nil
        XCTAssertNil(file.originalFilename)
        file.originalFilename = nil
        XCTAssertNil(file.originalLyricist, "Original")
        file.originalLyricist = nil
        XCTAssertEqual(file.owner, "Owner")
        file.owner = nil
        XCTAssertEqual(file.paymentWebpage, "payment webpage")
        file.paymentWebpage = nil
        XCTAssertEqual(file.podcastCategory, "Category")
        file.podcastCategory = nil
        XCTAssertNil(file.podcastDescription)
        file.podcastDescription = nil
        XCTAssertEqual(file.podcastFeed, "Podcast Url")
        file.podcastFeed = nil
        XCTAssertEqual(file.podcastID, "Podcast ID")
        file.podcastID = nil
        XCTAssertNil(file.producedNotice)
        file.producedNotice = nil
        XCTAssertEqual(file.publisher, "Publisher")
        file.publisher = nil
        XCTAssertEqual(file.publisherWebpage, "Publisher Url")
        file.publisherWebpage = nil
        XCTAssertEqual(file.radioStation, "radio station")
        file.radioStation = nil
        XCTAssertEqual(file.radioStationOwner, "radio station owner")
        file.radioStationOwner = nil
        XCTAssertEqual(file.radioStationWebpage, "radio station webpage")
        file.radioStationWebpage = nil
        XCTAssertEqual(file.recordCompany, "Record Company")
        file.recordCompany = nil
        XCTAssertEqual(file.recordingCopyright, "Recording Copyright")
        file.recordingCopyright = nil
        XCTAssertEqual(file.requirements, "Requirements")
        file.requirements = nil
        XCTAssertEqual(file.sellerID, "Seller")
        file.sellerID = nil
        XCTAssertEqual(file.softwareVersion, "Software Version")
        file.softwareVersion = nil
        XCTAssertEqual(file.songDescription, "Song Description")
        file.songDescription = nil
        XCTAssertEqual(file.sourceCredit, "Source Credit")
        file.sourceCredit = nil
        XCTAssertEqual(file.subtitle, "Subtitle")
        file.subtitle = nil
        XCTAssertEqual(file.title, "Title")
        file.title = nil
        XCTAssertEqual(file.titleSort, "Title Sort")
        file.titleSort = nil
        XCTAssertEqual(file.thanks, "Thanks")
        file.thanks = nil
        XCTAssertEqual(file.trackSubtitle, "Track Subtitle")
        file.trackSubtitle = nil
        XCTAssertEqual(file.tvEpisodeTitle, "TV Episode Title")
        file.tvEpisodeTitle = nil
        XCTAssertEqual(file.tvNetwork, "TV Network")
        file.tvNetwork = nil
        XCTAssertEqual(file.tvShow, "TV Show")
        file.tvShow = nil
        XCTAssertEqual(file.tvShowDescription, "TV Show Description")
        file.tvShowDescription = nil
        XCTAssertEqual(file.tvShowSort, "TV Show Sort")
        file.tvShowSort = nil
        XCTAssertEqual(file.website, "Website")
        file.website = nil
        XCTAssertEqual(file.work, "Work")
        file.work = nil
        XCTAssertEqual(file.writer, "Writer")
        file.writer = nil
        
        let mp4Output = try localDirectory(fileName: "testMp4-removeString", fileExtension: "m4a")
        try file.write(outputLocation: mp4Output)
        
        let newFile = try AudioFile(location: mp4Output)
        XCTAssertNil(newFile.acknowledgment)
        XCTAssertNil(newFile.album)
        XCTAssertNil(newFile.albumArtist)
        XCTAssertNil(newFile.albumArtistSort)
        XCTAssertNil(newFile.albumSort)
        XCTAssertNil(newFile.arranger)
        XCTAssertNil(newFile.artist)
        XCTAssertNil(newFile.artistSort)
        XCTAssertNil(newFile.artistWebpage)
        XCTAssertNil(newFile.audioFileWebpage)
        XCTAssertNil(newFile.audioSourceWebpage)
        XCTAssertNil(newFile.comment)
        XCTAssertNil(newFile.composer)
        XCTAssertNil(newFile.composerSort)
        XCTAssertNil(newFile.conductor)
        XCTAssertNil(newFile.copyright)
        XCTAssertNil(newFile.copyrightWebpage)
        XCTAssertNil(newFile.description)
        XCTAssertNil(newFile.encodedBy)
        XCTAssertNil(newFile.encodingSettings)
        XCTAssertNil(newFile.encodingTool)
        XCTAssertNil(newFile.filmMakerWebpage)
        XCTAssertNil(newFile.genre)
        XCTAssertNil(newFile.grouping)
        XCTAssertNil(newFile.information)
        XCTAssertNil(newFile.isrc)
        XCTAssertNil(newFile.label)
        XCTAssertNil(newFile.linerNotes)
        XCTAssertNil(newFile.longDescription)
        XCTAssertNil(newFile.lyricist)
        XCTAssertNil(newFile.lyrics)
        XCTAssertNil(newFile.mood)
        XCTAssertNil(newFile.movement)
        XCTAssertNil(newFile.narrator)
        XCTAssertNil(newFile.originalAlbum)
        XCTAssertNil(newFile.originalArtist)
        XCTAssertNil(newFile.originalFilename)
        XCTAssertNil(newFile.originalLyricist)
        XCTAssertNil(newFile.owner)
        XCTAssertNil(newFile.paymentWebpage)
        XCTAssertNil(newFile.podcastCategory)
        XCTAssertNil(newFile.podcastDescription)
        XCTAssertNil(newFile.podcastFeed)
        XCTAssertNil(newFile.podcastID)
        XCTAssertNil(newFile.producedNotice)
        XCTAssertNil(newFile.publisher)
        XCTAssertNil(newFile.publisherWebpage)
        XCTAssertNil(newFile.radioStation)
        XCTAssertNil(newFile.radioStationOwner)
        XCTAssertNil(newFile.radioStationWebpage)
        XCTAssertNil(newFile.recordCompany)
        XCTAssertNil(newFile.recordingCopyright)
        XCTAssertNil(newFile.requirements)
        XCTAssertNil(newFile.sellerID)
        XCTAssertNil(newFile.softwareVersion)
        XCTAssertNil(newFile.songDescription)
        XCTAssertNil(newFile.sourceCredit)
        XCTAssertNil(newFile.subtitle)
        XCTAssertNil(newFile.title)
        XCTAssertNil(newFile.titleSort)
        XCTAssertNil(newFile.thanks)
        XCTAssertNil(newFile.trackSubtitle)
        XCTAssertNil(newFile.tvEpisodeTitle)
        XCTAssertNil(newFile.tvNetwork)
        XCTAssertNil(newFile.tvShow)
        XCTAssertNil(newFile.tvShowDescription)
        XCTAssertNil(newFile.tvShowSort)
        XCTAssertNil(newFile.website)
        XCTAssertNil(newFile.work)
        XCTAssertNil(newFile.writer)
    }
    
    func testRemovalMp3() throws {
        var file = try AudioFile(location: mp3v24)
        XCTAssertEqual(file.acknowledgment, "Acknowledgment")
        file.acknowledgment = nil
        XCTAssertEqual(file.album, "Album")
        file.album = nil
        XCTAssertEqual(file.albumArtist, "Album Artist")
        file.albumArtist = nil
        XCTAssertEqual(file.albumArtistSort, "Album Artist Sort")
        file.albumArtistSort = nil
        XCTAssertEqual(file.albumSort, "Album Sort")
        file.albumSort = nil
        XCTAssertEqual(file.arranger, "Arranger")
        file.arranger = nil
        XCTAssertEqual(file.artist, "Artist")
        file.artist = nil
        XCTAssertEqual(file.artistSort, "Artist Sort")
        file.artistSort = nil
        XCTAssertEqual(file.artistWebpage, "http://artist.url")
        file.artistWebpage = nil
        XCTAssertEqual(file.audioFileWebpage, "http://audiofile.url")
        file.audioFileWebpage = nil
        XCTAssertEqual(file.audioSourceWebpage, "http://audiosource.url")
        file.audioSourceWebpage = nil
        XCTAssertEqual(file.comment, "Comment Content")
        file.comment = nil
        XCTAssertEqual(file.composer, "Composer")
        file.composer = nil
        XCTAssertEqual(file.composerSort, "Composer Sort")
        file.composerSort = nil
        XCTAssertEqual(file.conductor, "Conductor")
        file.conductor = nil
        XCTAssertEqual(file.copyright, "2020 Copyright")
        file.copyright = nil
        XCTAssertEqual(file.copyrightWebpage, "http://copyright.url")
        file.copyrightWebpage = nil
        XCTAssertEqual(file.description, "Description")
        file.description = nil
        XCTAssertEqual(file.encodedBy, "Encoded By")
        file.encodedBy = nil
        XCTAssertEqual(file.encodingSettings, "Encoding Settings")
        file.encodingSettings = nil
        XCTAssertNil(file.encodingTool)
        file.encodingTool = nil
        XCTAssertNil(file.filmMakerWebpage)
        file.filmMakerWebpage = nil
        XCTAssertEqual(file.genre, "Blues Refinement")
        file.genre = nil
        XCTAssertEqual(file.grouping, "Grouping")
        file.grouping = nil
        XCTAssertNil(file.information)
        file.information = nil
        XCTAssertEqual(file.isrc, "987654321098")
        file.isrc = nil
        XCTAssertEqual(file.label, "Publisher")
        file.label = nil
        XCTAssertEqual(file.linerNotes, "Liner Notes")
        file.linerNotes = nil
        XCTAssertEqual(file.longDescription, "Long Description")
        file.longDescription = nil
        XCTAssertEqual(file.lyricist, "Lyricist")
        file.lyricist = nil
        XCTAssertEqual(file.lyrics, "Lyrics Content")
        file.lyrics = nil
        XCTAssertEqual(file.mood, "Mood")
        file.mood = nil
        XCTAssertEqual(file.movement, "Movement Name")
        file.movement = nil
        XCTAssertEqual(file.originalAlbum, "Original Album")
        file.originalAlbum = nil
        XCTAssertEqual(file.originalArtist, "Original Artist")
        file.originalArtist = nil
        XCTAssertEqual(file.originalFilename, "Original Filename")
        file.originalFilename = nil
        XCTAssertEqual(file.originalLyricist, "Original Lyricist")
        file.originalLyricist = nil
        XCTAssertEqual(file.owner, "File Owner")
        file.owner = nil
        XCTAssertEqual(file.paymentWebpage, "http://payment.url")
        file.paymentWebpage = nil
        XCTAssertEqual(file.podcastCategory, "Podcast Category")
        file.podcastCategory = nil
        XCTAssertEqual(file.podcastDescription, "Podcast Description")
        file.podcastDescription = nil
        XCTAssertEqual(file.podcastFeed, "http://podcast.url")
        file.podcastFeed = nil
        XCTAssertEqual(file.podcastID, "Podcast ID")
        file.podcastID = nil
        XCTAssertEqual(file.producedNotice, "2020 Produced Notice")
        file.producedNotice = nil
        XCTAssertEqual(file.publisherWebpage, "http://publisher.url")
        file.publisherWebpage = nil
        XCTAssertEqual(file.radioStation, "Radio Station")
        file.radioStation = nil
        XCTAssertEqual(file.radioStationOwner, "Radio Station Owner")
        file.radioStationOwner = nil
        XCTAssertEqual(file.radioStationWebpage, "http://radiostation.url")
        file.radioStationWebpage = nil
        XCTAssertNil(file.recordingCopyright)
        file.recordingCopyright = nil
        XCTAssertNil(file.requirements)
        file.requirements = nil
        XCTAssertNil(file.sellerID)
        file.sellerID = nil
        XCTAssertNil(file.softwareVersion)
        file.softwareVersion = nil
        XCTAssertEqual(file.songDescription, "Song Description")
        file.songDescription = nil
        XCTAssertEqual(file.sourceCredit, "Source Credit")
        file.sourceCredit = nil
        XCTAssertEqual(file.subtitle, "Subtitle")
        file.subtitle = nil
        XCTAssertEqual(file.title, "Title")
        file.title = nil
        XCTAssertEqual(file.titleSort, "Title Sort")
        file.titleSort = nil
        XCTAssertEqual(file.thanks, "Thanks")
        file.thanks = nil
        XCTAssertEqual(file.trackSubtitle, "Set Subtitle")
        file.trackSubtitle = nil
        XCTAssertNil(file.tvEpisodeTitle)
        file.tvEpisodeTitle = nil
        XCTAssertNil(file.tvNetwork)
        file.tvNetwork = nil
        XCTAssertNil(file.tvShow)
        file.tvShow = nil
        XCTAssertNil(file.tvShowDescription)
        file.tvShowDescription = nil
        XCTAssertNil(file.tvShowSort)
        file.tvShowSort = nil
        XCTAssertNil(file.website)
        file.website = nil
        XCTAssertEqual(file.work, "Content Group")
        file.work = nil
        XCTAssertNil(file.writer)
        file.writer = nil
        
        let mp3Output = try localDirectory(fileName: "testMp3-RemovalString", fileExtension: "mp3")
        try file.write(outputLocation: mp3Output)
        
        let newFile = try AudioFile(location: mp3Output)
        XCTAssertNil(newFile.acknowledgment)
        XCTAssertNil(newFile.album)
        XCTAssertNil(newFile.albumArtist)
        XCTAssertNil(newFile.albumArtistSort)
        XCTAssertNil(newFile.albumSort)
        XCTAssertNil(newFile.arranger)
        XCTAssertNil(newFile.artist)
        XCTAssertNil(newFile.artistSort)
        XCTAssertNil(newFile.artistWebpage)
        XCTAssertNil(newFile.audioFileWebpage)
        XCTAssertNil(newFile.audioSourceWebpage)
        XCTAssertNil(newFile.comment)
        XCTAssertNil(newFile.composer)
        XCTAssertNil(newFile.composerSort)
        XCTAssertNil(newFile.conductor)
        XCTAssertNil(newFile.copyright)
        XCTAssertNil(newFile.copyrightWebpage)
        XCTAssertNil(newFile.description)
        XCTAssertNil(newFile.encodedBy)
        XCTAssertNil(newFile.encodingSettings)
        XCTAssertNil(newFile.encodingTool)
        XCTAssertNil(newFile.filmMakerWebpage)
        XCTAssertNil(newFile.genre)
        XCTAssertNil(newFile.grouping)
        XCTAssertNil(newFile.information)
        XCTAssertNil(newFile.isrc)
        XCTAssertNil(newFile.label)
        XCTAssertNil(newFile.linerNotes)
        XCTAssertNil(newFile.longDescription)
        XCTAssertNil(newFile.lyricist)
        XCTAssertNil(newFile.lyrics)
        XCTAssertNil(newFile.mood)
        XCTAssertNil(newFile.movement)
        XCTAssertNil(newFile.narrator)
        XCTAssertNil(newFile.originalAlbum)
        XCTAssertNil(newFile.originalArtist)
        XCTAssertNil(newFile.originalFilename)
        XCTAssertNil(newFile.originalLyricist)
        XCTAssertNil(newFile.owner)
        XCTAssertNil(newFile.paymentWebpage)
        XCTAssertNil(newFile.podcastCategory)
        XCTAssertNil(newFile.podcastDescription)
        XCTAssertNil(newFile.podcastFeed)
        XCTAssertNil(newFile.podcastID)
        XCTAssertNil(newFile.producedNotice)
        XCTAssertNil(newFile.publisher)
        XCTAssertNil(newFile.publisherWebpage)
        XCTAssertNil(newFile.radioStation)
        XCTAssertNil(newFile.radioStationOwner)
        XCTAssertNil(newFile.radioStationWebpage)
        XCTAssertNil(newFile.recordCompany)
        XCTAssertNil(newFile.recordingCopyright)
        XCTAssertNil(newFile.requirements)
        XCTAssertNil(newFile.sellerID)
        XCTAssertNil(newFile.softwareVersion)
        XCTAssertNil(newFile.songDescription)
        XCTAssertNil(newFile.sourceCredit)
        XCTAssertNil(newFile.subtitle)
        XCTAssertNil(newFile.title)
        XCTAssertNil(newFile.titleSort)
        XCTAssertNil(newFile.thanks)
        XCTAssertNil(newFile.trackSubtitle)
        XCTAssertNil(newFile.tvEpisodeTitle)
        XCTAssertNil(newFile.tvNetwork)
        XCTAssertNil(newFile.tvShow)
        XCTAssertNil(newFile.tvShowDescription)
        XCTAssertNil(newFile.tvShowSort)
        XCTAssertNil(newFile.website)
        XCTAssertNil(newFile.work)
        XCTAssertNil(newFile.writer)
    }
}
