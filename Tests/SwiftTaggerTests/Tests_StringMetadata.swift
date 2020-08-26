import XCTest
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests_StringMetadata: XCTestCase {
    
    // MARK: - Mp4 String
    func testReadWriteMp4StringMetadata() throws {
        var file = try AudioFile(location: mp4NoMeta)
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

        let mp4Output = try tempDirectory().appendingPathComponent("testMp4-string.m4a")
//        let mp4Output = try localDirectory(fileName: "testMp4-string", fileExtension: "m4a")
        try file.write(outputLocation: mp4Output)
        
        var newFile = try AudioFile(location: mp4Output)
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
        
        newFile.acknowledgment = nil
        newFile.album = nil
        newFile.albumArtist = nil
        newFile.albumArtistSort = nil
        newFile.albumSort = nil
        newFile.arranger = nil
        newFile.artist = nil
        newFile.artistSort = nil
        newFile.artistWebpage = nil
        newFile.audioFileWebpage = nil
        newFile.audioSourceWebpage = nil
        newFile.comment = nil
        newFile.composer = nil
        newFile.composerSort = nil
        newFile.conductor = nil
        newFile.copyright = nil
        newFile.copyrightWebpage = nil
        newFile.description = nil
        newFile.encodedBy = nil
        newFile.encodingSettings = nil
        newFile.encodingTool = nil
        newFile.filmMakerWebpage = nil
        newFile.genre = nil
        newFile.grouping = nil
        newFile.information = nil
        newFile.isrc = nil
        newFile.label = nil
        newFile.linerNotes = nil
        newFile.longDescription = nil
        newFile.lyricist = nil
        newFile.lyrics = nil
        newFile.mood = nil
        newFile.movement = nil
        newFile.narrator = nil
        newFile.originalAlbum = nil
        newFile.originalArtist = nil
        newFile.originalFilename = nil
        newFile.originalLyricist = nil
        newFile.owner = nil
        newFile.paymentWebpage = nil
        newFile.podcastCategory = nil
        newFile.podcastDescription = nil
        newFile.podcastFeed = nil
        newFile.podcastID = nil
        newFile.producedNotice = nil
        newFile.publisher = nil
        newFile.publisherWebpage = nil
        newFile.radioStation = nil
        newFile.radioStationOwner = nil
        newFile.radioStationWebpage = nil
        newFile.recordCompany = nil
        newFile.recordingCopyright = nil
        newFile.requirements = nil
        newFile.sellerID = nil
        newFile.softwareVersion = nil
        newFile.songDescription = nil
        newFile.sourceCredit = nil
        newFile.subtitle = nil
        newFile.title = nil
        newFile.titleSort = nil
        newFile.thanks = nil
        newFile.trackSubtitle = nil
        newFile.tvEpisodeTitle = nil
        newFile.tvNetwork = nil
        newFile.tvShow = nil
        newFile.tvShowDescription = nil
        newFile.tvShowSort = nil
        newFile.website = nil
        newFile.work = nil
        newFile.writer = nil
        
        let mp4Output2 = try tempDirectory().appendingPathComponent("testMp4-stringRemoval.m4a")
//        let mp4Output2 = try localDirectory(fileName: "testMp4-removeString", fileExtension: "m4a")
        try newFile.write(outputLocation: mp4Output2)
        
        let newFile2 = try AudioFile(location: mp4Output2)
        XCTAssertNil(newFile2.acknowledgment)
        XCTAssertNil(newFile2.album)
        XCTAssertNil(newFile2.albumArtist)
        XCTAssertNil(newFile2.albumArtistSort)
        XCTAssertNil(newFile2.albumSort)
        XCTAssertNil(newFile2.arranger)
        XCTAssertNil(newFile2.artist)
        XCTAssertNil(newFile2.artistSort)
        XCTAssertNil(newFile2.artistWebpage)
        XCTAssertNil(newFile2.audioFileWebpage)
        XCTAssertNil(newFile2.audioSourceWebpage)
        XCTAssertNil(newFile2.comment)
        XCTAssertNil(newFile2.composer)
        XCTAssertNil(newFile2.composerSort)
        XCTAssertNil(newFile2.conductor)
        XCTAssertNil(newFile2.copyright)
        XCTAssertNil(newFile2.copyrightWebpage)
        XCTAssertNil(newFile2.description)
        XCTAssertNil(newFile2.encodedBy)
        XCTAssertNil(newFile2.encodingSettings)
        XCTAssertNil(newFile2.encodingTool)
        XCTAssertNil(newFile2.filmMakerWebpage)
        XCTAssertNil(newFile2.genre)
        XCTAssertNil(newFile2.grouping)
        XCTAssertNil(newFile2.information)
        XCTAssertNil(newFile2.isrc)
        XCTAssertNil(newFile2.label)
        XCTAssertNil(newFile2.linerNotes)
        XCTAssertNil(newFile2.longDescription)
        XCTAssertNil(newFile2.lyricist)
        XCTAssertNil(newFile2.lyrics)
        XCTAssertNil(newFile2.mood)
        XCTAssertNil(newFile2.movement)
        XCTAssertNil(newFile2.narrator)
        XCTAssertNil(newFile2.originalAlbum)
        XCTAssertNil(newFile2.originalArtist)
        XCTAssertNil(newFile2.originalFilename)
        XCTAssertNil(newFile2.originalLyricist)
        XCTAssertNil(newFile2.owner)
        XCTAssertNil(newFile2.paymentWebpage)
        XCTAssertNil(newFile2.podcastCategory)
        XCTAssertNil(newFile2.podcastDescription)
        XCTAssertNil(newFile2.podcastFeed)
        XCTAssertNil(newFile2.podcastID)
        XCTAssertNil(newFile2.producedNotice)
        XCTAssertNil(newFile2.publisher)
        XCTAssertNil(newFile2.publisherWebpage)
        XCTAssertNil(newFile2.radioStation)
        XCTAssertNil(newFile2.radioStationOwner)
        XCTAssertNil(newFile2.radioStationWebpage)
        XCTAssertNil(newFile2.recordCompany)
        XCTAssertNil(newFile2.recordingCopyright)
        XCTAssertNil(newFile2.requirements)
        XCTAssertNil(newFile2.sellerID)
        XCTAssertNil(newFile2.softwareVersion)
        XCTAssertNil(newFile2.songDescription)
        XCTAssertNil(newFile2.sourceCredit)
        XCTAssertNil(newFile2.subtitle)
        XCTAssertNil(newFile2.title)
        XCTAssertNil(newFile2.titleSort)
        XCTAssertNil(newFile2.thanks)
        XCTAssertNil(newFile2.trackSubtitle)
        XCTAssertNil(newFile2.tvEpisodeTitle)
        XCTAssertNil(newFile2.tvNetwork)
        XCTAssertNil(newFile2.tvShow)
        XCTAssertNil(newFile2.tvShowDescription)
        XCTAssertNil(newFile2.tvShowSort)
        XCTAssertNil(newFile2.website)
        XCTAssertNil(newFile2.work)
        XCTAssertNil(newFile2.writer)

    }
    
    // MARK: - Mp3 String
    func testReadWriteMp3StringMetadata() throws {
        var file = try AudioFile(location: mp3NoMeta)
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

        let mp3Output = try tempDirectory().appendingPathComponent("testMp3-string.mp3")
//        let mp3Output = try localDirectory(fileName: "testMp3-string", fileExtension: "mp3")
        try file.write(outputLocation: mp3Output)
        
        var newFile = try AudioFile(location: mp3Output)
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
        
        newFile.acknowledgment = nil
        newFile.album = nil
        newFile.albumArtist = nil
        newFile.albumArtistSort = nil
        newFile.albumSort = nil
        newFile.arranger = nil
        newFile.artist = nil
        newFile.artistSort = nil
        newFile.artistWebpage = nil
        newFile.audioFileWebpage = nil
        newFile.audioSourceWebpage = nil
        newFile.comment = nil
        newFile.composer = nil
        newFile.composerSort = nil
        newFile.conductor = nil
        newFile.copyright = nil
        newFile.copyrightWebpage = nil
        newFile.description = nil
        newFile.encodedBy = nil
        newFile.encodingSettings = nil
        newFile.encodingTool = nil
        newFile.filmMakerWebpage = nil
        newFile.genre = nil
        newFile.grouping = nil
        newFile.information = nil
        newFile.isrc = nil
        newFile.label = nil
        newFile.linerNotes = nil
        newFile.longDescription = nil
        newFile.lyricist = nil
        newFile.lyrics = nil
        newFile.mood = nil
        newFile.movement = nil
        newFile.originalAlbum = nil
        newFile.originalArtist = nil
        newFile.originalFilename = nil
        newFile.originalLyricist = nil
        newFile.owner = nil
        newFile.paymentWebpage = nil
        newFile.podcastCategory = nil
        newFile.podcastDescription = nil
        newFile.podcastFeed = nil
        newFile.podcastID = nil
        newFile.producedNotice = nil
        newFile.publisherWebpage = nil
        newFile.radioStation = nil
        newFile.radioStationOwner = nil
        newFile.radioStationWebpage = nil
        newFile.recordingCopyright = nil
        newFile.requirements = nil
        newFile.sellerID = nil
        newFile.softwareVersion = nil
        newFile.songDescription = nil
        newFile.sourceCredit = nil
        newFile.subtitle = nil
        newFile.title = nil
        newFile.titleSort = nil
        newFile.thanks = nil
        newFile.trackSubtitle = nil
        newFile.tvEpisodeTitle = nil
        newFile.tvNetwork = nil
        newFile.tvShow = nil
        newFile.tvShowDescription = nil
        newFile.tvShowSort = nil
        newFile.website = nil
        newFile.work = nil
        newFile.writer = nil
        
        let mp3Output2 = try tempDirectory().appendingPathComponent("testMp4-stringRemoval.mp3")
//        let mp3Output2 = try localDirectory(fileName: "testMp3-RemovalString", fileExtension: "mp3")
        try newFile.write(outputLocation: mp3Output2)
        
        let newFile2 = try AudioFile(location: mp3Output2)
        XCTAssertNil(newFile2.acknowledgment)
        XCTAssertNil(newFile2.album)
        XCTAssertNil(newFile2.albumArtist)
        XCTAssertNil(newFile2.albumArtistSort)
        XCTAssertNil(newFile2.albumSort)
        XCTAssertNil(newFile2.arranger)
        XCTAssertNil(newFile2.artist)
        XCTAssertNil(newFile2.artistSort)
        XCTAssertNil(newFile2.artistWebpage)
        XCTAssertNil(newFile2.audioFileWebpage)
        XCTAssertNil(newFile2.audioSourceWebpage)
        XCTAssertNil(newFile2.comment)
        XCTAssertNil(newFile2.composer)
        XCTAssertNil(newFile2.composerSort)
        XCTAssertNil(newFile2.conductor)
        XCTAssertNil(newFile2.copyright)
        XCTAssertNil(newFile2.copyrightWebpage)
        XCTAssertNil(newFile2.description)
        XCTAssertNil(newFile2.encodedBy)
        XCTAssertNil(newFile2.encodingSettings)
        XCTAssertNil(newFile2.encodingTool)
        XCTAssertNil(newFile2.filmMakerWebpage)
        XCTAssertNil(newFile2.genre)
        XCTAssertNil(newFile2.grouping)
        XCTAssertNil(newFile2.information)
        XCTAssertNil(newFile2.isrc)
        XCTAssertNil(newFile2.label)
        XCTAssertNil(newFile2.linerNotes)
        XCTAssertNil(newFile2.longDescription)
        XCTAssertNil(newFile2.lyricist)
        XCTAssertNil(newFile2.lyrics)
        XCTAssertNil(newFile2.mood)
        XCTAssertNil(newFile2.movement)
        XCTAssertNil(newFile2.narrator)
        XCTAssertNil(newFile2.originalAlbum)
        XCTAssertNil(newFile2.originalArtist)
        XCTAssertNil(newFile2.originalFilename)
        XCTAssertNil(newFile2.originalLyricist)
        XCTAssertNil(newFile2.owner)
        XCTAssertNil(newFile2.paymentWebpage)
        XCTAssertNil(newFile2.podcastCategory)
        XCTAssertNil(newFile2.podcastDescription)
        XCTAssertNil(newFile2.podcastFeed)
        XCTAssertNil(newFile2.podcastID)
        XCTAssertNil(newFile2.producedNotice)
        XCTAssertNil(newFile2.publisher)
        XCTAssertNil(newFile2.publisherWebpage)
        XCTAssertNil(newFile2.radioStation)
        XCTAssertNil(newFile2.radioStationOwner)
        XCTAssertNil(newFile2.radioStationWebpage)
        XCTAssertNil(newFile2.recordCompany)
        XCTAssertNil(newFile2.recordingCopyright)
        XCTAssertNil(newFile2.requirements)
        XCTAssertNil(newFile2.sellerID)
        XCTAssertNil(newFile2.softwareVersion)
        XCTAssertNil(newFile2.songDescription)
        XCTAssertNil(newFile2.sourceCredit)
        XCTAssertNil(newFile2.subtitle)
        XCTAssertNil(newFile2.title)
        XCTAssertNil(newFile2.titleSort)
        XCTAssertNil(newFile2.thanks)
        XCTAssertNil(newFile2.trackSubtitle)
        XCTAssertNil(newFile2.tvEpisodeTitle)
        XCTAssertNil(newFile2.tvNetwork)
        XCTAssertNil(newFile2.tvShow)
        XCTAssertNil(newFile2.tvShowDescription)
        XCTAssertNil(newFile2.tvShowSort)
        XCTAssertNil(newFile2.website)
        XCTAssertNil(newFile2.work)
        XCTAssertNil(newFile2.writer)
    }
}
