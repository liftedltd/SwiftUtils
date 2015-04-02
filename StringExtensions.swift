//
//  String+Length.swift
//  EasyTypeShared
//
//  Created by Rastislav Mirek on 18/10/14.
//  Copyright (c) 2014 Rastislav Mirek. All rights reserved.
//

private let emptyString = ""
private let newLineString = "\n"

extension String {
    var length: Int {
        return countElements(self)
    }

    static var empty: String {
        return emptyString
    }

    static var newLine: String {
        return newLineString
    }

    func asCharArray() -> [Character] {
        return Array(self)
    }

    func containsCharFromSet(charset: NSCharacterSet) -> Bool {
        return self.rangeOfCharacterFromSet(charset) != nil
    }

    func trimBeginingToLength(targetLength: Int) -> String {
        assert(targetLength >= 0, "targetLength must be positive")
        if self.isEmpty || targetLength == 0 {
            return String.empty
        }
        return self.substringFromIndex(advance(self.endIndex, -targetLength, self.startIndex))
    }

    subscript(range: Range<Int>) -> String {
        return substringFromIndex(range.startIndex, toIndex: range.endIndex + 1)
    }

    func substringFromIndex(startIndex: Int, toIndex endIndex: Int) -> String {
        if endIndex < 0 {
            NSException(name: NSInvalidArgumentException, reason: "toIndex must be greater or equal 0", userInfo: nil).raise()
        }
        if startIndex > endIndex {
            NSException(name: NSInvalidArgumentException, reason: "toIndex must be greater or equal to startIndex", userInfo: nil).raise()
        }
        return substringFromIndex(startIndex, withLength: endIndex - startIndex)
    }

    func substringFromIndex(startIndex: Int, withLength length: Int) -> String {
        if startIndex < 0 {
            NSException(name: NSInvalidArgumentException, reason: "startIndex must be greater or equal 0", userInfo: nil).raise()
        }
        if length < 0 {
            NSException(name: NSInvalidArgumentException, reason: "withLength must be greater or equal 0", userInfo: nil).raise()
        }
        var s: NSString = ""
        let start = advance(self.startIndex, startIndex)
        let end = advance(start, length)
        return substringWithRange(Range<String.Index>(start: start, end: end))
    }

    /// Has linear complexity
    subscript(letterIndex: Int) -> Character {
        return self[advance(self.startIndex, letterIndex)]
    }

    func makeReversedCharsSequence() -> SequenceOf<Character> {
        return SequenceOf<Character> {() -> GeneratorOf<Character> in
            var index = self.endIndex
            return GeneratorOf<Character> { () in
                if index == self.startIndex {
                    return nil
                }
                index = index.predecessor()
                return self[index]
            }
        }
    }
}
