//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/18/20.
//

import Foundation

@available(OSX 10.13, *)
enum MetadataID_StringArray: CaseIterable {
    case arrangerKeywords // array 1
    case artistKeywords // array 2
    case composerKeywords // array 3
    case performers
    case podcastKeywords // array 4
    case producerKeywords // array 5
    case songwriterKeywords // array 6
    case subtitleKeywords // array 7
    case titleKeywords // array 8
    
    var metadataItem: MetadataItem {
        switch self {
            case .arrangerKeywords: return .arrangerKeywords
            case .artistKeywords: return .artistKeywords
            case .composerKeywords: return .composerKeywords
            case .podcastKeywords: return .podcastKeywords
            case .producerKeywords: return .producerKeywords
            case .songwriterKeywords: return .songwriterKeywords
            case .subtitleKeywords: return .subtitleKeywords
            case .titleKeywords: return .titleKeywords
            case .performers: return .performers
        }
    }
}

@available(OSX 10.13, *)
extension AudioFile {
    /// Accesses the MP4 atom `\u{00A9}ark`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a user-defined text (`TXXX`) frame with the descriptor `ArrangerKeywords`
    ///
    /// This frame/atom will be written to file as a string with `; ` separating the elements of the array. i.e. "Keyword1; Keyword2; Keyword3"
    public var arrangerKeywords: [String]? {
        get {
            if let array = self.get(.arrangerKeywords) {
                return array
            } else {
                return nil
            }
        }
        set {
            if let new = newValue {
                set(.arrangerKeywords, arrayValue: new)
            } else {
                set(.arrangerKeywords, arrayValue: nil)
            }
        }
    }
    
    /// Accesses the MP4 atom `\u{00A9}prk`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a user-defined text (`TXXX`) frame with the descriptor `ArtistKeywords`
    ///
    /// This frame/atom will be written to file as a string with `; ` separating the elements of the array. i.e. "Keyword1; Keyword2; Keyword3"
    public var artistKeywords: [String]? {
        get {
            if let array = self.get(.artistKeywords) {
                return array
            } else {
                return nil
            }
        }
        set {
            if let new = newValue {
                set(.artistKeywords, arrayValue: new)
            } else {
                set(.artistKeywords, arrayValue: nil)
            }
        }
    }

    /// Accesses the MP4 atom `\u{00A9}cok`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a user-defined text (`TXXX`) frame with the descriptor `ComposerKeywords`
    ///
    /// This frame/atom will be written to file as a string with `; ` separating the elements of the array. i.e. "Keyword1; Keyword2; Keyword3"
    public var composerKeywords: [String]? {
        get {
            if let array = self.get(.composerKeywords) {
                return array
            } else {
                return nil
            }
        }
        set {
            if let new = newValue {
                set(.composerKeywords, arrayValue: new)
            } else {
                set(.composerKeywords, arrayValue: nil)
            }
        }
    }

    /// Accesses the MP4 atom `\u{00A9}prf`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set an entry in the `TMCL` (musician credit list) frame with the role `performer`
    public var performers: [String]? {
        get {
            if let array = self.get(.performers) {
                return array
            } else {
                return nil
            }
        }
        set {
            if let new = newValue {
                set(.performers, arrayValue: new)
            } else {
                set(.performers, arrayValue: nil)
            }
        }
    }

    /// Accesses the MP4 atom `keyw` or the ID3 frame `TKWD`
    public var podcastKeywords: [String]? {
        get {
            if let array = self.get(.podcastKeywords) {
                return array
            } else {
                return nil
            }
        }
        set {
            if let new = newValue {
                set(.podcastKeywords, arrayValue: new)
            } else {
                set(.podcastKeywords, arrayValue: nil)
            }
        }
    }

    /// Accesses the MP4 atom `\u{00A9}pdk`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a user-defined text (`TXXX`) frame with the descriptor `ProducerKeywords`
    ///
    /// This frame/atom will be written to file as a string with `; ` separating the elements of the array. i.e. "Keyword1; Keyword2; Keyword3"
    public var producerKeywords: [String]? {
        get {
            if let array = self.get(.producerKeywords) {
                return array
            } else {
                return nil
            }
        }
        set {
            if let new = newValue {
                set(.producerKeywords, arrayValue: new)
            } else {
                set(.producerKeywords, arrayValue: nil)
            }
        }
    }

    /// Accesses the MP4 atom `\u{00A9}swk`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a user-defined text (`TXXX`) frame with the descriptor `SongwriterKeywords`
    ///
    /// This frame/atom will be written to file as a string with `; ` separating the elements of the array. i.e. "Keyword1; Keyword2; Keyword3"
    public var songwriterKeywords: [String]? {
        get {
            if let array = self.get(.songwriterKeywords) {
                return array
            } else {
                return nil
            }
        }
        set {
            if let new = newValue {
                set(.songwriterKeywords, arrayValue: new)
            } else {
                set(.songwriterKeywords, arrayValue: nil)
            }
        }
    }

    /// Accesses the MP4 atom `\u{00A9}snk`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a user-defined text (`TXXX`) frame with the descriptor `SubtitleKeywords`
    ///
    /// This frame/atom will be written to file as a string with `; ` separating the elements of the array. i.e. "Keyword1; Keyword2; Keyword3"
    public var subtitleKeywords: [String]? {
        get {
            if let array = self.get(.subtitleKeywords) {
                return array
            } else {
                return nil
            }
        }
        set {
            if let new = newValue {
                set(.subtitleKeywords, arrayValue: new)
            } else {
                set(.subtitleKeywords, arrayValue: nil)
            }
        }
    }

    /// Accesses the MP4 atom `\u{00A9}nak`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will get and set a user-defined text (`TXXX`) frame with the descriptor `TitleKeywords`
    ///
    /// This frame/atom will be written to file as a string with `; ` separating the elements of the array. i.e. "Keyword1; Keyword2; Keyword3"
    public var titleKeywords: [String]? {
        get {
            if let array = self.get(.titleKeywords) {
                return array
            } else {
                return nil
            }
        }
        set {
            if let new = newValue {
                set(.titleKeywords, arrayValue: new)
            } else {
                set(.titleKeywords, arrayValue: nil)
            }
        }
    }
}
