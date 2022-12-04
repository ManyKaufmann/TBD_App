//
//  StateManager.swift
//  TBD_App
//
//  Created by Many & Nizam on 04.12.22.
//

import Foundation

class StateManager: ObservableObject {
    static let shared = StateManager()
    var loopIsActiv :Bool = false
    var loopStartDate = Date.now
    
    func setStartDate() {
        loopStartDate = Date.now
        loopIsActiv = true
    }
    
    func getStartDate() -> Date {
        return loopStartDate
    }
    
    func setLoop(value: Bool) {
        loopIsActiv = value
    }
    
    func checkIfLoopIsOver() -> Bool {
        if loopStartDate < Date.now {
            return true
        } else {
            return false
        }
    }
}
