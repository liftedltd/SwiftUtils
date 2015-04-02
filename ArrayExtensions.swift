//
//  ArrayExtensions.swift
//  EasyTypeShared
//
//  Created by Rastislav Mirek on 17/11/14.
//  Copyright (c) 2014 Rastislav Mirek. All rights reserved.
//

extension Array {

    //not used nor tested - move to library project
    mutating func remove(item: T, areEqual: (T, T) -> Bool) {
        for var i = 0; i < count; i++ {
            if areEqual(item, self[i]) {
                self.removeAtIndex(i)
                return
            }
        }
    }

    func indexOf(test: T -> Bool) -> Int? {
        for var i = 0; i < count; i++ {
            if test(self[i]) {
                return i
            }
        }
        return nil
    }

    subscript(index: Int?) -> T? {
        if index == nil {
            return nil
        }
        return self[index!] as T
    }
}
