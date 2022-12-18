//
//  StateManager.swift
//  TBD_App
//
//  Created by Manynouk Kaufmann & Nizam Oezdemir on 04.12.22.
//

import Foundation

class StateManager: ObservableObject {
    static let shared = StateManager()
    var loopStartDate = Date.now
    
    func setStartDate() {
        loopStartDate = Date.now
    }
    
    func loopIsExpired() -> Bool {
        if Calendar.current.isDateInToday(loopStartDate) {
            return false
        } else {
            return true
        }
    }
}
