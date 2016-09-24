//
// This file (and all other Swift source files in the Sources directory of this playground) will be precompiled into a framework which is automatically made available to gengine.playground.
//

import Cocoa

// Defining the + and - operators between two CGPoint -
// makes it more conveneint to add and subtract them in the game engine

func + (l: CGPoint, r: CGPoint) -> CGPoint {
    return CGPoint(x: l.x+r.x, y: l.y+r.y)
}

func - (l: CGPoint, r: CGPoint) -> CGPoint {
    return CGPoint(x: l.x-r.x, y: l.y-r.y)
}
