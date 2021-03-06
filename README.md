# SwiftTagger

### If you find this library helpful, please consider [donating](https://paypal.me/NCrusher74)

SwiftTagger combines the `SwiftTaggerMP4` and `SwiftTaggerID3` libraries into a comprehensive audio file tagging and chaptering library, including bridging the gaps where a tag exists in `ID3` but not for `Mp4` and vice versa.

You can find `SwiftTaggerMP4` [here:](https://github.com/NCrusher74/SwiftTaggerMP4)
You can find `SwiftTaggerID3` [here:](https://github.com/NCrusher74/SwiftTaggerID3)

## Usage

Add dependency to your `package.swift` manifest:

```swift
let package = Package(
    name: "YourMetadataEditor",
    dependencies: [
        .package(
            name: "SwiftTagger",
            url: "https://github.com/NCrusher74/SwiftTagger",
            from: "1.0.0"
        ),
    ],
    targets: [
        .target(
            name: "YourMetadataEditor",
                dependencies: [
                    .product(name: "SwiftTaggerID3", package: "SwiftTagger"),
                    .product(name: "SwiftTaggerMP4", package: "SwiftTagger"),
                ]
        )
    ]
)
```

*Reading metadata*:
```swift
let source = try AudioFile(location: file.url)

print(source.album)
print(source.artist)
print(source.trackNumber.track)
print(source.trackNumber.totalTracks)
print(source["FreeformTag"]) // prints freeform tag with the descriptor "FreeformTag"
print(source.involvementCreditsList[.accounting])
print(source.musicianCreditsList[.actor])
```

*Editing metadata*:
```swift
var source = try AudioFile(location: file.url)

source.album = "New Album Title"
source.artist = "New Artist"
source.trackNumber.track = 3
source.trackNumber.totalTracks = 17
source.compilation = true
source.titleKeywords = ["Title", "Keywords"]

// adding credits list tags - edits TIPL frame for ID3, or creates a freeform atom for the involvement role for MP4
source.involvementCreditsList[.adaptation] = "Involved Person"

// edits TMCL frame for ID3, or adds performer name to performers tag for MP4
source.musicianCreditsList[.actress] = "Actress Name"

// adding freeform tags
source["MyFreeformTagDescription"] = "New Tag Content" // works for ID3 or MP4

// Only works for ID3, as MP4 only allows one comment atom and one lyrics atom
source.id3Tag[comment: "MyCommentDescription", .eng] = "New Comment in English"
source.id3Tag[lyrics: "My Lyrics Description", .eng] = "New Lyrics in English"
source.id3Tag[userDefinedUrl: "My Custom URL"] = "http://url.com"
```

*Reading Chapter Data*:
```swift
let source = try AudioFile(location: file.url)

for chapter in source.chapterList {
    print(chapter)
}

// (startTime is in milliseconds)
// (startTime: 0, title: "Chapter 1")
// (startTime: 10000, title: "Chapter 2")
// (startTime: 25000, title: "Chapter 3")
// (startTime: 43000, title: "Chapter 4")
// (startTime: 64000, title: "Chapter 5")
// (startTime: 81000, title: "Chapter 6")
```

*Editing Chapter Data*:
```swift
var source = try AudioFile(location: file.url)

try source.removeAllChapters()

// or

source.removeChapter(startTime: 64000) // removes chapter at startTime 64000
source.addChapter(at: 95000, title: "Chapter 7")

// To edit the title of an existing chapter, add a chapter at the same startTime with a different title.
// To edit the startTime of an existing chapter, remove the old chapter and create a new one
```

*Writing the new file*:
```swift
var source = try AudioFile(location: file.url)

source.album = "New Album Title"
source.artist = "New Artist"
source.trackNumber.track = 3
source.trackNumber.totalTracks = 17
source.compilation = true
source.addChapter(at: 95000, title: "Chapter 7")

try source.write(outputLocation: output.url)
```

### Handled metadata items:
*If a frame is specified but not an atom (or vice versa) it is because the item exists for ID3 but not for MP4. Instead, a freeform atom or user-defined text frame will be created for it.*

**A-C**
*  `acknowledgment`: (MP4 atom: `©cak`)
*  `album`: (MP4 atom: `©alb` - ID3 frame: `TALB`)
*  `albumID`: (MP4 atom: `akID`)
*  `albumArtist`: (MP4 atom: `aART` - ID3 frame: `TPE2`)
*  `albumArtistSort`: (MP4 atom: `soaa` - ID3 frame: `TSO2`)
*  `albumSort`: (MP4 atom: `soal` - ID3 frame: `TSOA`)
*  `appleStoreCountryID`: (MP4 atom: `sfID`)
*  `arranger`: (MP4 atom: `©arg` - ID3 frame: `TPE4`)
*  `arrangerKeywords`: (MP4 atom: `©ark`)
*  `artDirector`: (MP4 atom: `©ard`)
*  `artist`: (MP4 atom: `©ART` - ID3 frame: `TPE1`)
*  `artistID`: (MP4 atom: `atID`)
*  `artistKeywords`: (MP4 atom: `©prk`)
*  `artistSort`: (MP4 atom: `soar` - ID3 frame: `TSOP`)
*  `artistWebpage`: (MP4 atom: `©prl` - ID3 frame: `WOAR`)
*  `audioFileWebpage`: (ID3 frame: `WOAF`)
*  `audioSourceWebpage`: (ID3 frame: `WOAS`)
*  `bpm`: (MP4 atom: `tmpo` - ID3 frame: `TBPM`)
*  `comment`: (MP4 atom: `©cmt` - ID3 frame: `COMM`)
*  `compilation`: (MP4 atom: `cpil` - ID3 frame: `TCMP`)
*  `composer`: (MP4 atom: `©com` - ID3 frame: `TCOM`)
*  `composerID`: (MP4 atom: `cmID`)
*  `composerKeywords`: (MP4 atom: `©cok`)
*  `composerSort`: (MP4 atom: `soco` - ID3 frame: `TSOC`)
*  `conductor`: (MP4 atom: `©con` - ID3 frame: `TPE3`)
*  `conductorID`: (MP4 atom: `cnID`)
*  `contentRating`: (MP4 atom: `iTunEXTC`)
*  `copyright`: (MP4 atom: `cprt` - ID3 frame: `TCOP`)
*  `copyrightWebpage`: (ID3 frame: `WCOP`)
*  `coverArt`: (MP4 atom: `covr` - ID3 frame: `APIC`)

**D-F**
*  `description`: (MP4 atom: `©des`)
*  `director`: (MP4 atom: `©dir`)
*  `discNumber`: (MP4 atom: `disk` - ID3 frame: `TPOS`)
*  `encodedBy`: (MP4 atom: `©enc` - ID3 frame: `TENC`)
*  `encoderSettings`: (MP4 atom: `©too`, ID3 frame: `TSSE`)
*  `encodingDateTime`: (ID3 frame: `TDEN`)
*  `executiveProducer`: (MP4 atom: `©xpd`)

**G-L**
*  `gaplessPlayback`: (MP4 atom: `pgap`)
*  `genreCustom`: (MP4 atom: `©gen` - ID3 frame: `TCON`)
*  `genrePredefined`: (MP4 atom: `genr` - ID3 frame: `TCON`)
*  `genreID`: (MP4 atom: `geID`) (this is a the numeric representation of the genre from `genrePredefined`)
*  `grouping`: (MP4 atom: `©grp` - ID3 frame: `GRP1`)
*  `information`: (MP4 atom: `©inf`)
*  `initialKey`: (ID3 frame: `TKEY`)
*  `involvedPeopleList (aka involvementCreditsList)`: (ID3 frame: `TIPL`) (values for many of the MP4 tags such as director, producer, etc, will create an entry to this list)
*  `isrc`: (MP4 atom: `©isr` - ID3 frame: `TSRC`)
*  `label`: (MP4 atom: `©lab`)
*  `labelWebpage`: (MP4 atom: `©lal`)
*  `languages`: (MP4 atom: `enlg` - ID3 frame: `TLAN`)
*  `length`: (ID3 frame: `TLEN`)
*  `linerNotes`: (MP4 atom: `©lnt`)
*  `longDescription`: (MP4 atom: `ldes`)
*  `lyricist`: (MP4 atom: `©aut` - ID3 frame: `TEXT`)
*  `lyrics`: (MP4 atom: `©lyr` - ID3 frame: `USLT`)

**M-N**
*  `mediaKind`: (MP4 atom: `stik`)
*  `mood`: (ID3 frame: `TMOO`)
*  `movement`: (MP4 atom: `©mvn` - ID3 frame: `MVNM`)
*  `movementCount`: (MP4 atom: `©mvc` - ID3 frame: `MVCN`)
*  `movementNumber`: (MP4 atom: `©mvi` - ID3 frame: `MVIN`)
*  `musicianCreditsList (aka musicianCreditsList)`: (ID3 frame: `TMCL`)
*  `narrator`: (MP4 atom: `©nrt`)
*  `originalAlbum`: (ID3 frame: `TOAL`)
*  `originalArtist`: (MP4 atom: `©ope` - ID3 frame: `TOPE`)
*  `originalFilename`: (ID3 frame: `TOFN`)
*  `originalLyricist`: (ID3 frame: `TOLY`)
*  `originalReleaseDateTime`: (ID3 frame: `TDOR`)
*  `owner`: (MP4 atom: `ownr` - ID3 frame: `TOWN`)

**P**
*  `paymentWebpage`: (ID3 frame: `WPAY`)
*  `performers`: (MP4 atom: `©prf`) (values entered here will write the `musicianCreditsList` for ID3)
*  `playlistDelay`: (ID3 frame: `TDLY`)
*  `playlistID`: (MP4 atom: `plID`)
*  `podcast`: (MP4 atom: `pcst`) (this frame exists in ID3, but setting it will cause iTunes not to recognize the audio or metadata, therefore `SwiftTagger` will not set it for ID3)
*  `podcastCategory`: (MP4 atom: `catg` - ID3 frame: `TCAT`)
*  `podcastDescription`: (ID3 frame: `TDES`)
*  `podcastFeed`: (MP4 atom: `purl` - ID3 frame: `WFED`)
*  `podcastID`: (MP4 atom: `egid` - ID3 frame: `TGID`)
*  `podcastKeywords`: (MP4 atom: `keyw` - ID3 frame: `TKWD`)
*  `producer`: (MP4 atom: `©prd`)
*  `producerKeywords`: (MP4 atom: `©pdk`)
*  `publisher`: (MP4 atom: `©pub` - ID3 frame: `TPUB`)
*  `publisherWebpage`: (ID3 frame: `WPUB`)
*  `purchaseDate`: (MP4 atom: `purd`)

**R-S**
*  `radioStation`: (ID3 frame: `TRSN`)
*  `radioStationOwner`: (ID3 frame: `TRSO`)
*  `radioStationWebpage`: (ID3 frame: `WORS`)
*  `rating`: (MP4 atom: `rtng`)
*  `recordCompany`: (MP4 atom: `©mak`)
*  `recordCompanyWebpage`: (MP4 atom: `©mal`)
*  `recordingDateTime`: (MP4 atom: `©day` - ID3 frame: `TDRC`)
*  `recordingCopyright aka Phonogram Rights aka Produced Notice`: (MP4 atom: `©phg`, ID3 frame `TPRO`) 
*  `releaseDateTime`: (MP4 atom: `rldt` - ID3 frame: `TDRL`)
*  `requirements`: (MP4 atom: `©req`)
*  `sellerID`: (MP4 atom: `xid `)
*  `showWorkAndMovement`: (MP4 atom: `shwm`)
*  `soundEngineer`: (MP4 atom: `©sne`)
*  `softwareVersion`: (MP4 atom: `©swr`)
*  `soloist`: (MP4 atom: `©sol`)
*  `songDescription`: (MP4 atom: `desc`)
*  `songwriter`: (MP4 atom: `©swf`)
*  `songwriterKeywords`: (MP4 atom: `©swk`)
*  `sourceCredit`: (MP4 atom: `©src`)
*  `subtitle`: (MP4 atom: `©snm` - ID3 frame: `TIT3`)
*  `subtitleKeywords`: (MP4 atom: `©snk`)

**T-Z**
*  `taggingDateTime`: (ID3 frame: `TDTG`)
*  `title`: (MP4 atom: `©nam` - ID3 frame: `TIT2`)
*  `titleKeywords`: (MP4 atom: `©nak`)
*  `titleSort`: (MP4 atom: `sonm` - ID3 frame: `TSOT`)
*  `thanks`: (MP4 atom: `©thx`)
*  `trackNumber`: (MP4 atom: `trkn` - ID3 frame: `TRCK`)
*  `trackSubtitle (aka setSubtitle)`: (MP4 atom: `©st3` - ID3 frame: `TSST`)
*  `seriesEpisodeNumber`: (MP4 atom: `tves`)
*  `seriesEpisodeTitle`: (MP4 atom: `tven`)
*  `seriesNetworkOrChannel`: (MP4 atom: `tvnn`)
*  `seriesSeason`: (MP4 atom: `tvsn`)
*  `seriesShow`: (MP4 atom: `tvsh`)
*  `seriesDescription`: (MP4 atom: `sdes`)
*  `seriesSort`: (MP4 atom: `sosn`)
*  `website`: (MP4 atom: `©url`)
*  `work`: (MP4 atom: `©wrk` - ID3 frame: `TIT1`)
*  `writer`: (MP4 atom: `©wrt`)
*  `year`: (MP4 atom: `yrrc`) (for ID3, this frame doesn't exist in version 2.4)

### Limitations, spec-noncompliance, and known issues:
`SwiftTagger` tries to stick pretty close to the requirements of the ID3 and MP4 documented specs, but there are a few places where it deviates, either because the spec is silly, or compliance would be more cumbersome to achieve than can be justified by the author's needs, or compliance would make the usage of `SwiftTagger` too convoluted. These deviations are:

* `SwiftTagger` uses ID3 version 2.4 by default. If you require an earlier version, it is recommended that you use `SwiftTaggerID3`, which allows you to specify which version you wish to use.
* The ID3 frames  `TMED` ("MediaType"), and `TFLT` ("File Type") are not implemented in `SwiftTagger`, as there is no equivalent for these tags in MP4 and these frames are very clumsy and difficult to implement. If you require these frames for an ID3 file, using `source.id3Tag` allows you to edit all the metadata that is available in `SwiftTaggerID3`, (though only for version 2.4.)
* The ID3 specs allow for multiple `CTOC` (Table Of Contents) frames. To keep chapter implementation simple, however, `SwiftTagger` only supports a single `CTOC` frame.
* Both ID3 and MP4 allow for the possibility of chapter-specific metadata beyond simply the title (such as chapter images) but this has not been implemented.
* There are a few frames and atoms where the accessor will return a "false positive" if the frame or atom doesn't exist in the file. Typically, this happens in cases where the return is a tuple or array. For example, on a file where there is no `discNumber` atom or frame:
       `file.discNumber.disc = 0 // the frame or atom doesn't exist, but the accessor will return 0 for this value because it's not optional`
       `file.discNumber.totalDiscs = nil`
       `file.discNumber = (0, nil) // not a nil return even though the frame or atom doesn't exist`
       This is done to guarantee that we will be able to create these atoms and frames when they don't exist to begin with, instead of having the accessor fail when a chained optional such as `file.discNumber?.disc` encounters a nil return.
       When working with date frames in ID3, this "false positive" may take the form of a date return of `0001-01-01 00:00:00` (aka `Date.distantPast`) when the frame doesn't exist.
* All date/frames should be formatted using the `ISO8601DateFormatter`

### A note about compatibility
Each tagging library or app handles things slightly differently. Some will parse values of a tag called "recording date" to a field called "release date". Some will write the value for "publisher" to a field called "label" even though there are separate atoms for each of these.

Each one also has its own unique descriptor that it may recognize for a freeform `----` atom or `TXXX` frame fulfilling a certain purpose, while another app uses a different descriptor altogether.

For example:
* While the `initialKey` tag exists for ID3, it doesn't for MP4. Both Yate and Kid3 will create a freeform atom that it will recognize for this tag, but one may use the descriptor "KEY" while the other uses "INITIAL_KEY" or "INITIAL KEY".
* Yate doesn't recognize values written to the MP4 atoms for writer or lyricist (or will return "writer" in the "composer" field) and will create freeform atoms for those instead. 
* Kid3 doesn't recognize metadata written to the MP4 `©isr` atom as being an ISRC value and will list it separately from the ISRC item. 
* Many audiobook handling apps read and write values for `narrator` to the `composer` tag, even though there is a specific `©nrt` tag that Audible uses.

The point being: compatiblity with all other tagging apps and libraries is impossible.

`SwiftTagger` takes a literalist approach to tags whenever there is ambiguity. 

If a tag is called `releaseDate` it's going to write to the frame or atom for `releaseDate` not the frame/atom for `recordingDate`. If desired, which frame or atom `SwiftTagger` writes to can be adjusted in the accessor for that frame/atom.

If you wanted `recordingDate` to write to the `releaseDate` atom, or vice versa, you would change this in `Accessors.R-S.swift`:
```
public var recordingDateTime: Date? {
    get {
        switch library {
            case .id3: return id3Tag.recordingDateTime
            case .mp4: return mp4Tag.recordingDate
        }
    }
    set {
        switch library {
            case .id3: id3Tag.recordingDateTime = newValue
            case .mp4: mp4Tag.recordingDate = newValue
        }
    }
}
```

to this:
```
public var recordingDateTime: Date? {
    get {
        switch library {
            case .id3: return id3Tag.releaseDateTime
            case .mp4: return mp4Tag.releaseDate
        }
    }
    set {
        switch library {
            case .id3: id3Tag.releaseDateTime = newValue
            case .mp4: mp4Tag.releasegDate = newValue
        }
    }
}
```

If you wanted the MP4 freeform atom for `initialKey` to have a different descriptor, you would edit the "Initial Key" string in the `initialKey` accessor  `Accessors.E-I.swift`:
```
public var initialKey: KeySignature? {
    get {
        switch library {
            case .id3: return id3Tag.initialKey
            case .mp4:
                if let string = mp4Tag["Initial key"] { // <- edit this string to the desired descriptor
                    return KeySignature(rawValue: string)
                } else {
                    return nil
            }
        }
    }
    set {
        switch library {
            case .id3: id3Tag.initialKey = newValue
            case .mp4: mp4Tag["Initial key"] = newValue?.rawValue // <- edit this to the desired descriptor
        }
    }
}
```
("Initial key" was chosen for this particular value because that is the string used in MediaInfo for the ID3 tag, so using it as the freeform descriptor for MP4 means the result looks identical to ID3 in MediaInfo. When in doubt, the author tends to default to compatibility with MediaInfo, as it's a widely used and recognized resource.)
