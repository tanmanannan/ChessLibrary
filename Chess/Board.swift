//
//  Board.swift
//  Chess
//
//  Created by Ted Annan on 9/26/17.
//  Copyright © 2017 Ted Annan. All rights reserved.
//

import UIKit

struct Position {
    var row: Int
    var col: Int
    
    init(row: Int, col: Int) {
        self.row = row
        self.col = col
    }
}

class Board: NSObject {
    var playerTurn: Player = .one
    private var grid: Array<Array<Piece?>>
    
    override init() {
        grid = Array<Array<Piece?>>(repeating: Array<Piece?>(repeating: nil, count: 0), count: 0)
        super.init()
    }
    
    init(from board: Board) {
        self.playerTurn = board.playerTurn
        self.grid = board.grid
        
        for row in 0..<board.grid.count {
            for col in 0..<board.grid[0].count {
                if let pieceToCopy = board.grid[row][col] {
                    self.grid[row][col] = Piece(from: pieceToCopy)
                }
            }
        }
    }
    
    func resetBoard() {
        grid = Array<Array<Piece?>>(repeating: Array<Piece?>(repeating: nil, count: 0), count: 0)
    }
    
    func movePiece(piece: Piece, from: Position, to: Position) {
        grid[to.row][to.col] = piece
        grid[from.row][from.col] = nil
        
        if piece.playerOwner == .one {
            playerTurn = .two
        } else {
            playerTurn = .one
        }
    }
    
    func possibleMoves(piece: Piece, position: Position) -> [Position] {
        var possibleMoves = piece.possibleMoves(from: position, board: self)
        possibleMoves = validateMoves(piece: piece, from: position, to: possibleMoves)
        return possibleMoves
    }
    
    func validateMoves(piece: Piece, from position: Position, to positions: [Position]) -> [Position] {
        var validPositions = [Position]()
        for toPosition in positions {
            let unsafeBoard = Board(from: self)
            unsafeBoard.movePiece(piece: piece, from: position, to: toPosition)
            if unsafeBoard.isValid() {
                validPositions.append(toPosition)
            }
        }
        
        return validPositions
    }
    
    func isValid() -> Bool {
        // Check if the board is still valid
        return true
    }
}
