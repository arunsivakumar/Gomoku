import Foundation

enum Player {
    case white
    case black
    case empty
}
class Board {
    var stones = 0
    func stonesPlaced() -> Int {
        return stones
    }
    
    func add(row: Int, column: Int, player: Player) {
        stones += 1
    }
    
    func get(row: Int, column: Int) -> Player {
        return .white
    }
}
