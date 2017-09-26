//
//  Piece.swift
//  Chess
//
//  Created by Ted Annan on 9/26/17.
//  Copyright © 2017 Ted Annan. All rights reserved.
//

import UIKit

enum Player {
    case one
    case two
}

class Piece: NSObject {
    var playerOwner: Player
    
    required init(for player: Player) {
        playerOwner = player
    }
    
    required init(from piece: Piece) {
        self.playerOwner = piece.playerOwner
    }
    
    func possibleMoves(from position: Position, board: Board) -> [Position] {
        return [Position]()
    }
}

class Pawn: Piece {
    override func possibleMoves(from position: Position, board: Board) -> [Position] {
        return [Position]()
    }
}

class Queen: Piece {
    override func possibleMoves(from position: Position, board: Board) -> [Position] {
        return [Position]()
    }
}

class King: Piece {
    override func possibleMoves(from position: Position, board: Board) -> [Position] {
        return [Position]()
    }
}

class Rook: Piece {
    override func possibleMoves(from position: Position, board: Board) -> [Position] {
        return [Position]()
    }
}

class Bishop: Piece {
    override func possibleMoves(from position: Position, board: Board) -> [Position] {
        return [Position]()
    }
}

class Knight: Piece {
    override func possibleMoves(from position: Position, board: Board) -> [Position] {
        return [Position]()
    }
}
