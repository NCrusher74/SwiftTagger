//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/18/20.
//

import Foundation

@available(OSX 10.13, *)
enum MetadataID_Bool: CaseIterable {
    case compilation
    case gaplessPlayback
    case podcast
    case showWork
    
    var metadataItem: MetadataItem {
        switch self {
            case .compilation: return .compilation
            case .gaplessPlayback: return .gaplessPlayback
            case .podcast: return .podcast
            case .showWork: return .showWork
        }
    }
}

@available(OSX 10.13, *)
extension AudioFile {
    /// MP4 atom: `cpil`, ID3 frame `TCMP`
    public var compilation: Bool? {
        get {
            if let value = self.get(.compilation) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.compilation, boolValue: newValue)
        }
    }

    /// MP4 atom: `pgap`.
    ///
    /// There is no equivalent ID3 frame, so true will see the ID3 frame `TDLY` (playlistDelay) to 0. If another value for playlistDelay is desired, use the `playlistDelay` accessor
    public var gaplessPlayback: Bool? {
        get {
            if let value = self.get(.gaplessPlayback) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.gaplessPlayback, boolValue: newValue)
        }
    }

    /// MP4 atom `pcst`.
    ///
    /// ID3 has an equivalent frame, but setting it breaks other apps reading the audio file, so this accessor does nothing for ID3.
    public var podcast: Bool? {
        get {
            if let value = self.get(.podcast) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.podcast, boolValue: newValue)
        }
    }

    /// MP4 atom `shwm`.
    ///
    /// There is no equivalent ID3 frame, so a `TXXX` frame with the description `ShowWork` will be created with an integer value reflecting `1` for true or `0` for false. Most other apps will not recognize this frame.
    public var showWork: Bool? {
        get {
            if let value = self.get(.showWork) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.showWork, boolValue: newValue)
        }
    }
}
