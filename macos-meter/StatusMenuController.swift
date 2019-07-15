//
//  StatusMenuController.swift
//  macos-meter
//
//  Created by Ignacio Jara on 14-07-19.
//  Copyright © 2019 Ignacio Jara. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {
    @IBOutlet weak var statusMenu: NSMenu!
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let weatherAPI = WeatherAPI()

    
    @IBAction func quitClicked(_ sender: NSMenuItem) {
    }
    
    
    @IBAction func updateClicked(_ sender: NSMenuItem) {
        weatherAPI.fetchWeather("Santiago")

    }
    
    override func awakeFromNib() {
        let icon = NSImage(named: "statusIcon")
        icon?.isTemplate = true // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
        
        

    }
    
   
}
