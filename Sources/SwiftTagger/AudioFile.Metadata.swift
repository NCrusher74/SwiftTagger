//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/17/20.
//

import Foundation
import SwiftTaggerID3
import SwiftTaggerMP4

@available(OSX 10.13, *)
extension AudioFile {
    public var listMetadata: [(metadataID: MetadataItem, value: Any)] {
        var entries = [(MetadataItem, Any)]()
        if self.library == .mp4 {
            let tag = mp4Tag
            for item in tag.metadata {
                if let id = MetadataItem(from: item.identifier) {
                    let value = item.value
                    let entry = (id, value)
                    entries.append(entry)
                }
            }
        } else {
            let tag = id3Tag
            for item in tag.listMetadata() {
                if let id = MetadataItem(from: item.frameKey) {
                    let value = item.value
                    let entry = (id, value)
                    entries.append(entry)
                }
            }
        }
        return entries
    }
    

}
