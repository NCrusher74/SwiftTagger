//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/15/20.
//

import Foundation

@available(OSX 10.13, *)
extension AudioFile {
    
    public enum Error: Swift.Error {
        /// Error thrown when audio file does not have a recognized extension
        case InvalidAudioFile
    }
}
