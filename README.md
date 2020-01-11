# Gomoku with TDD

**The Three Laws of TDD**

1. Do not write any production code without a failing test first
2. Write only enough test code as is sufficient enough to fail 
3. Only implement a minimal code that makes the failing test pass.

## 1. Getting Started
### Tomato 1  
- Start with  a board 
### Tomato 2 - Simulator sadness
- test should run in any order
### Tomato 3 - More tests
- validate base cases like return column * WIDTH + row 

*testNewBoardHasNoStones*  
*testCanAddOneStone*  
*testKnowsAboutEmptyIntersections*  
*testCannotAddToOccupiedIntersections*  
*testCannotPlaceStonesOutsideBounds*  


## 2. Proceeding with Precision
### Tomato 1  
- do more of bounds tests
- single asset rule (can have two assert if you are testing the same logic)
- avoid the try - have a function/wrapper that catchs it 
- type safe exception, languange have abandoned it
- type safety and exceptions violates dependency inversion principle because high level abstractions need to focus on details from way down inside, low level details have to bubble up the errors all the way up
- hight level should dominate low level


