//
//  main.swift
//  prog1.1
//
//  Created by Benjaman Dutton on 7/13/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation

func emojicode(word: String) -> String {
    switch word.lowercaseString {
        case "beer":
        return "\u{1F37A}"
        case "television","tv":
        return "\u{1F4FA}"
    default:
        return word
    }
}

func emojiate(str: String) ->String {
    var word: String = ""
    var result: String = ""
    
    for char: Character in str.characters {
        if(String(char) >= "A" && String(char) <= "z"){
            word.append(char)
        }else {
            result += emojicode(word)
            result.append(char)
            word = ""
        }
    }
    result += emojicode(word)
    return result
}

let myString = "No TV and no beer make Homer something something."

let emojiString = emojiate(myString);

print(emojiString)