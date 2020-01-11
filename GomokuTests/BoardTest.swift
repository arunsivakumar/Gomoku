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
    
    func testCanAddOneStonesInBounds() throws {
        try board.place(intersection: Intersection(1, 1), player: Player.white)
        XCTAssertEqual(1, board.stonesPlaced())
        
        var placedStone = try board.get(row: 1, column: 1)
        XCTAssertEqual(Player.white, placedStone)
        
        try board.place(intersection: Intersection(board.WIDTH-1, board.HEIGHT-1), player: Player.black)
        XCTAssertEqual(2, board.stonesPlaced())
        
        placedStone = try board.get(row: board.HEIGHT-1, column: board.WIDTH-1)
        XCTAssertEqual(Player.black, placedStone)
    }
    
    func testKnowsAboutEmptyIntersections() throws {
        let emptyIntersection = Intersection(0,1)
        XCTAssertEqual(Player.empty, try board.get(intersection: emptyIntersection))
        try board.place(intersection: Intersection(0,1), player: .white)
        XCTAssertEqual(Player.white, try board.get(intersection: emptyIntersection))
    }
    
    func testCannotAddToOccupiedIntersections() throws {
        try board.place(row: 0, column: 0, player: .white)
        
        XCTAssertThrowsError(try board.place(intersection: Intersection(0, 0), player: .black))
        XCTAssertThrowsError(try board.place(intersection: Intersection(0, 0), player: .black))
        XCTAssertThrowsError(try board.place(intersection: Intersection(0, 0), player: .white))
    }
    
    func testCannotPlaceStonesOutsideBounds() throws {
   
        XCTAssertThrowsError(try board.place(intersection: Intersection(-1, -1), player: .white))
        XCTAssertThrowsError(try board.place(intersection: Intersection(board.WIDTH, board.HEIGHT), player: .white))
        XCTAssertThrowsError(try board.place(intersection: Intersection(0, -1), player: .white))
        XCTAssertThrowsError(try board.place(intersection: Intersection(0, board.HEIGHT), player: .white))
        XCTAssertThrowsError(try board.place(intersection: Intersection(-1,0), player: .white))
        XCTAssertThrowsError(try board.place(intersection: Intersection(board.WIDTH, 0), player: .white))
        
        XCTAssertEqual(0, board.stonesPlaced())
    }
}
