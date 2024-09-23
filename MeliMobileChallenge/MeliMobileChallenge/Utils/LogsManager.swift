//
//  LogsManager.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 23/09/24.
//

import SwiftyBeaver

class LogsManager {
    static let shared = LogsManager()
    private let log = SwiftyBeaver.self
    
    private init() {
        let console = ConsoleDestination()
        console.minLevel = .debug
        console.format = "$Dyyyy-MM-dd HH:mm:ss.SSS$d [$L] $M"
        log.addDestination(console)
        
        log.info("LogManager initialized.")
    }
    
    func logInfo(_ message: String, className: String) {
        log.info("\(message) -- \(className)", context: className)
    }
    
    func logDebug(_ message: String, className: String) {
        log.debug("\(message) -- \(className)", context: className)
    }
    
    func logWarn(_ message: String, className: String) {
        log.warning("\(message) -- \(className)", context: className)
    }
    
    func logError(_ message: String, className: String) {
        log.error("\(message) -- \(className)", context: className)
    }
    
    func logVerbose(_ message: String, className: String) {
        log.verbose("\(message) -- \(className)", context: className)
    }
}
