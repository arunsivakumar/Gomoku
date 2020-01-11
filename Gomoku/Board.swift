import Foundation

enum Player {
    case white
    case black
    case empty
}

class SpaceOccupied: Error {
    
}

class BadLocation: Error {
    
}

typealias Intersection = (row: Int, column: Int)

class Board {
    
    let WIDTH = 19
    let HEIGHT = 19
    
    var placedStones = [Int: Player]()
    
    func stonesPlaced() -> Int {
        return placedStones.count
    }
    
    func place(row: Int, column: Int, player: Player) throws {
        try place(intersection: Intersection(row, column), player: player)
    }
    
    func place(intersection: Intersection, player: Player) throws {
        let loc = try makeLocation(intersection: intersection)
        if placedStones[loc] != nil {
            throw SpaceOccupied()
        }
        placedStones[loc] = player
    }
    
    func makeLocation(intersection: Intersection) throws -> Int {
        try makeLocation(row: intersection.row, column: intersection.column)
    }
    
    func makeLocation(row: Int, column: Int) throws -> Int {
        if row < 0 || row >= HEIGHT || column < 0 || column >= HEIGHT {
            throw BadLocation()
        }
        return column * WIDTH + row
    }
    
    func get(intersection: Intersection) throws -> Player {
        try get(row: intersection.row, column: intersection.column)
    }
    
    func get(row: Int, column: Int) throws -> Player {
        let loc = try makeLocation(row: row, column: column)
        if let stone = placedStones[loc] {
            return stone
        } else {
            return .empty
        }
    }
}
