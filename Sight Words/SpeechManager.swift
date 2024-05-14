//
//  SpeechManager.swift
//  Sight Words
//
//  Created by Matthew Young on 5/14/24.
//

import Foundation
import AVFoundation

class SpeechManager {
    let speechSynthesizer = AVSpeechSynthesizer()

    func speak(_ text: String) {
        // Configure speech utterance
        let speechUtterance = AVSpeechUtterance(string: text)
        speechUtterance.rate = AVSpeechUtteranceDefaultSpeechRate // Adjust the speech rate
        speechUtterance.volume = 1.0 // Adjust the speech volume (0.0 to 1.0)
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US") // Specify the language

        // Speak the text
        speechSynthesizer.speak(speechUtterance)
    }
}
