//
//  CGRectExtensions.swift
//  EasyTypeShared
//
//  Created by Rastislav Mirek on 24/10/14.
//  Copyright (c) 2014 Rastislav Mirek. All rights reserved.
//

import Foundation

extension CGRect {

    init(original: CGRect) {
        self.init(origin: original.origin, size: original.size)
    }

    init(origin: CGPoint, size: CGSize) {
        self.origin = origin
        self.size = size
    }

    var x: CGFloat {
        get {
            return origin.x
        }
        set (value){
            origin.x = value
        }
    }

    var y: CGFloat {
        get {
            return origin.y
        }
        set (value){
            origin.y = value
        }
    }

    var width: CGFloat {
        get {
            return size.width
        }
        set (value) {
            size.width = value
        }
    }

    var height: CGFloat {
        get {
            return size.height
        }
        set (value) {
            size.height = value
        }
    }

    var topRight: CGPoint {
        return CGPointMake(x + width, y)
    }

    var topLeft: CGPoint {
        return origin
    }

    var bottomRight: CGPoint {
        return CGPointMake(x + width, y + height)
    }

    var bottomLeft: CGPoint {
        return CGPointMake(x, y + height)
    }

    var centre: CGPoint {
        get {
            return CGPointMake(x + width / 2, y + height / 2)
        }
        set (value) {
            origin = CGPoint(x: value.x - size.width / 2, y: value.y - size.height / 2)
        }
    }

    func rectWithTopEdge(topEdge: CGFloat) -> CGRect {
        return rectBySizingTop(y - topEdge)
    }

    func rectWithRightEdge(rightEdge: CGFloat) -> CGRect {
        return rectBySizingRight(rightEdge - self.maxX)
    }

    func rectWithBottomEdge(bottomEdge: CGFloat) -> CGRect {
        return rectBySizingBottom(bottomEdge - self.maxY)
    }

    func rectWithLeftEdge(leftEdge: CGFloat) -> CGRect {
        return rectBySizingLeft(x - leftEdge)
    }

    func rectWithZeroOrigin() -> CGRect {
        return self - origin
    }

    func rectWithOrigin(newOrigin: CGPoint) {

    }

    func rectWithCentre(newCentre: CGPoint) -> CGRect {
        var rect = CGRect(original: self)
        rect.centre = newCentre
        return rect
    }

    func rectBySizingTop(extendBy: CGFloat) -> CGRect {
        return self.rectByInsetting(top: -extendBy, left: 0, bottom: 0, right: 0)
    }

    mutating func sizeTop(extendBy: CGFloat) {
        inset(top: -extendBy, left: 0, bottom: 0, right: 0)
    }

    func rectBySizingBottom(extendBy: CGFloat) -> CGRect {
        return self.rectByInsetting(top: 0, left: 0, bottom: -extendBy, right: 0)
    }

    mutating func sizeBottom(extendBy: CGFloat) {
        height += extendBy
    }

    func rectBySizingLeft(extendBy: CGFloat) -> CGRect {
        return self.rectByInsetting(top: 0, left: -extendBy, bottom: 0, right: 0)
    }

    mutating func sizeLeft(extendBy: CGFloat) {
        inset(top: 0, left: -extendBy, bottom: 0, right: 0)
    }

    func rectBySizingRight(extendBy: CGFloat) -> CGRect {
        return self.rectByInsetting(top: 0, left: 0, bottom: 0, right: -extendBy)
    }

    mutating func sizeRight(extendBy: CGFloat) {
        width += extendBy
    }

    func rectByInsetting(edgeInsets: UIEdgeInsets) -> CGRect {
        return UIEdgeInsetsInsetRect(self, edgeInsets)
    }

    func rectByInsetting(#top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> CGRect {
        return rectByInsetting(UIEdgeInsetsMake(top, left, bottom, right))
    }

    mutating func inset(#top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        x += left
        y += top
        width -= left + right
        height -= top + bottom
    }

    func rectByInsetting(#top: Double, left: Double, bottom: Double, right: Double) -> CGRect {
        return rectByInsetting(top: CGFloat(top), left: CGFloat(left), bottom: CGFloat(bottom), right: CGFloat(right))
    }

    func rectByInsetting(colapseBy: CGFloat) -> CGRect {
        return rectByInsetting(top: colapseBy, left: colapseBy, bottom: colapseBy, right: colapseBy)
    }

    func rectByOffsetting(vectorPoint: CGPoint) -> CGRect {
        return self.rectByOffsetting(dx: vectorPoint.x, dy: vectorPoint.y)
    }

    mutating func offset(vector: CGPoint) {
        x += vector.x
        y += vector.y
    }

    func hasOvelappingArea(withRect: CGRect) -> Bool {
        return maxX > withRect.minX && minX < withRect.maxX && maxY > withRect.minY && minY < withRect.maxY
    }
}

func -(left: CGRect, right: CGPoint) -> CGRect {
    return left.rectByOffsetting(-right)
}

func +(left: CGRect, right: CGPoint) -> CGRect {
    return left.rectByOffsetting(right)
}
