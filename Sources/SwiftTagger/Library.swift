//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/15/20.
//

import Foundation
import SwiftTaggerMP4
import SwiftTaggerID3

@available(OSX 10.13, *)
enum Library {
    case SwiftTaggerMP4
    case SwiftTaggerID3
    
    init?(from fileUrl: URL) throws {
        let validMp4Extensions = ["mp4", "m4a", "m4b", "aac", "m4r", "m4p", "aax"]
        
        if fileUrl .pathExtension.lowercased() == "mp3" {
            self = .SwiftTaggerID3
        } else if validMp4Extensions.contains(fileUrl.pathExtension.lowercased()) {
            self = .SwiftTaggerMP4
        } else {
            throw AudioFile.Error.InvalidAudioFile
        }
    }
}

