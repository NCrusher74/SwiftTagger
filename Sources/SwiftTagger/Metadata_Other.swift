//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/23/20.
//

import Foundation
import Cocoa
import SwiftTaggerID3
import SwiftTaggerMP4

@available(OSX 10.13, *)
extension AudioFile {
    public func getCoverArt() throws -> NSImage? {
        switch library {
            case .mp4:
                return try mp4Tag.getCoverArt()
            case .id3:
                return id3Tag.coverArt
        }
    }
    
    public mutating func setCoverArt(from url: URL) throws {
        switch library {
            case .mp4:
                try mp4Tag.setCoverArt(url: url)
            case .id3:
                if let image = NSImage(contentsOf: url) {
                    id3Tag.coverArt = image
            }
        }
    }
    
    public mutating func removeCoverArt() throws {
        switch library {
            case .mp4:
                try mp4Tag.removeCoverArt()
            case .id3:
                id3Tag.coverArt = nil
        }
    }
}
