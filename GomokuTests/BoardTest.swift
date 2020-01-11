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
    
    func testCanAddOneStone() throws {
        let row = 1
        let col = 1
        let player = Player.white
        try board.place(row: row, column: col, player: player)
        XCTAssertEqual(1, board.stonesPlaced())
        
        let placedStone = board.get(row: row, column: col)
        XCTAssertEqual(Player.white, placedStone)
    }
    
    func testKnowsAboutEmptyIntersections() throws {
        XCTAssertEqual(Player.empty, board.get(row: 0, column: 1))
        try board.place(row: 0, column: 1, player: .white)
        XCTAssertEqual(Player.white, board.get(row: 0, column: 1))

    }
    
    func testCannotAddToOccupiedIntersections() throws {
        try board.place(row: 0, column: 0, player: .white)
        
        XCTAssertThrowsError(try board.place(row: 0, column: 0, player: .black))

    }

    
    
}
