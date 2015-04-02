//
//  CGPointExtensions.swift
//  EasyTypeShared
//
//  Created by Rastislav Mirek on 30/10/14.
//  Copyright (c) 2014 Rastislav Mirek. All rights reserved.
//

import Foundation
import UIKit

extension CGPoint {

    var distanceToOrigin: CGFloat {
        return self.distanceTo(CGPointZero)
    }

    func distanceTo(other: CGPoint) -> CGFloat {
        let xDist = x - other.x
        let yDist = y - other.y
        return sqrt(xDist * xDist + yDist * yDist)
    }

    func pointByOffsetting(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: x + dx, y: y + dy)
    }
}

func +(left: CGPoint, right: CGPoint) -> CGPoint {
    return left.pointByOffsetting(right.x, dy: right.y)
}

prefix func -(point: CGPoint) -> CGPoint {
    return CGPointZero - point
}

func -(left: CGPoint, right: CGPoint) -> CGPoint {
    return left.pointByOffsetting(-right.x, dy: -right.y)
}

func *(point: CGPoint, multiplier: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * multiplier, y: point.y * multiplier)
}

func *(point: CGPoint, multiplier: Int) -> CGPoint {
    return CGPoint(x: point.x * multiplier, y: point.y * multiplier)
}

func /(point: CGPoint, divider: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / divider, y: point.y / divider)
}

func /(point: CGPoint, divider: Int) -> CGPoint {
    return CGPoint(x: point.x / divider, y: point.y / divider)
}

func +=(inout target: CGPoint, addend: CGPoint) {
    target = target + addend
}

func -=(inout target: CGPoint, subtrahend: CGPoint) {
    target = target - subtrahend
}

func *=(inout target: CGPoint, multiplier: CGFloat) {
    target = target * multiplier
}

func /=(inout target: CGPoint, divisor: CGFloat) {
    target = target / divisor
}

func /=(inout target: CGPoint, divisor: Int) {
    target = target / divisor
}



