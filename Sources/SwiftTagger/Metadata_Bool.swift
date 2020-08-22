//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/18/20.
//

import Foundation

@available(OSX 10.13, *)
enum MetadataID_Bool: CaseIterable {
    case compilation // bool 1
    case gaplessPlayback // bool 2
    case podcast // bool 3
    case showWorkAndMovement // bool 4
    
    var metadataItem: MetadataItem {
        switch self {
            case .compilation: return .compilation
            case .gaplessPlayback: return .gaplessPlayback
            case .podcast: return .podcast
            case .showWorkAndMovement: return .showWorkAndMovement
        }
    }
}

@available(OSX 10.13, *)
extension AudioFile {
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

    public var showWorkAndMovement: Bool? {
        get {
            if let value = self.get(.showWorkAndMovement) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.showWorkAndMovement, boolValue: newValue)
        }
    }
}
