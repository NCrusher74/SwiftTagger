import XCTest
import SwiftTaggerID3
import SwiftTaggerMP4
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests_OtherMetadata: XCTestCase {

    func testCreditListsMp4() throws {
        var read = try AudioFile(location: mp4Meta)
        // test read
        XCTAssertEqual(read.performerCreditList[.featuredArtist], ["Artist"])
        XCTAssertEqual(read.performerCreditList[.soloist], ["Soloist"])
        XCTAssertEqual(read.performerCreditList[.narrator], ["Narrator"])
        XCTAssertEqual(read.performerCreditList[.performer], ["Performers"])
        XCTAssertEqual(read.involvementCreditsList[.arranger], ["Arranger"])
        XCTAssertEqual(read.involvementCreditsList[.artDirection], ["Art Director"])
        XCTAssertEqual(read.involvementCreditsList[.composer], ["Composer"])
        XCTAssertEqual(read.involvementCreditsList[.conductor], ["Conductor"])
        XCTAssertEqual(read.involvementCreditsList[.director], ["Director"])
        XCTAssertEqual(read.involvementCreditsList[.executiveProducer], ["Executive Producer"])
        XCTAssertEqual(read.involvementCreditsList[.lyricist], ["Lyricist"])
        XCTAssertEqual(read.involvementCreditsList[.producer], ["Producer"])
        XCTAssertEqual(read.involvementCreditsList[.publisher], ["Publisher"])
        XCTAssertEqual(read.involvementCreditsList[.soundEngineer], ["Sound Engineer"])
        XCTAssertEqual(read.involvementCreditsList[.writer], ["Writer"])

        var write = try AudioFile(location: mp4NoMeta)
        write.performerCreditList[.featuredArtist] = ["New Artist"]
        write.performerCreditList[.soloist] = ["New Soloist"]
        write.performerCreditList[.narrator] = ["New Narrator"]
        write.performerCreditList[.performer] = ["Performer 1", "Performer 2"]
        write.involvementCreditsList[.arranger] = ["New Arranger"]
        write.involvementCreditsList[.artDirection] = ["New Art Director"]
        write.involvementCreditsList[.composer] = ["New Composer"]
        write.involvementCreditsList[.conductor] = ["New Conductor"]
        write.involvementCreditsList[.director] = ["New Director"]
        write.involvementCreditsList[.executiveProducer] = ["New Exec Producer"]
        write.involvementCreditsList[.lyricist] = ["New Lyricist"]
        write.involvementCreditsList[.producer] = ["New Producer"]
        write.involvementCreditsList[.publisher] = ["New Publisher"]
        write.involvementCreditsList[.soundEngineer] = ["New Sound Engineer"]
        write.involvementCreditsList[.writer] = ["Writer 1", "Writer 2"]

        let outputUrl = try localDirectory(fileName: "testMp4-Credit", fileExtension: "m4a")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertEqual(newFile.performerCreditList[.featuredArtist], ["New Artist"])
        XCTAssertEqual(newFile.performerCreditList[.soloist], ["New Soloist"])
        XCTAssertEqual(newFile.performerCreditList[.narrator], ["New Narrator"])
        XCTAssertEqual(newFile.performerCreditList[.performer], ["Performer 1", "Performer 2"])
        XCTAssertEqual(newFile.involvementCreditsList[.arranger], ["New Arranger"])
        XCTAssertEqual(newFile.involvementCreditsList[.artDirection], ["New Art Director"])
        XCTAssertEqual(newFile.involvementCreditsList[.composer], ["New Composer"])
        XCTAssertEqual(newFile.involvementCreditsList[.conductor], ["New Conductor"])
        XCTAssertEqual(newFile.involvementCreditsList[.director], ["New Director"])
        XCTAssertEqual(newFile.involvementCreditsList[.executiveProducer], ["New Exec Producer"])
        XCTAssertEqual(newFile.involvementCreditsList[.lyricist], ["New Lyricist"])
        XCTAssertEqual(newFile.involvementCreditsList[.producer], ["New Producer"])
        XCTAssertEqual(newFile.involvementCreditsList[.publisher], ["New Publisher"])
        XCTAssertEqual(newFile.involvementCreditsList[.soundEngineer], ["New Sound Engineer"])
        XCTAssertEqual(newFile.involvementCreditsList[.writer], ["Writer 1", "Writer 2"])
        XCTAssertEqual(newFile.artist, "New Artist")
        XCTAssertEqual(newFile.soloist, "New Soloist")
        XCTAssertEqual(newFile.narrator, "New Narrator")
        XCTAssertEqual(newFile.performers, ["Performer 1", "Performer 2"])
        XCTAssertEqual(newFile.arranger, "New Arranger")
        XCTAssertEqual(newFile.artDirector, "New Art Director")
        XCTAssertEqual(newFile.composer, "New Composer")
        XCTAssertEqual(newFile.conductor, "New Conductor")
        XCTAssertEqual(newFile.executiveProducer, "New Exec Producer")
        XCTAssertEqual(newFile.lyricist, "New Lyricist")
        XCTAssertEqual(newFile.producer, "New Producer")
        XCTAssertEqual(newFile.publisher, "New Publisher")
        XCTAssertEqual(newFile.director, "New Director")
        XCTAssertEqual(newFile.soundEngineer, "New Sound Engineer")
        XCTAssertEqual(newFile.writer, "Writer 1;Writer 2")

        read.performerCreditList = [:]
        read.involvementCreditsList = [:]
        let outputUrl2 = try localDirectory(fileName: "testMp4-ClearList", fileExtension: "m4a")
        try read.write(outputLocation: outputUrl2)
        
        let newFile2 = try AudioFile(location: outputUrl2)
        XCTAssertTrue(newFile2.performerCreditList.isEmpty)
        XCTAssertTrue(newFile2.involvementCreditsList.isEmpty)
        print(newFile2.involvementCreditsList)
        XCTAssertNil(newFile2.performerCreditList[.featuredArtist])
        XCTAssertNil(newFile2.performerCreditList[.soloist])
        XCTAssertNil(newFile2.performerCreditList[.narrator])
        XCTAssertNil(newFile2.performerCreditList[.performer])
        XCTAssertNil(newFile2.involvementCreditsList[.arranger])
        XCTAssertNil(newFile2.involvementCreditsList[.artDirection])
        XCTAssertNil(newFile2.involvementCreditsList[.composer])
        XCTAssertNil(newFile2.involvementCreditsList[.conductor])
        XCTAssertNil(newFile2.involvementCreditsList[.director])
        XCTAssertNil(newFile2.involvementCreditsList[.executiveProducer])
        XCTAssertNil(newFile2.involvementCreditsList[.lyricist])
        XCTAssertNil(newFile2.involvementCreditsList[.producer])
        XCTAssertNil(newFile2.involvementCreditsList[.publisher])
        XCTAssertNil(newFile2.involvementCreditsList[.soundEngineer])
        XCTAssertNil(newFile2.involvementCreditsList[.writer])
        XCTAssertNil(newFile2.artist)
        XCTAssertNil(newFile2.soloist)
        XCTAssertNil(newFile2.narrator)
        XCTAssertNil(newFile2.performers)
        XCTAssertNil(newFile2.arranger)
        XCTAssertNil(newFile2.artDirector)
        XCTAssertNil(newFile2.composer)
        XCTAssertNil(newFile2.conductor)
        XCTAssertNil(newFile2.director)
        XCTAssertNil(newFile2.executiveProducer)
        XCTAssertNil(newFile2.lyricist)
        XCTAssertNil(newFile2.producer)
        XCTAssertNil(newFile2.publisher)
        XCTAssertNil(newFile2.soundEngineer)
        XCTAssertNil(newFile2.writer)
    }
    
    func testCreditListID3() throws {
        // test read
        var read = try AudioFile(location: mp3v24)
        XCTAssertEqual(read.performerCreditList[.soprano], ["Soprano Name"])
        XCTAssertEqual(read.performerCreditList[.alto], ["Alto Name"])
        XCTAssertEqual(read.involvementCreditsList[.actor], ["Actor Name"])
        XCTAssertEqual(read.involvementCreditsList[.actress], ["Actress Name"])

        var write = try AudioFile(location: mp3NoMeta)
        write.performerCreditList[.featuredArtist] = ["New Artist"]
        write.performerCreditList[.soloist] = ["New Soloist"]
        write.performerCreditList[.narrator] = ["New Narrator"]
        write.performerCreditList[.performer] = ["Performer 1", "Performer 2"]
        write.involvementCreditsList[.arranger] = ["New Arranger"]
        write.involvementCreditsList[.artDirection] = ["New Art Director"]
        write.involvementCreditsList[.composer] = ["New Composer"]
        write.involvementCreditsList[.conductor] = ["New Conductor"]
        write.involvementCreditsList[.director] = ["New Director"]
        write.involvementCreditsList[.executiveProducer] = ["New Exec Producer"]
        write.involvementCreditsList[.producer] = ["New Producer"]
        write.involvementCreditsList[.publisher] = ["New Publisher"]
        write.involvementCreditsList[.soundEngineer] = ["New Sound Engineer"]
        write.involvementCreditsList[.writer] = ["Writer 1", "Writer 2"]

        let outputUrl = try localDirectory(fileName: "testMp3-Credits", fileExtension: "mp3")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertEqual(newFile.performerCreditList[.featuredArtist], ["New Artist"])
        XCTAssertEqual(newFile.performerCreditList[.soloist], ["New Soloist"])
        XCTAssertEqual(newFile.performerCreditList[.narrator], ["New Narrator"])
        XCTAssertEqual(newFile.performerCreditList[.performer], ["Performer 1", "Performer 2"])
        XCTAssertEqual(newFile.involvementCreditsList[.arranger], ["New Arranger"])
        XCTAssertEqual(newFile.involvementCreditsList[.artDirection], ["New Art Director"])
        XCTAssertEqual(newFile.involvementCreditsList[.composer], ["New Composer"])
        XCTAssertEqual(newFile.involvementCreditsList[.conductor], ["New Conductor"])
        XCTAssertEqual(newFile.involvementCreditsList[.director], ["New Director"])
        XCTAssertEqual(newFile.involvementCreditsList[.executiveProducer], ["New Exec Producer"])
        XCTAssertEqual(newFile.involvementCreditsList[.producer], ["New Producer"])
        XCTAssertEqual(newFile.involvementCreditsList[.publisher], ["New Publisher"])
        XCTAssertEqual(newFile.involvementCreditsList[.soundEngineer], ["New Sound Engineer"])
        XCTAssertEqual(newFile.involvementCreditsList[.writer], ["Writer 1", "Writer 2"])

        read.performerCreditList = [:]
        read.involvementCreditsList = [:]
        let outputUrl2 = try localDirectory(fileName: "testMp3-ClearList", fileExtension: "mp3")
        try read.write(outputLocation: outputUrl2)
        
        let newFile2 = try AudioFile(location: outputUrl2)
        XCTAssertTrue(newFile2.performerCreditList.isEmpty)
        XCTAssertTrue(newFile2.involvementCreditsList.isEmpty)
        XCTAssertNil(newFile2.performerCreditList[.featuredArtist])
        XCTAssertNil(newFile2.performerCreditList[.soloist])
        XCTAssertNil(newFile2.performerCreditList[.narrator])
        XCTAssertNil(newFile2.performerCreditList[.performer])
        XCTAssertNil(newFile2.involvementCreditsList[.arranger])
        XCTAssertNil(newFile2.involvementCreditsList[.artDirection])
        XCTAssertNil(newFile2.involvementCreditsList[.composer])
        XCTAssertNil(newFile2.involvementCreditsList[.conductor])
        XCTAssertNil(newFile2.involvementCreditsList[.director])
        XCTAssertNil(newFile2.involvementCreditsList[.executiveProducer])
        XCTAssertNil(newFile2.involvementCreditsList[.lyricist])
        XCTAssertNil(newFile2.involvementCreditsList[.producer])
        XCTAssertNil(newFile2.involvementCreditsList[.publisher])
        XCTAssertNil(newFile2.involvementCreditsList[.soundEngineer])
        XCTAssertNil(newFile2.involvementCreditsList[.writer])
    }
}
