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
