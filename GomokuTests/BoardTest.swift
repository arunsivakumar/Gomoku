import XCTest
@testable import Gomoku

class BoardTest: XCTestCase {
    var board: Board!
    
    override func setUp() {
        super.setUp()
        board = Board()
    }
    
    func testNewBoardHasNoStones() {
        
        let stones = board.stonesPlaced()
        XCTAssertEqual(0, stones)
    }
    
    func testCanAddOneStone() {
        let row = 1
        let col = 1
        let player = Player.white
        board.add(row: row, column: col, player: player)
        XCTAssertEqual(1, board.stonesPlaced())
        
        let placedStone = board.get(row: row, column: col)
        XCTAssertEqual(Player.white, placedStone)
    }
    
    
}
