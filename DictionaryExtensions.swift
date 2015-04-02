//
//  DictionaryExtensions.swift
//  EasyTypeShared
//
//  Created by Rastislav Mirek on 11/11/14.
//  Copyright (c) 2014 Rastislav Mirek. All rights reserved.
//

extension Dictionary {
    func containsKey(key: Key) -> Bool {
        return self[key] != nil
    }

    init(dictionary: Dictionary<Key, Value>) {
        self.init(minimumCapacity: dictionary.count)
        addEntriesFromDictionary(dictionary)
    }

    mutating func addEntriesFromDictionary(dictionary: Dictionary<Key, Value>) {
        for (key, value) in dictionary {
            self[key] = value
        }
    }

    func dictionaryByAddingEntiesFromDictionary(dictionary: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
        var selfCopy = Dictionary(dictionary: self)
        selfCopy.addEntriesFromDictionary(dictionary)
        return selfCopy
    }

    mutating func removeKeys<KeysSequenceType: SequenceType where KeysSequenceType.Generator.Element == Key>(keysToRemove: KeysSequenceType) -> Int {
        var removedCount = 0
        var generator = keysToRemove.generate()
        while let key: Key = generator.next() {
            if self.removeValueForKey(key) != nil {
                removedCount++
            }
        }
        return removedCount
    }
}
